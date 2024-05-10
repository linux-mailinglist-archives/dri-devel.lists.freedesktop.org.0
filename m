Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DF8C2B23
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 22:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544410E02C;
	Fri, 10 May 2024 20:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=purdue.edu header.i=@purdue.edu header.b="cccAuAdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2133.outbound.protection.outlook.com [40.107.93.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8282510E0E7;
 Fri, 10 May 2024 19:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhOp+90gZ92LR4ukZsDNarfN4pKDNYbR2qKSsQ3pGGGj/sOcJLWEg924X8S0V438ov90RwDPOoIjPuEyjiEixL0EcgoLHXWxLP4BqZVur62IOEaTVHa72edeHzEm7yB0wPmZ11D7R4EutioDBiCXHW0ujqiGpTW3DImmeaGpGUgxegBPns8GjjGbn2C0nZnzLZxt2caF/lGKq11XfODde2Bynk/Sn5U2K55o7omSmkF3XYY9KGstvTuDCIb2wgt4IaB8gzIjNcHu9hE8DHDCzM9XNrW4r36C9Y3TXP4RnU7P7OLyM67QCi6hH5NPL/OwwlPnLpzeFWUBXV0F8VsLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OopLCcWNE/5SopgzEWn+rlT6aPnD5CgKEStzINgWDU=;
 b=cTeOEG40Vbg/mseF7Q7cK4aMwgKpHTpl7WlrW4REgNOJpt5JO8SN8TrFpLSIo+5c338zqFTkW+aUt49WxjLE5HBWzVAkIt1+1uUkc5VKDyre1c5Ky5b1MK3UvU+o4hYwvMmOGQukBfC4ReOo2A2ToW81+bX4psNxKmhj9gWNAgpANWZYQ+ZBf+9EOxZXHberNUJeQox5TyZ+3FvghWF2t/ubMX2Mjvbcj6zW1K3CrmPbuUSWAfg09xhDyLc6VWOpcJujS2+JNteopQn94T4GaVFSCdmOEQMewBwR+PP7MyLwd5W5rHYUWbEV9xPyOvFXqZqKx/zUTosMgc6Y1TKw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=purdue.edu; dmarc=pass action=none header.from=purdue.edu;
 dkim=pass header.d=purdue.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=purdue.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OopLCcWNE/5SopgzEWn+rlT6aPnD5CgKEStzINgWDU=;
 b=cccAuAdQVUNYN3pMGYzLmnkYygB7hLOPxTVTX6vAw/WQt3AfGmmGkc5F+TdBQ0PjJz65nB9FJYu0AFFrXYJKdzQVuQ25BryN/ABVz9snGAxgLCiVrbktHAddzXn3Lpksm16J768T/IzA3IZ8mtBjeUMjGuMYfMVj/LW84q2hEcU=
Received: from SA1PR22MB5493.namprd22.prod.outlook.com (2603:10b6:806:3dc::14)
 by MN0PR22MB5544.namprd22.prod.outlook.com (2603:10b6:208:4cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 19:40:35 +0000
Received: from SA1PR22MB5493.namprd22.prod.outlook.com
 ([fe80::a308:2ed6:d751:9a0c]) by SA1PR22MB5493.namprd22.prod.outlook.com
 ([fe80::a308:2ed6:d751:9a0c%3]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 19:40:35 +0000
From: Jiasheng Jiang <jian1000@purdue.edu>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915: Correct error handler
Thread-Topic: [PATCH] drm/i915: Correct error handler
Thread-Index: AQHaoxG6TBQoAhaMu0CLAXku3n0QMw==
Date: Fri, 10 May 2024 19:40:35 +0000
Message-ID: <SA1PR22MB5493ED5E56E154E77AE9C788AEE72@SA1PR22MB5493.namprd22.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=purdue.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR22MB5493:EE_|MN0PR22MB5544:EE_
x-ms-office365-filtering-correlation-id: fbafb80f-6d84-4b0e-0479-08dc71290ff4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|1800799015|7416005|38070700009; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?r2p0NO2KGRKQRa/vN8cEwDS7S4dF563gHNG7I0JGQ7Gnflf+B5hKnfOuBJ?=
 =?iso-8859-1?Q?jnmnv/S0MyNspHMCgRm4zjrxG8r62P+QrSoe1BcHocm/5v7F5znvIMKbby?=
 =?iso-8859-1?Q?6OGB3O8LbM24BVzku7oCDBDiF/pfO42pk4C9yldZrVMVoz3ovW8WmUHvHc?=
 =?iso-8859-1?Q?rK+xPEPjbtn/RrjW16XubbvBt4JuOEZJYZMAtlulM+rbiEhdubIxOELqsS?=
 =?iso-8859-1?Q?9ad7NQixnHwftHkiMncfePbPTtKtqjhN1C3cj628qUDtT2pfY5awXoRwHo?=
 =?iso-8859-1?Q?t5a8fztqNkWvOgFDRRJFsF8MPEi7LK/+qkss/xH8u11tbHTtZMyxEZrBFd?=
 =?iso-8859-1?Q?1xeQgbch0Vdj06vFX9dNBVHvd7MWk1domx3PllmWhv/raNszxi34bICDp5?=
 =?iso-8859-1?Q?4b5DA/xP0txpGQwZkO+Ms+FMXqHM8B6freQ0N0n37Qq4Lq/oHJFGOZf0X3?=
 =?iso-8859-1?Q?jOika9PJqNTPikl/jfmwNQt5xva2HyTHKwkIsmHY0vk4pO30A5oTG7pRcV?=
 =?iso-8859-1?Q?ChO2izAjFSJqtSXTxDSYVvAzt/8y3Tc6/ZNwBEZQqHpPDhTuI7JSw96LqR?=
 =?iso-8859-1?Q?D4ZwkW0x9leaz5YdPyQLPEpcZoaIVI0VjUByV3urVJwVR0C6JJCXTJbjuW?=
 =?iso-8859-1?Q?I+xe86Zbr/wAyD747N7DjIS0njs+xuz91b6mDBNINYJj8ngjUOgpzSsLVG?=
 =?iso-8859-1?Q?XLO4M5K4jb2QysNtiZNbBgjV3w2y2b0c4/myEyAK0Rxbr8xr3jCGC9Ri6H?=
 =?iso-8859-1?Q?ooDFI2uB1kaxBy4aV6wALMUZf3JSbgb6yjPVvIyKGyCehvFcmGQd5ERXr4?=
 =?iso-8859-1?Q?m5Zww8f9fElFtdsWqjTfdGu1+HICL8qub54EXomUdAs2Mo67Fba2gXlSXZ?=
 =?iso-8859-1?Q?AuuquA6tscmLpptfwnkqs+PTZ8vgvzausYnGbu1NLDmLUmvfU59tVT5PB6?=
 =?iso-8859-1?Q?WN2ylr8IBfM4sWYKN1e9inq72AD1FizkDio/areV1UtFZGFLl2t+A5+dji?=
 =?iso-8859-1?Q?LmwbD2cR7Tlzj1ScnzA8c683/F1LTDyhyXniPoX1u9rGEjqgiVwn1+gYsD?=
 =?iso-8859-1?Q?IyB0oqnb9PaAjnQgCVZmbZ4RWnHqybaxI30Y+LYKDbH62REqdY9y7F9m45?=
 =?iso-8859-1?Q?WD9dh/el+5TxWwEzXH5H0C7CXxFIgW+cObj0cws/v8DDXsd4s9ekvZOdrL?=
 =?iso-8859-1?Q?EPvUFmA0PPOlrniOi2EPquKmVTrDdC9V0ZSjJGSXwYbH+8k2Jd6CZr6Up3?=
 =?iso-8859-1?Q?KZTpwPGjMSBKjVjySioJ+NvTONWtRUJhDo2Ag9xCoPPQwletyQFglbD7NU?=
 =?iso-8859-1?Q?SucDnWAGXAt5eK8tYg4/wQw9+uNqusvjg48wCyRoup5HTbtleZ5VIpjjvA?=
 =?iso-8859-1?Q?Ouwe37D3v54uCbL6xV1J0/5OD4WRc+PQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR22MB5493.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?n6YrBLDvtEhGRaQPco1NwjrHdNiNrJ9LMDruczO3YoTukeeVDkJZzSgPj2?=
 =?iso-8859-1?Q?9HXQyMXWMhWqa6WzzmLCebkDXd5Smvjk1zWbR2WFWXJWwhPB0X25SrNjT4?=
 =?iso-8859-1?Q?KqUG2AKpZXkQDl67QcHhNDspxWC3ZZ7tGE2qkRxEEk1S9mEzyOqsTufpHC?=
 =?iso-8859-1?Q?yu3THqUzL0J2HrQkLWVk7Sa9091TxSeDu/ydWG2cfhIN+EG0w/LtyittHV?=
 =?iso-8859-1?Q?RPUK0rqCEgd4btaNHF1RGOOeRJhp8zTV1RMjNLmkjn6FERfnbhIKVpUOeL?=
 =?iso-8859-1?Q?JOpoH68a0VZzz5pzi+r9lBwsLsV9Z9qjSFpPKt9YWBmUO+JeGUBiROyVrU?=
 =?iso-8859-1?Q?JlS7QpS7fB4SfgBhvNGX/88YcFMfzBs3cgE+9pn1F/wM7Q7Qerr+LSkjIS?=
 =?iso-8859-1?Q?wp5S8lmhxpRlWGP2AJAXPhaB1Bd18erVmNOHCggORCyLzJEH6l+k5LrlFm?=
 =?iso-8859-1?Q?dMqx+lzsuXLm61+yJUBLlSWEVor8VBEJN/E8l7Uir797Hma74DMQ++DIvP?=
 =?iso-8859-1?Q?Efvy/mVSJ8L/iX4q43cJ6qB0VAbA2hiXbeK6IPuBYMYMC/cUuntJMTM/wG?=
 =?iso-8859-1?Q?kRNwg3yqpGtgbAsJlHDlW0hbIjU8nRnQg7q6UIXMf9xTtKtsL/u2ys1KUD?=
 =?iso-8859-1?Q?AKaa6ssVx8g1ZQd2lH2NVeOF1/i6b5Q3QIc/Hlr4kk+C/mrfCWQkZ+QItI?=
 =?iso-8859-1?Q?nRTCJWEw4qoFMFCR1Q6Rippj7s+RnhSMdPQ9FBHs/IK+J+BOaT5NoPa8V9?=
 =?iso-8859-1?Q?55VgJuyUVxNQH/KVUAFfkMRlOCeGLYDu22ZWWFcvSfJLH3X8Ev47m6Wvit?=
 =?iso-8859-1?Q?N3Gk0Aw5DO1mA6Sqiu3XX4+97nkcVsABlBoYGNNOyHdzlDjQsFtxcUZPmJ?=
 =?iso-8859-1?Q?xj9T0Uu24ynVX4zKUsxNi3yYxP6ww2U8KHMitEvJI3QIRELlW3AnK2GtVp?=
 =?iso-8859-1?Q?QySZQr1I+M7JDVZSmExXDf9IeGP+Ow4EpjtLqwR61OJpc29a413cpTCKna?=
 =?iso-8859-1?Q?9PSxIowM45yFIJEAeTmreWG7xHRRsL77ig8gk/FhVOSIeTw0ubd0YAvPfn?=
 =?iso-8859-1?Q?UY1yl1sopgHXNlta7O0V10mWlWQAzFjsO48KvwtcnHHKYogvqmNDV3aJrP?=
 =?iso-8859-1?Q?A2i5dDA61fBaKG6W8MN/GQPSNv4R0THxF3mKKhvUCZ3/JCxF5RPglkSB4g?=
 =?iso-8859-1?Q?jl5LMJ+cyx8Z8JNJ4yl316x0u1YoijRVfVl/xrY8NTjhhyuucGTKXPVwjm?=
 =?iso-8859-1?Q?gAXX1Ih9xiWL4q95iDh27j740xhdEla20ciWAtoIPyyh7iJ5P5Xe9Tu9Os?=
 =?iso-8859-1?Q?6MQHAmdR3/Ia5dfmSDhMIoE454EctBmR6TDcpUqFFZ52/ZKpcmf7/tG7iP?=
 =?iso-8859-1?Q?AdgnXiV9Fdlu9+nhxqtSvUN5kiq/bKV1tWfaif23FIFlKoHE6TMy+LOkhL?=
 =?iso-8859-1?Q?Kt2fVhyuIpbiXOsLgixyfD1oScoDK4R1TmXvRs9FU8Ji7GjtS2nIdEA+Gd?=
 =?iso-8859-1?Q?r5opMhrJT5jnJLcPkbSk13Odaile17J25f8XiX3YZct+LU3mTnmWcvKZjK?=
 =?iso-8859-1?Q?IM6fy1+Nv0iNaa7gS2KU8q5Mg5khj/n1q41pE2i6QT3Or7Bnl5bw0qomAR?=
 =?iso-8859-1?Q?p6Htw+sbD6c80=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR22MB5493.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbafb80f-6d84-4b0e-0479-08dc71290ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 19:40:35.4702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75V4F0CkqSagb5JjLt4sBpkJP8FQT8EWDNjeb7HzqQ+RCp6cYvL3IPGipoB+gShkxY0lomSuQz71OZoxqWUZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR22MB5544
X-Mailman-Approved-At: Fri, 10 May 2024 20:26:01 +0000
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

Replace "slab_priorities" with "slab_dependencies" in the error handler=0A=
to avoid memory leak.=0A=
=0A=
Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")=0A=
Signed-off-by: Jiasheng Jiang <jiasheng@purdue.edu>=0A=
---=0A=
 drivers/gpu/drm/i915/i915_scheduler.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i=
915_scheduler.c=0A=
index 762127dd56c5..70a854557e6e 100644=0A=
--- a/drivers/gpu/drm/i915/i915_scheduler.c=0A=
+++ b/drivers/gpu/drm/i915/i915_scheduler.c=0A=
@@ -506,6 +506,6 @@ int __init i915_scheduler_module_init(void)=0A=
 	return 0;=0A=
 =0A=
 err_priorities:=0A=
-	kmem_cache_destroy(slab_priorities);=0A=
+	kmem_cache_destroy(slab_dependencies);=0A=
 	return -ENOMEM;=0A=
 }=0A=
-- =0A=
2.25.1=0A=
=0A=
