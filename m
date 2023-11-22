Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79307F54AC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8AF10E6B9;
	Wed, 22 Nov 2023 23:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013023.outbound.protection.outlook.com [52.101.64.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370E10E6B1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhgizPRVQ0kTssHMnEnv3HXZgASe/YEkOUzWB9Q3AWiCmdxTy1zuZSfDdZZwqAV1vaJYiVoM/UqJqckSHYJyOrbiESbF6/FRFpjRkct8cd8BFQNmoq+QqkAhSkYnPgFbKmvQuQb/GaHfFyQfEt3flCyuJA1HWj0sIuaKZ2OJb7uMJrjj/bck9ppW9LWQpsPs88YUTbReglFaGFYpSj/BdYJBrCh4b1HieUO8oSopBVoXogw0TEZ6TL1uFxZPUoMNRe/Hl2JwS9CI0YwvkdoRrSyu6D8Z8Z/acvyHUB2fdbLOYKNVsupwwx/lHfgRMjbO+bBJHru5aTocVJZWK2dlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X+iO1QmTuqf+eDzj8IyX2iYLWS7QsP/WGHqbRswu9c=;
 b=cIBsKPlVM78eIDVasf2OioIrzEAGOHe33Ea+vJbcE2D38sZLxjt429u0kRo+hNqfkTrO0KKMxJqyFxswIaYmIylzSuGk2Q06p6n1kUNxgOvjUIGk0kF/YNtgqM+rVGJPpnF3jtEdQGenk5PK0gfrYSplYDVcFDymHyula3oZ+anGvrO//65DnRCOzzqzm8aphT6kTbpZljTca/fhSwMY+K43LNfC0tnyJa0p1ySCjHp+PDBZPtr3D277kvrUeZZ3VVzQAV+KszYKYbHzZulEDTX9q5uSjdM1MNaIeE9cqkH+OrQABcvnkmXkCggPWMN3L1vnyFqtBctis/eFAT7c3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X+iO1QmTuqf+eDzj8IyX2iYLWS7QsP/WGHqbRswu9c=;
 b=zHFVLMBiUM/G+WBMqhA6ut621BLhSh9KSk9peGICK+krsrwnGFwPW2ira45xILZB5HCNW4iR09vIo/bWC/t+QnBOPW+vwH+8TsKkMOFTnkqbh0atym3neBCm4uFsm/Z7u0phlYEY/zSv3QUHGuguvvTuDJUi045W+2FLBbkZNLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:16 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:15 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/6] VMware hypercalls enhancements
Date: Wed, 22 Nov 2023 15:30:45 -0800
Message-Id: <20231122233058.185601-1-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bf9d12-8a32-4472-3940-08dbebb31e6a
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vV8vuqWHmiO/tsNXq5qrTzblLJdHv3pRDBPcRwzjVXDhW8pzS4jBMKzFu4im9QQnvIpBY8d9NnJqgbVaIIYVYVlrbPiIzW/sCMnw5UwfaSsvPlJB3hBFSH0SzolvRa2h7vmF6MM8PQ5UR00GEkaxGcqaHeB706+Z/0DGmUU2b9WRPm9EtsC5dAcab6YvxPQ/+2xtHcOmlzJa3MLKrWsc5T/uuhyjd6mYiQEy8DPL3iK3PAZZtcivGkajzex1/FB8BBBXTFrTz0F8tj91dVO8NvPO9/XptVI8Je/qEtEIarA7Hhxb7zi5xvV8bYxkm6f086FYWP3Ub7m7UuUOeCijA3fO04Qe9Mq4k/XXyudj9kZDdEFg6VvDqeLTbbbaJPZBBsA07UeTtuttXLW4uI2RIbWmYch2a7uJTDcjQFCfMcCBsk2RXToOICQejlGd7d+IzXYKZrRgRkzdguEDax3GiKAoTSQyUP/aS8xxu3Q3oRRpsgbQYXDfbe8gNv7xRXndFdg73lDuPyC5zQgAvRxZWj4SqSccojwAdwYW/sM6ae8T1j6kYB00BkI9QFBFHqrkR3Vf6UL9lJM80OKsliW0Q64id86G4c+RDtTRChxaTpczZE7yDV4szHi0UE06xAPjafYKt0DXRgzcKekucG3c9tkXbSNoascTPiL2+WRh8CkdYRdz3UM8HKnMX4pNdQ/r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4R/D5TldzVrLQcJvetj83dPh3Q7JfGEwbPFVJCYDs//ABIt/01A8ReAav6E?=
 =?us-ascii?Q?DZVhI0AaDYahZWOAHs97APnw5QzeSApbGjAderzsmmwJf1Ma6Ucl58z8fBCA?=
 =?us-ascii?Q?6OuqsK73lpBtOh7RMPzpfXJWBSw4iFFLwXxfD+yh0j91SBS8HHVVBul2FGQN?=
 =?us-ascii?Q?BCXMWKRpN1mrSjS+ixvebsB6r3TEXVJu0f7GZ6Mc3xEk0QD/bQ72TPq0zuHx?=
 =?us-ascii?Q?PsBl/8QkaiSP73obTw/IG1gRn5Q7D3Q2hFCUcJXBh7JXERd0le6o1Dwxmb5S?=
 =?us-ascii?Q?NexQwpNYRYYYxPNVoUdFrleuUBg9BzHitrdMvcyFJRJyAWmhi+RDxntjw0V/?=
 =?us-ascii?Q?kH21K1oeHal98IbUFwZ9duH0nN6ZlEaCISouHXxiUOxhW8haJjUUWfYwtiWM?=
 =?us-ascii?Q?YWVvcWBWiZARc92s2dy6uKn+TBCkA75XWAEndvOWGQqYv/squHa8cSPvLqXN?=
 =?us-ascii?Q?JwAXyqsibeOe4Yt3hAu5Nzj4OnAxwRSURmtpNRnX7dvLDS7sJqVktI/tbDyx?=
 =?us-ascii?Q?ZHUL00lseM4VLTb6xpco2dky2X5Cgseokt9Ibpnu7/RDMvA9onc9qFhB9acX?=
 =?us-ascii?Q?SnF07NT15YHQE/P22RPjrdPldJeBiETdmXa8k9AiArO5Fjj8AFfcr6w2F/L9?=
 =?us-ascii?Q?fJBRrJdgpqFs1TC2ccsmid/KHCBdMFYLOXRktQze2uPMZhtQRY/YH08aS1WK?=
 =?us-ascii?Q?IsTQHtbMi3AaW3VSkMNvIO2RifNxTC2BBE8ZSFOtaZfXGUtQQiDNRcvIw+rx?=
 =?us-ascii?Q?PmezxWU4xuTVvUidboTs/O66Y8u+0sVahdrcUd0dczxIe2QVqkyEdqy+soDy?=
 =?us-ascii?Q?GIjbKJMYt5QGvPrXQDt1M6E8Z7BBHlJoofWaOxd0XZyo9GppegIuoGtfEJ1w?=
 =?us-ascii?Q?Ad6aCA/CVvMmZ2XGpIzhaZKGuS7TIVKdWuBFBSUpjxLEaGFi7fMKcp78+Gjf?=
 =?us-ascii?Q?vBYL9ZGgUjPp22TxxItmCHnpjocxUM3DfpyM0jRp9HhnqY5mcBrTxh4tHnw1?=
 =?us-ascii?Q?ewXiWUH9CuRQCSQcaO2EZBsetxR2Lunsv4n+vb05wXnaq573gGCaVfPDldfy?=
 =?us-ascii?Q?HKEW3JdE58iKgh2cqtsW2OQ2nxrKGzO0w2EdPC/3y2qkBPX6fU2POwWDx9SE?=
 =?us-ascii?Q?2f8KR7xh5vnJzkFpYztjqyfxP4LpcIhuGj35lO1XABGbSK8HMiujRdkj/XMz?=
 =?us-ascii?Q?p+Md8pZxFGD1t6944QKGoagYAcb3H4cTPFZUWOgj2w5Jv2ObltVaFAzhhxce?=
 =?us-ascii?Q?5CNVZXttIO3i5TM3ANk5tX5znZvxGOsnSA6XTZ3md8NiBMEDa19d/6HUcyKn?=
 =?us-ascii?Q?IptSFL2TGeKYoLSqrqUp12vtiDzRjAqa5X3gnzKc+j3UlZ4eNDf6MU5RKMS9?=
 =?us-ascii?Q?JvWcbqSt8CGIqmbtm6ep9Z0ZiESql+GTeTrDa5FRhbUh+Mhp1+dCrWN7eq/n?=
 =?us-ascii?Q?EUgqElx3UcyglHG9/6in8snIcY663un4doSh8wzEiLgcCLp3vku/L1rgwLxV?=
 =?us-ascii?Q?AMjNQhLc2t4PvJ/Z4ebRtfUXG7L0rXiUtK/gGHFKhZ+CieKR/Mk4uPVZ3ORP?=
 =?us-ascii?Q?1sxjdj4Iq/JQdcSrMGm5AtNi19UqYYO85tnHl4HV?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bf9d12-8a32-4472-3940-08dbebb31e6a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:15.0662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fkFUwQ3dw6DF43LdPfxPVB/nAXYEwlf9eT3XOMkNKR8EziizpRAbrAMN88asZMUQ7XlAqKFiy6sSKsBY7XVCw==
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

