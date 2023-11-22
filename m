Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685DC7F54A7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6D10E6B5;
	Wed, 22 Nov 2023 23:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14810E031
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWwDobhykI4c82ESKu8MOQMYcI72cdW/wxFAkL+4LjR37MpttjaasZvGBWsMH9U0r/XrSSYmH7+n+7IMuZR1ZJlo0SHLpu96+r61OENfmemlIGGVqhS2dn4X/6YE6X0LB2Qkqn7CyW3e1ooR9OluWfz2z6E4H2OVRDS4b4XTf6vfOU75+qYsMB717Nf9Vt9NiXUt5G5bM3FOVAb0S74cJX86pzneRA5BqmEsemMPMUfo7aUd35p+c/HL3P4EYOOeWyUbaMyxM1zo9geal/XEidAchrhqnCFdzmaUezI3sM1vp58sSLjwoTdFzusn6JNNf4rIcJcb26H9uhd9EEcn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X+iO1QmTuqf+eDzj8IyX2iYLWS7QsP/WGHqbRswu9c=;
 b=SOPQs6SGTe2RrE1mUfPxLxYW2EPMcyEMKqD/Ja1bzIf+DOsfvKTdIepPfDkg7XKsqrG2M3tJT6yAii84yLq74n6z4YizcMtWTYVVE6NqfoTQQbYlXSV4GiFeT0Kv0XgumbnxqxLSafj/bFdqa58iJmG1HnI4G0gAaWa45n6EAJyRdzSdCtKt7nwZikx8BUtPfyxeiBHzz7PhIcWW44IJRmiltYBjTBzbfW5cWdoTLsOgUTxqPfwwHX20k9A/ZF087cKZIwM7a36Mm+Auz16DhsWdirajbi8T4y4G85y5j2ngLYHpiY43fwuAiiEhxGcf03l1H2V1ZQA7FfVl3aGDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X+iO1QmTuqf+eDzj8IyX2iYLWS7QsP/WGHqbRswu9c=;
 b=RhssuDmZNUMGK803XQtWzvBfBEIx4m6/IMuF/48AsVtFE8Bryzk9KPu7po1UrPBCppOR7lOB4qRlilz4Zxhi7Zt3uZCckwOHNeu882fnB0Qhvu73PqUL6yTPBd10zfvXYc7ZMaPCLbk03DNYuVR1R9oWD4pJ5UQs77CW3kRnXSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:23 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:22 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/6] VMware hypercalls enhancements
Date: Wed, 22 Nov 2023 15:30:52 -0800
Message-Id: <20231122233058.185601-8-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122233058.185601-1-amakhalov@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: d60b3dd3-f95f-431d-9c4f-08dbebb3233f
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6Z3tqK2D6JsjDvPQCE/Ten8CoACdn4xs7EQodYH6WkjpPkpyjz2ad5s3w1q81GPQHSWDU7qLrtzEfIhs5ZubNafzyamgsArIIbIATE4pni5N9AoeJHVeoZfNeUK/xORVQGqrNKKMUAOWZv1i107hK90/94/no3J+hjbOQCX4QCzPmQNFDeUFM8/gXc8a4XsCK5xxis/RaAtzNNXAEKC4eyAZ11k9gXzLVILCJrbPbY8FFtA9AEI2G3/YThN83C8fkak3wvCuAaE4ilASzsLneGbc/lFZgrN1bsCqh2pG+He9ivAypbhbP6wDQwMS5uZOEI1Mnlp4KTz2HIEVF/6j0oCP+dlOdZvuEK+x0C9Q7GUV49Nj0vPT0bJ5z4kz54oN1mlQeUDXquKlhOcRva4kVUtEuvabxLDhh89GmmTN+pcpY9csmGqJ7mqhyIwCVBfXO4xLcT9mFHuruBpTm4LH2NxkvjWFVFYp6tA0zCzFxTJMqkAdb4MArAi34MZGTtXOLCB9wkGHl5NaKB4lVXNN8yAE6+ONOd+jKGqSwvPpAKkpEPbSFO36B9K5/cmplDWHHqPODDadRbGYxMDTGEcKP7Q9i8NnnICAuUQ2zO3z7E/4zQMa/mwvOYzaGPI+sAjxGIDDBQl0jw5i+hEZJ/74e0/z8w6dlmP0pN70Rxi0RLPjk5nKkdMB6V4X37MvMSr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jO2UjrnZrwXRopNAD3WaFlbDOod6Qp+HOHdf7kVn4LDrs5UuN5yXPgOCg17y?=
 =?us-ascii?Q?UWunSr51I+P2Co5+MJNQfzzzth4bPMj6Jw3gDYKXk4S9oMrKkwdu+oEuU3ki?=
 =?us-ascii?Q?kdTbQBE97t4MkYI5S0j66DfhIFv8Yl3EcO3UzU98VI0rlX7lgCSMSfrai+v2?=
 =?us-ascii?Q?tecvZAkaFH+EsexmBBDSdMtCc4dQAn/NQUEHzK0l9jlgLKN/jZbl+HaOhlPq?=
 =?us-ascii?Q?sfClsdfXuSnoCP46B8oN2GWq8FA7GXGK1deuuwKFiogfI6f7ssk2kmQqbuOL?=
 =?us-ascii?Q?aWboscmOoVlzVO9ax3R8Ba0lAxRYjP47Me44NaxbCzRYzpqZz+qkb9o8fi1a?=
 =?us-ascii?Q?AYcX+LtCeyp+x5Lgjb8WueJEj5bF8s2DWeIoRlVfDk0V9nJUNDVIP7hBawuP?=
 =?us-ascii?Q?JAvCP8PW2mmurBQ4Tjm1CttyWGDNXmoRcflFiAHKS+/keCaR2yLZglTAD2Bw?=
 =?us-ascii?Q?cx7p4dw4Y8Vi6X9KTxFRpSNSPORLjKwhsrZXtkq9gcgt+wvoYWs6QLWmsQVp?=
 =?us-ascii?Q?xXxNkfJJdBufJaFlAkOtbJmBmP6lVoE53YqJKuNZRAFtmJV0MbXS7q2ud1m9?=
 =?us-ascii?Q?IJWO/jJTt/xlTSK1C6IfJxGDVs8SFg6w8RxlOFdqg30tkxcIo3ZNxxsgteVX?=
 =?us-ascii?Q?QpRGivZ6JJ952DqiwdrdtplUg4PibG/h3B8yznntuRFPP6FRXBoAbjjwY9fK?=
 =?us-ascii?Q?rP7ITBkS0s7Bpw8VJNCEkvb6fRqdxhtCq+/QibCOelH9O3IGP1ABEL/xknI/?=
 =?us-ascii?Q?5T2+o1Za3xwIIQZ9fXmdhj9/XOprZlAUpI0wbScRUIUO60XgH7ydkVxMydhx?=
 =?us-ascii?Q?ShZ3KuAg0imCCXM0VBQZ2JaivoenEO3t24QHtJqAbuGzq6fxn9is3tdj1xWG?=
 =?us-ascii?Q?jn1IhipGjGkgKouYWpztxCl01avELJq0uqWBjrMrKfl8ijXRlfq8IAePCrif?=
 =?us-ascii?Q?oaHNpZuPVT/uPI39oxmeyrJGx0YZ8la7N3CSB5xc9VjsB4nke+jUz0pY+HI7?=
 =?us-ascii?Q?cFrXpTeGlBleOiYSKa6WJ4lUlcxw5PniD6sQbSItvObGzg0abo5pjve6duf7?=
 =?us-ascii?Q?1UUkwCfajjDgjtW/XAPiAXTGxVLKQWOXCRRLPuPcmy1tCNiHskLfe9Kxpwc0?=
 =?us-ascii?Q?tljAk+EGS8BG5htsNdFfaylZC0OhzCr/o5lprzZ/bnn1GLOwuatHUdKKyyf+?=
 =?us-ascii?Q?zBBolRhg4hy0VPqGQ7t+tI6B+VZdQXECks2YW5FB/RT6tUOaF1ctcQHcEkTn?=
 =?us-ascii?Q?SruCiUEq8J6JZl9ySAi5MCNzUaKrO616pdI2NKGk8AZKxuUw0qxE7+WAnhxz?=
 =?us-ascii?Q?23eqxNKkdaBX23Q8FOv8BtuPJutyuwiQDj/Q2dhctCZatAU2clglbAmgubNR?=
 =?us-ascii?Q?HXptKsiBXQlulunmPuWvHw/JNd/engma9d+oPX/eNA+C2RLdRcII2jVbbm2y?=
 =?us-ascii?Q?uhKOXbdIHFqN5i87wPwpx2NS6gEYRezoXVI1U6TIahGrQlR88V/7Od5p1o8E?=
 =?us-ascii?Q?eJtuWeVm+6+JhPD3etQ6x9ukBO2s890bNa7YIR51fKwxj9uTJ4LGG0ffmZUp?=
 =?us-ascii?Q?o461TM6iJ4TDXVDi3EHqSSO4QqkYWr9du9y8oFQ4?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60b3dd3-f95f-431d-9c4f-08dbebb3233f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:22.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+/hnWadUhhW37UQD10d45gvblqBUUlnaR2URb+oftf/7iC4JBEV2fln060YEfx5yNxBl2Uv15/hmBCb2lXLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8275
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexey Makhalov <amakhalov@vmware.com>, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, dmitry.torokhov@gmail.com,
 akaher@vmware.com, linux-graphics-maintainer@vmware.com, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VMware hypercalls invocations were all spread out across the kernel
implementing same ABI as in-place asm-inline. With encrypted memory
and confidential computing it became harder to maintain every changes
in these hypercall implementations.

Intention of this patchset is to introduce arch independent VMware
hypercall API layer other subsystems such as device drivers can call
to, while hiding architecture specific implementation behind.

Second patch introduces the vmware_hypercall low and high bandwidth
families of functions, with little enhancements there.
Sixth patch adds tdx hypercall support

arm64 implementation of vmware_hypercalls is in drivers/gpu/drm/
vmwgfx/vmwgfx_msg_arm64.h and going to be moved to arch/arm64 with
a separate patchset with the introduction of VMware Linux guest
support for arm64.

No functional changes in drivers/input/mouse/vmmouse.c and
drivers/ptp/ptp_vmw.c

Alexey Makhalov (6):
  x86/vmware: Move common macros to vmware.h
  x86/vmware: Introduce vmware_hypercall API
  ptp/vmware: Use vmware_hypercall API
  input/vmmouse: Use vmware_hypercall API
  drm/vmwgfx: Use vmware_hypercall API
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 327 ++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c              | 101 ++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 ------------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 551 insertions(+), 520 deletions(-)

-- 
2.39.0

