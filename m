Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A607D370322
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE616F5E9;
	Fri, 30 Apr 2021 21:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F4F6F5E9;
 Fri, 30 Apr 2021 21:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxMA1mgt4IW5mjDAAxEZ3Yfhb8rx9BHYmHVctJWnkBIwLG7RUPtUZz4Axn+W2D9gphPpGFkb17R9FWBOSNq7U1eWnlQ31o8w6kYw2buV3YhitHIFyQklIgX2OAaxxOe2WvQz4M/48nKHTs3IVdzLhwrb0GFGb8kTJ+CKPJcprBHSxV5RhJ3FDgenLozr1BvWC6mI3juPGJxGFMxDA9fFlerb6+VRcyOThZ4JmizwjsnMBYg//7275eb0JZWK+rRbJnxVyCq5Zd6zOqOD6JJRlTGHL82Ni3JDzMC71iIxAZ5jqbXwbLM6EMvkms930jJR7cgEDTUquqAcJ+otH1ViiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40gy6Le7pFje+QLaqYW5+/yolgS2SRUvsyDnQG3VfzA=;
 b=jODdy8GPIzqQinqVgHjfwpR/2XRD1+ZrnyUzmvtlaghkrwDoJJ4XNzjs5JwtaJ0SZV1+Rt1pnamF7qAjydpVMhmeS8DqwObVoWLYJNc5FYtUbZDtA6IOkflhdTlab/ifbnbrlsXR7dIFPAbqfCQTiAVFL0ZTm4Lo04c4Q4SExyVFAkKTwAvOA9qZPlBOPgYLqT/Dj0WNCsKYlBFSryLRLPmTl4lUAL9h4nOMhoPurNn3nlHMEY4ga73/9Qv1x05Njfyk4/mBX2gQgaspj7EdLxa2Plmpd5SHHKp9zssnRWJmtCyoYS4//I+pTMfZJuxta0tyWd2Aa3xAMrYHVRi4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40gy6Le7pFje+QLaqYW5+/yolgS2SRUvsyDnQG3VfzA=;
 b=IoQvXgKAC/W8TPwmdd5i/3TCZ9oNM45tojl3+nun8zb32Iy4/PtC1HE7h5axrkgqy+4lULGyjW3loT+aoWECdzkbUTaDYS3sm2xpYCuo5jyIfgRfrywlEU2T81BqD7PD+uyu1zsND/RGAr+BzXCjWTlzCVDgp8dUapWLU9RLGWo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Fri, 30 Apr 2021 21:45:45 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.034; Fri, 30 Apr 2021
 21:45:45 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/1] drm/i915: Use the correct max source link rate for MST
Date: Fri, 30 Apr 2021 17:45:30 -0400
Message-Id: <20210430214531.24565-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Fri, 30 Apr 2021 21:45:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1939d099-b923-420c-cf9c-08d90c214f49
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB421840A13656C91012140364EE5E9@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ew//E16PDKorOaRWGkhsBJvCuAOmbitACJ0PRevZ6q3tQMdATbG66pIFP2Gdi7M4cPq3vpRAyqGBFtCzj0kPqcYtA4BQtvwTPbArFiYwkJ6ZctodM5Xd93Nha1K/FALe6hzAJzv3iUEen/VDPO/n+AKA24QUjjSRXLerqdXXl8pbMmAWiEK6syy42rRE/QuU6bFj2r5MjcEo6h4+M/QHbsbivL+F4yELQMUzvn+A2gk3jT5OoVoRCelBnDFYpOAyYoK0vXBnicCiORiqlj3E2J0o/Opc2RZIfEHcYpwdwJuFrVd/seCckPWcloIdf6ykNicW4X0EDNLIz3CdS+Z3qMJg7/dcnSSGy2pvWwPsi0yGk8uL4lRW0k3ChKGyEyX3lJawqro4ITBoo937uZF4tANFTAWdngGndbAPkIF3/6h/JIllRU3Kg7MFvcxHZ0elTnSP1g4nsZOYgd6huh+qI+rf181czoXsAiWLS7V8UvZPJ/7Te5cujfsXjFrGTwt/HMJTXCKYptml335awAxYxVqIzdkCFnmoSoYdgQ3O/awtbEQ7GkpFZqgRgcebqi9baPnvaez+0lxBZtQA13LKdIoB4MkTU+fBglIqgZ7wRh4jCVxxR07pZkmJFXG20KHGZWmcc9IzGzIL9NX97fFLkR3LPemU9WlQkVDZ04DJdWEVl8QTn6R4zoTKtwYo18Bi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(52116002)(6506007)(36756003)(8676002)(66476007)(66946007)(38350700002)(38100700002)(6916009)(5660300002)(316002)(44832011)(66556008)(6486002)(26005)(6512007)(1076003)(2616005)(4326008)(2906002)(4744005)(478600001)(16526019)(8936002)(6666004)(83380400001)(956004)(86362001)(186003)(266184004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ju0iHm03XU+dm+YyS8nlx1UJYsj+xl+w+G08Kpz4C7nIZrdBb8Vg0PWdFQPF?=
 =?us-ascii?Q?ty1bwYmxD862zl1Ns8BeRANV5Yh4UpVZLIh3g2CcSiOO7Iqks5nCwm55E6Cn?=
 =?us-ascii?Q?I2d4sQBQAQySg9MyqWG6hpwejTo9KnLhVr6rrnahe7MPUg5l77uzdfc9rPmT?=
 =?us-ascii?Q?IvcAWFz6Stp6dBF88m3QUFhCta6EE9xf9u9nWhduNc+So6OIgWaH2tSlzyFt?=
 =?us-ascii?Q?ZQb4XTtGduqHXMNdPtLM0BB8rQl9y7qZikujVAs17b9MyBxjGBFxBO1VNJpI?=
 =?us-ascii?Q?on3dx3S1pmdj5jvt6nEUqgHn42nUrRagHtwXqYPE7dcLjdj9+ey+xpCGuq1u?=
 =?us-ascii?Q?yrVnYFFAvF+AWWkV0//r0KoiOkEzvCtOJ8k5wgGB5/dnywTCuxUEvdjd1AXQ?=
 =?us-ascii?Q?6OhPDzqR4pdGVniZvHO33JAesYpTYeukeN/OcOnawf6oaHXrCh27C02Vh2EY?=
 =?us-ascii?Q?HmS8qaXoq1RFFIkDvs0Gf9W8arUoVBb1ui179pQYyX6uq5UWvj4ploXgtsMj?=
 =?us-ascii?Q?eNhCbrHePMwR6ry8bSLJSnzlTxe0hpQ+t+N4aZt6dkHYTB+TZsr2qCxWQuqI?=
 =?us-ascii?Q?i75Ex69+p5FcnCkgkaWeegZlQDN1qlwURCXv1mqW0LqTzjO3JSwXQ+Qe6gGY?=
 =?us-ascii?Q?IiSoq4NQD7OD8S4496RgR/DuwOXpm7VgTyXgNB8gtfIzMHBzRdec0qNyxJoC?=
 =?us-ascii?Q?04txzHaT03ByQ0G3kCLhDucj7bU5rLKuYe86nA4J1mw0mW8uLm2NQNnvgyXI?=
 =?us-ascii?Q?/k8ym61MjBEsv2mGsTCXKvlpnmkNvCQWpf9l7HZIyJNRGuSOXZ+TDq5RHNWW?=
 =?us-ascii?Q?2pex1dJqsLZBtp8PHLCrertbvSmXIHCAPswPK7mjLPpSeT2fhHCHrQD5JQ0b?=
 =?us-ascii?Q?vPBOxsXUKII9WjHe+GSBkjhygguJm70hRPQs6Q8RN8HMxlTxZPlkAT1L4Xsr?=
 =?us-ascii?Q?JsnUj2XLAyggpDBMRBsjE301EAOXtGkxBRR94Gnjxzakb6WgNE/JG3fuU0gI?=
 =?us-ascii?Q?6aYJ4NnoZyI/+gnC48QPJKfn2JWtTmDMn7fQpBI+v3rJFV5HimoySL85Halb?=
 =?us-ascii?Q?ahMzMTH/l0cFD8n6pvyyTFzY9/gQ4ta79PeNhv2swknm2lH6X2SBHTzYlE6R?=
 =?us-ascii?Q?XZobxSnPN3UFKS+m2gT6fALqnadJKKrBcj+wX4tKZEYYI/XTl3VQJ5y1sBcT?=
 =?us-ascii?Q?dAN9zp9KVTx2EWx4i6FbHCYbI5iRnIPBos3/qHZ2ndYRP/xGtXbnAmIsbmAz?=
 =?us-ascii?Q?x725pH7X0sBKPxRYgt8xbKESNCOBxzh+5MITkbPxDbGjag2nyI6Ggca9zVW/?=
 =?us-ascii?Q?DFfRFlClZRatoVX+A/g7CxLN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1939d099-b923-420c-cf9c-08d90c214f49
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 21:45:45.5026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLipDEzkJtX0Ah8r3/pQHK/4I/laXadGGO/LauTnq81yMhJbUlXRFjTuTlmJGU85SmtTZDJk+BqSAUyErwQBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow-up change to fix incorrectly used max link rate source capability at MST init time.

Change history:

v1:
  - Initial

v2:
  - Use local variabale for improved code readability
  - Fix the comment to point to the correct sub-directory

Nikola Cornij (1):
  drm/i915: Use the correct max source link rate for MST

 drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
