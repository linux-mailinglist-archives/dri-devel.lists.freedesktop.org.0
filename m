Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491ADAA7E57
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680A310E32B;
	Sat,  3 May 2025 04:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cjPgxYjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2163910E2E4;
 Sat,  3 May 2025 04:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2dkItn8PF6T/L6NVwRsgjqAobKw+kqkKhorx+sCWhF/DmJlXvKghnaIpNjT6r8mpOC+hKt/POpIUrJ25cQZjXAULBBJ4tbAJ9OXGBOb88Tp+4VF3wO50JFk0YJijHnqdrJlmrdRIFUv6hU7ZD+X49BSzIfmHmWNEnD+OrnOsMnoBTM7ZokXO54Fh6DvNIFQjS5zklWa3FjTqmaSHkk65lYaCx5EfKOLYNWFzSJpCRe/Yn9pc+6R4vx2ACbHJSI6c9r1mCf6i9+sPN3aZ3qZ9s+IhrPDyxZI6rA9gupbYXXVoMOKnt/yQe6MU4jwPDbm1NIren6EUzkN2ht9Vf8sJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJJjYPq7YjhCCFoKY5WRYVF00YL8/1WCa2GeXBHE4xU=;
 b=ktXwAQGyPhbIF/6b5FD6DVlmSLVHFTuAmbWQEvPB4Qhs9+qqz9YFRpefjB+OWk6/NVw7VUQzexwln5sgBq/g6ryha8vW46bZp78OmsTZd3GuuMpzPl2u3RqZl1ZD47heTXqhBAciNAHMFCtVWr7FjfXYzqog+eqrhWqyhwbyaEN8oA0RXASzSPgzgkwRILJ6kTJk2EEsw7EACfKA3Fqg6Dl8E0T5H8QeXpfGfFII+fcSDpDeYOlUGsVjnMpDFiT20qbW7/+1WWEIDkxQ/EO9fLk3+gBKvFYn0EMp8AoF0qoSCW3dTsfNyPnDBFKdpqCFdC37ondjzUKGE+Jm2OyE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJJjYPq7YjhCCFoKY5WRYVF00YL8/1WCa2GeXBHE4xU=;
 b=cjPgxYjIGxwchM0NGhGI1/P1cPK9DxvqzXVlxQEeY9F2Jz7c7XmlJKNdxwx2B9YorSVK+4quCx44IEZYLIXjlAgIalu165kAunHtiAFiwl6dgyarreubms7Gjhr8H9yLngCPWXKfcEYma6kkca10Q3zQfPLKy2JcdcOAL2u8IL8gXwHOE+pbGPlVkhraGUSArJ1BgUeuQwqGU0UG+XDDLAdxRzvpfNC/AG7Ga+WseIDhY0kXqlfpbrt5d11sJ0aUPlGk2V0KxRDD7F+QCcWQb9Kh5WMhiBZ7utj444Ra/UgEH8pVHWtaeKoXx6JBREw2XOUaIcL7Iit9VhKGbXj8bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:23 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:23 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 7/7] gpu: nova-core: Clarify falcon code
Date: Sat,  3 May 2025 00:07:59 -0400
Message-ID: <20250503040802.1411285-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:408:fb::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ca6ca1-7f5e-4623-25bb-08dd89f82580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0QVTLBIRN02DsNXEau+kUdxh7jQnY8S4NfBPGd9mB/gVwNUCb8LsCZg3zdL9?=
 =?us-ascii?Q?PoLrDmE1ddP7T4xTc3kxnS1i73EoVm7RMwxTo373G/LI6A5VidCWPc7bjo0N?=
 =?us-ascii?Q?Y03yn7ck+atqct/0bm94zHQvZBw3Fsc654IZWJRWOYahOTg5JvoxYqPP+Geq?=
 =?us-ascii?Q?/3xSZjbmXPEqdRpFfpI99cCHOdA1LH+yYTUp7YghdK7SdeaM+/rMQQ9n0xGY?=
 =?us-ascii?Q?jWRWHf3gHdYuRz7OgL/WQlNYveqzuTNyEcUznMB27sMmO6NE2exeYojVnWvm?=
 =?us-ascii?Q?nXaeKrgmyt05H9As8VClvueIzF9prlJehvgnY+CWViV3fYeAPKsmfgwtaFND?=
 =?us-ascii?Q?BiVXEB8lv0vOaHqU0m7tMl8GtTwqjIoK8rvJKgy+ypRTFuHJSj/47QjcQgFw?=
 =?us-ascii?Q?NgG0ZsCXHA60njKorzGnhyeHWHZye/1TJ+sjInrK6aw2Y1VHcygglmrEBM46?=
 =?us-ascii?Q?OVvlUzi6rdc/bdNQSQgxz2KdZm/DxDwXrp3QWAu00uij4YcoE/qTR43rudXZ?=
 =?us-ascii?Q?0HaPaZlsCg+XVo/zGpdgOTQXvq4UEc4ljjsGImMViGuTcT1bJ+yWte0wtuiX?=
 =?us-ascii?Q?xEdKjKam4fweB0lvirB7JwvPBBoDFUdgfJMopHRUHSuqo82hHSJa/SBjtQNi?=
 =?us-ascii?Q?UoNcffNno7+QYfVk7uschpICb+9rLhYVECSxbinrnCnuYMxVRcBNxeP3FWrY?=
 =?us-ascii?Q?yBGE4QUSBo0EwjPrUUbyw/lbyO3a31Oj5RJS5MK6WHQSDq0TNg1YRdC50YMg?=
 =?us-ascii?Q?gvPVXvxmEKU6V5hKnwhafJxqluhxxgJXHOaq3ge/aaRubEPAeCDNjdgbaxIg?=
 =?us-ascii?Q?4qktx5ugimcP75tl7JecZFnXmgn6d5mbrTqDUIkFjRjHdK6WadSmvGqIKuoQ?=
 =?us-ascii?Q?j891jcXsz7GKNLzeAto23+owo46mWR7hmsu4OfI1aboEJ418Ngbq2UWYW6fR?=
 =?us-ascii?Q?k3+JUoBUE4pHdHECIK/64ZbtD+Oz1HC/2BuQLl3/AkYkwRJNjBd+GvIIT91a?=
 =?us-ascii?Q?rhDyTVuUpRymd6nzkegembwbbWFiKn7eqTqYgUaFp57c2RdaTw5H/Z/I03Db?=
 =?us-ascii?Q?eI1LYykeTdJygl8YMWy5Dl4jC6BAVmEvdpCvFbkyReSjIU7lKRnlqGJl8XrQ?=
 =?us-ascii?Q?JUhIOJC4qnxIaUEXtErb2JCiHIpeir/6vNWkOenxtA8ZC4oLEM+5wml6OIx7?=
 =?us-ascii?Q?QVap7GrMCKfUIBa4xYIU/DbX4LTnE8zt3EOTqTyC+wm9nkjxezjQE4CJd492?=
 =?us-ascii?Q?GltX0UBK5oHCOq0YDSXTRhFSK/+fglq8cPvcD9tEJW7bpcX3IwHUgiEcpiVU?=
 =?us-ascii?Q?mjB5zCKF6/g419SNpj1LfW06VqZ/2ZAWp3vMB1E+IQA5gdBas416vBvCo2U7?=
 =?us-ascii?Q?ZqqxMxQxgjYqpVXNLldDsbD64zRUQCxyWl7YVQlASyIv/SD3BX2fOMR8QZKO?=
 =?us-ascii?Q?4Ez0O0OBEo8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bD/fhTM5f+m+/LrjAfkf9kBLP6BJtclKhyoe8zlbxid5IMKr/gmHoNIQBS71?=
 =?us-ascii?Q?SYKCmG58UKvSojleCC4HDGnKS10ZjrVPX6SL/qmJY496JzRnTRbZ7f1QM7bG?=
 =?us-ascii?Q?9C50/CgnnCNA4ZmUq9rCfN1rpWKDneHfjRDCzT/hOWi/d9T4e8+oGtzle7ST?=
 =?us-ascii?Q?h6JDO9gT3HwTeXJuqoCiuFiTs+zTHRIhf1O9/jSTlmXsWMZMKDgpu+oMvhXQ?=
 =?us-ascii?Q?0l6WBufdzJKneXb7hwVCwBUC8LJK2cdDpz3NebfBn/xUuNGGQZA8J9NYWxAl?=
 =?us-ascii?Q?q+mCLLzaZGm6mxC89SLOtrs0UkLN+mc7Wl+Cwn8upweO2J7bAULl7n9PjF5P?=
 =?us-ascii?Q?z69YfMCgCsLJuA58F8QGTo5BKMXf4Bx1IkFcD+AwzwqvOk9G96fxyMR26u+9?=
 =?us-ascii?Q?ifg2mmNHPMviCkJXhXRBBRc5u+NR+5TSGZJwZJKlFV0xKYKPjGFTX9Ls3PxW?=
 =?us-ascii?Q?K13yhVywquqfpywsn6UAR+mE+MgJfn79VXpphndnbVf2nlAGXylvbyZmkVQ4?=
 =?us-ascii?Q?EogFovyKy/FKlVNLyCXp4jLw3y4xewEXGvO45NypVmdauI1NkdbNKLLXmYxa?=
 =?us-ascii?Q?p4WD+Z+H7Dm/fv1AjPlKywwz45wyo8kUhiVs8Pvp+quUHvPNdkNoWUWjuXvh?=
 =?us-ascii?Q?hYGGFjMxUlzaVrk+ANV0UGxsRT1PMxoGOPyJ/Lg4UzBVE+nhz12ePd43Um+1?=
 =?us-ascii?Q?ZuaFBM4/9AkYSF/uhtSaICCtnm0dm7Q8msHOkz2KQNGSN7vBvVXsIs6PRNt/?=
 =?us-ascii?Q?nV/uSv61MhLfeOrqhe2ro+31y6/fVGoMVzNmudzj0SreDBEKnD3fjViONd/a?=
 =?us-ascii?Q?eLWPOaXvOu0xV27TR8d2ae+SryxLnyBxN2llDA3v8QciHinSGJQmuW3BMA8D?=
 =?us-ascii?Q?+o3D9M40xIiiO27Q3MRzppRHHBJyxl5M5iCOHQnWPnq3AmlVoi7PIe0ve6D/?=
 =?us-ascii?Q?ZshiddMcKlHxXIpSi9XlTjjrlezzvjqGu7hJP969tr9t0V9Y17GHpsU0QZH6?=
 =?us-ascii?Q?Y3WhTKQDbs3S7NydBx9numkMvmvd74Smiy3SADiY5sqt2x+HduVqry59cR7z?=
 =?us-ascii?Q?5vSop265lTN4+f1rGGpwLghOGLZ9LjkArh7r4bTNBUbqPkwam2o2B0MDAi7d?=
 =?us-ascii?Q?VdxOHhiL94OpleQTyq6xfANs/IN5Y6ZTK3NKgXYXEyXEZBXxqU7YLu1JNC17?=
 =?us-ascii?Q?kEtV+XGStC3QD43xORlUxAxTBis2VdJvdz4wI6LPr+qXWJpdHLfV2KvYPa/Q?=
 =?us-ascii?Q?GmJZejAWTk0DMQ5obDgjoD9qgPjvtY8B2yoFdN79b7xKB4uSabGTzibMhafo?=
 =?us-ascii?Q?mqeg36K/LimcqoyqDiLcOlh82chsGZgs3lE/haurutxMa08NoM7ZnEg3o7X5?=
 =?us-ascii?Q?TPp63A6ICmAMpddMWSgBf1l/lDYTL5fmP8OsDX0e1OL2HWTEVM/pVzKafLjG?=
 =?us-ascii?Q?hQzY2bjwfAM99Fucezi7+dnJL3t3NI3/V2a4oKV4+AavPhvcaSo/V6AL1nG2?=
 =?us-ascii?Q?8McAIHW/ywKHburQphY9CMdyhHo8ifOiaIpQr9E6QlfBJiAzxFhZLeKGnKkz?=
 =?us-ascii?Q?bCqo/1+530iFcz+rhJQ0Ttk12IGqCfq3ywP7apFT3+wwdQc4T6Rx5Yn+Gxm3?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ca6ca1-7f5e-4623-25bb-08dd89f82580
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:23.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZopAqv543i91Vn3RGTvIRhEi3k1byT/OJTJy4trVsg3P+YAfh9vLUenMYdMlfb6sLePJN9VCLqhC21RODBcRaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation strings, comments and AES mode for completeness
to the Falcon signatures.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index e9ee0c83dfc5..003db40d3303 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -89,13 +89,19 @@ fn try_from(value: u8) -> Result<Self> {
 /// register.
 #[repr(u8)]
 #[derive(Debug, Default, Copy, Clone)]
+/// Security mode of the Falcon microprocessor.
+/// See falcon.rst for more details.
 pub(crate) enum FalconSecurityModel {
     /// Non-Secure: runs unsigned code without privileges.
     #[default]
     None = 0,
-    /// Low-secure: runs unsigned code with some privileges. Can only be entered from `Heavy` mode.
+    /// Light-Secured (LS): runs signed code with some privileges
+    /// Its signature can only be verified and entered from `Heavy` mode.
+    /// Also known as Privilege Level 2 or PL2.
     Light = 2,
-    /// High-Secure: runs signed code with full privileges.
+    /// Heavy-Secured: runs signed code with full privileges.
+    /// Its signature can only be verified by the Falcon Boot ROM (BROM).
+    /// Also known as Privilege Level 3 or PL3.
     Heavy = 3,
 }
 
@@ -117,10 +123,13 @@ fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
 }
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
-/// register.
+/// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
 #[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum FalconModSelAlgo {
+    /// AES.
+    #[expect(dead_code)]
+    Aes = 0,
     /// RSA3K.
     #[default]
     Rsa3k = 1,
@@ -184,15 +193,19 @@ pub(crate) enum FalconMem {
     Dmem,
 }
 
-/// Target/source of a DMA transfer to/from falcon memory.
+/// FBIF (Framebuffer Interface) aperture type. Used to determine
+/// the memory type of the external memory access for a DMA memory
+/// transfer (by the Falcon's FramebufferDMA (FBDMA) engine located
+/// inside the falcon). See falcon.rst for more details.
 #[derive(Debug, Clone, Default)]
 pub(crate) enum FalconFbifTarget {
     /// VRAM.
     #[default]
+    /// Local Framebuffer (GPU's VRAM memory)
     LocalFb = 0,
-    /// Coherent system memory.
+    /// Coherent system memory (System DRAM).
     CoherentSysmem = 1,
-    /// Non-coherent system memory.
+    /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
 
-- 
2.43.0

