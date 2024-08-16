Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B3953F2A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 03:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5556210E571;
	Fri, 16 Aug 2024 01:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF9A10E091;
 Fri, 16 Aug 2024 01:55:16 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G1sCSH011913;
 Fri, 16 Aug 2024 01:55:07 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 411vpr010s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2024 01:55:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUuFJkP3SzTSgywVouTKwSzcRHw/wmz/DO4BQh7RuRBn3SWg97M0vnkl91EwLl8vB+iLYm/m+qV62u6Xg1CkTJWlr24N8hBTZ6CSsSuPks/65T58vraL4mmbhGbQAX2WrygE7S+opp9OEGGXYv2i/+DXnwUOH5GHC98Riu8Tjq8NcMkw7NWrK8rWMnvJ2h4hfCO98T7sEw7+fJXEjNhpEBHnzu6gSPgaYpzLa8pvv3O39kSk5CO7VVTKik76vyzkPzIyhcD6oSUvfsfTyQdhqoxIEzcODw0CCXQmT6RU4FblMRE9QiG3MKNCpxxNhfStc9ouO/6zZQGga0/jGGbSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M8NHBX8xhu2p5Y4rMx3TiQka8LjV13lCwxkTFglmM4=;
 b=sBkeVQ7wD5NObPZokSjYhvUQC927Vypa8LBU9ohMfZ7GpXgG48Zq4hGvG2QOoe6WJfslP3aWB2wC59WqjDgRgv6XQAxcevOR/2FMQyAHvcKKM0iBmfyYe9TwQ7a9mJNPAnTRsBusFLrFVwyR4qpmW+/ANdF0/ic/y4dsgKpFtfSDpJmZp5VUBY7Mqf4X+mg50UScMAPKmvXUsTcWpX7jYrJdoIxhUWMlvOnTocM927uLo1tzOVxaKeWpsBfKxi6CWCWi1H0tWqGcw8GVYcorwN0ec7mjsg1m+RPdI/J52my+/Lnr2OT528SBDUrzUXjfUI+s232U9lFwP058+2APaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by IA0PR11MB7308.namprd11.prod.outlook.com (2603:10b6:208:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 01:55:03 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 01:55:02 +0000
From: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in
 GFP_HIGHUSER with 32 address
Thread-Topic: [PATCH v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in
 GFP_HIGHUSER with 32 address
Thread-Index: AQHa6GncZ7ePmlpKHUWMY2+2oOoAjrIpLadB
Date: Fri, 16 Aug 2024 01:55:02 +0000
Message-ID: <MW5PR11MB57648F441CEDD36E614E31EA95812@MW5PR11MB5764.namprd11.prod.outlook.com>
References: <20240807013328.2795300-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240807013328.2795300-1-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5764:EE_|IA0PR11MB7308:EE_
x-ms-office365-filtering-correlation-id: 16d70fcc-aaa4-4825-877f-08dcbd96719f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Y+jGUbznl90Fuhbjfpzjug+crvhkhHMufUGaY4O6MEFiWE9KaSP/zn2wYv4I?=
 =?us-ascii?Q?710QjbI0u0sxokEQz0LvFLalfU2JXArjonIsbhzjf8+p4fF5MgjlAbKHrah/?=
 =?us-ascii?Q?+MC8VsxG8bxck64XGBSRPcj9HzOyh1SVQFjZQXAqGbdBsOos26swV399PtUg?=
 =?us-ascii?Q?UtPOS8fX1Lmob5uY6YeVH9lAUJE8r7+yn/Qw91J58nCTc0zxIN8L89P3slsr?=
 =?us-ascii?Q?Kk7Dz5d+tu9qa28kYka5HhNmLTPOIVqE7JbkstqVi6OCERsWOQmbyl4YXlRB?=
 =?us-ascii?Q?5pMgAA/J6X0s+kqWqd51v7DkvRtH4/bA1niVDAa5X6kxTRBVctZGZscZT3WR?=
 =?us-ascii?Q?nmUViP8nkqxOfZN/zsVFz7V+kh9+5YAIarvd6OzVVykCamZhBfhhUnbl5AKC?=
 =?us-ascii?Q?bJnbAm1FIbPCqGKIRr6ITcmCiHZcgOQo12s/fjfRH8LhOIAo7DCqIrBW96zJ?=
 =?us-ascii?Q?XOmk/SK48ftjm8zFv8KkcStWPv8vU7uDrFPK8SubV6MQTT+XhbkPIUZJohkU?=
 =?us-ascii?Q?wdNCFleFch+TsxEZROk0fgtCu4y8RfLrwa4SVp0HBHIczoCvEbqZJrKTPXD/?=
 =?us-ascii?Q?Yh0wUJ24tCs/5LTwvfnQY12E+y5vrzWccSSnvI853QcRCp+MyLzauEX/hg/h?=
 =?us-ascii?Q?ntknTYh+mhYOWoAMo6/Tu99aEr+IWaD4JNgo9w6LLnGbz8xLxxCFBMzQCg/V?=
 =?us-ascii?Q?H+uiN6gDDSAOQthHsMQwiozPx6ayRnFTFcf0kSPgx671Skq+OrHUQ+uH5fen?=
 =?us-ascii?Q?k0o5O0knDJ0Hgrx1DcWCo1PMkUJ7rGB7O5vhNHAHoxpO5VSah+XVgetdOnpQ?=
 =?us-ascii?Q?TKRn7mczHoYeB/yT9YbQYCUdPY4/oo4+tSqkQuMrBtPfCiL7Py/2zYdyUf3g?=
 =?us-ascii?Q?jV+zIvF5G/M6C9bduatON70wWCS+YllPJoyJXjwVIkndjp3TM+UBvf3vXAKT?=
 =?us-ascii?Q?msaWtN31XwPA6h6WDVT64yVdY/z93TU2J7ua7XNoK6cdsTPEa/7PvcsVmVKZ?=
 =?us-ascii?Q?1A2ePxrn1GDsSClW/6juWzPMik99NIqf4zR4CHGgrKB7ekHNy/paHDih3kwv?=
 =?us-ascii?Q?eAm71gZx3hLcc9hccF0/JIs7C9+MfPayqLQO29Icu48bNsukjsoF7zWGrXPF?=
 =?us-ascii?Q?AWrUmQEO2TfGs8ASQeS+zmuwLBOlNh4SrP5DhAcLUhXrqIT9rC4iC32r3AfN?=
 =?us-ascii?Q?krxDMZIkCRFkRt8+S5NAaNLgWdK15G+D7CwJVva6jAQ3qX+ypkoPObRk9aYm?=
 =?us-ascii?Q?Tv92OwQIYQaq+IL/Bqcc3h0X2ITWJm15WYX4RpCwVV3Fgesznz46jSBN/kmN?=
 =?us-ascii?Q?w5ImyWELmsGMJ5cclNIEhc7FraUw9wwO1B5e3x4U6d6QEEJ/8zrbe7lG5z63?=
 =?us-ascii?Q?S4MmqOLsGu5jl6mw8VFcOS4i/c4RMLNIMWw0rvgbBndMkN6QEg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ewv5FKtgnCwBFSbZJP4A4kerZHOXaqgB7ot1K1g0dSKlZ04rfQaQXBd3qPJx?=
 =?us-ascii?Q?II9Uztcp4h9SYRJBdDCPDIfA+QrbcGj7U0zBbIQLKTKdkljzNQKJbge5MSdr?=
 =?us-ascii?Q?CwtPwL+X5y4k8w/BFCoF3fyuu7qKhdImdgFmSKgfHOZ+ZzUx7m5w5hoKf9YW?=
 =?us-ascii?Q?cBO0RgQhsDNN/tjcN8osys+EX6BWwTUL4oGa8rB1/BT9cNsyt5P47btdYJKU?=
 =?us-ascii?Q?7OjzpkvBrVlPJ6qb3CBGAvAy2Jb5uW65ybtJiau9t5MQTQLxbms93ZeioFIt?=
 =?us-ascii?Q?DyVsBva0fmNAX5KOTSn266MXiCoDsLA99J8CS8+AyAXy5kiI08vo6qABueX4?=
 =?us-ascii?Q?C6lsdo5hjKQ1a0Xfgq/Kw7soTVwuCPjMV6XQ7gsOclYEn8ssFivIJYPowtq2?=
 =?us-ascii?Q?XYmkRiwaPUwmJdvrpl/qT8ZL8/KlC2AACyJXv3HwEQLzcJsqbgcY9NqSndaj?=
 =?us-ascii?Q?wYZtbtJcevVQ+sAA9aosacTLx6DMWAJEo7CCzC2JxbhtKynJWAG1FZ2+59JA?=
 =?us-ascii?Q?mkvSF+KZiCtEEgwd0MMhIMhcZJD6B8q4CSkXXauSXh5qhirmyUKgM/HUAKB4?=
 =?us-ascii?Q?CfJ7sJjQ8NmUEv2ALmWQ2A1dO+VDUO28ZrePqmPRRntxTysKcksWTSdHXjPN?=
 =?us-ascii?Q?+EnaK9+gC+tfqnD0zIDbiYsRaNrBWJGqpHK/7Q9BaL+pBpCuQHXLzXUVf1Yd?=
 =?us-ascii?Q?vPPicMsw+TMgWOkDQGdRS7SM9K2asVN5k46J89n3pnofaPZrat02NaUOMUEO?=
 =?us-ascii?Q?ccYnmgL/lygBC6k0itSnpOGlofHQORf1UL5BLp4D/ZEoS53gAGkJXbu0JvND?=
 =?us-ascii?Q?MzmYjA1GlQASQm1qseEJjTJVfaWO9BnCpL6BDtb7r9FOfG5iez976fUXK6Wc?=
 =?us-ascii?Q?rt+OPYu+sfw97pHd7J8LDcSLYOXxmJGNWkA5KoSESDYXPLAhHYlUB9ceAQVb?=
 =?us-ascii?Q?nlv0LPdpTd8f4zYXRl/jTouuOxu3wSHd19y+oZeMnxiSGbfAU7Dsac221cTJ?=
 =?us-ascii?Q?/lHtiw5i5CoFTSgJBnXKJn9TkDPSOu2RQW1xxX/PcWohVkJKr3NNZ0dNkBOf?=
 =?us-ascii?Q?zL4sDbzs+7MSb6k5ZScVBMpq0uYlUw5pzVEWtKiqueX544Arje6AU+A5dHEl?=
 =?us-ascii?Q?LOlRcDBveqVkwO1Zj3EhZpwMklg+qAOHdG6Mt7iG69uYIeKLVMUhPO1/LqBO?=
 =?us-ascii?Q?rErhNoJJwmEWBPo//m4Ly78SrszIznJcESRMUgM+7jErsZo6HAPk3CkyV0GY?=
 =?us-ascii?Q?AATDHMZyIrBnqGAQsvRz42gqmB86Cg8AzxmEkmWSq526XGgajUsJETaccUWs?=
 =?us-ascii?Q?PrDTVfc2FtYiUdbcDNG15vZ5Gpm6mTCqgHpufgpmXjdaLnJArkEBYPw9tNFz?=
 =?us-ascii?Q?Va/PmeyzpohkPSP9rNg2/frDgCu+2u61SlcQYpCtPE26lvCE1jzEa/yFXVM+?=
 =?us-ascii?Q?O1qfIDaYrW4uuXE2kpfz+Y75W3cmLY4Q0Xfcf7eO+V3dEW6ouBhq3lF/50oJ?=
 =?us-ascii?Q?Lgo1d3gYEhZ2Vt6lS3u1hR9Sx2/V6rRTLB6AxWXh/KzFaXsNLpEbuP2CXWAY?=
 =?us-ascii?Q?ownde1FXtbZAX0RA01giNI3yo4YVCa0aIkdW0uye?=
Content-Type: multipart/alternative;
 boundary="_000_MW5PR11MB57648F441CEDD36E614E31EA95812MW5PR11MB5764namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d70fcc-aaa4-4825-877f-08dcbd96719f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 01:55:02.8489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLKSLpmCzjvv9nO5ZEXHsdbCaq4TovkPdLRy6lhyg4O151cFSK/rLwU84j4JmPetV4hat9HZB/s7QwLiwSzGhqfhM34fmGRp2jcApAUVRh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7308
X-Authority-Analysis: v=2.4 cv=aY0zngot c=1 sm=1 tr=0 ts=66beb17a cx=c_pps
 a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=PHq6YzTAAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=BjWLi2xA-ihtoeMm2y4A:9 a=CjuIK1q_8ugA:10
 a=XeklwS_eAcELH8nA:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=ZKzU8r6zoKMcqsNulkmm:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QDmZwmSNMP2S-wev9K9I_BeOLfouNQhM
X-Proofpoint-ORIG-GUID: QDmZwmSNMP2S-wev9K9I_BeOLfouNQhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2408160012
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

--_000_MW5PR11MB57648F441CEDD36E614E31EA95812MW5PR11MB5764namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping ...

thanks
xiaolei
________________________________
From: Wang, Xiaolei
Sent: Wednesday, August 7, 2024 9:33 AM
To: l.stach@pengutronix.de <l.stach@pengutronix.de>; linux+etnaviv@armlinux=
.org.uk <linux+etnaviv@armlinux.org.uk>; christian.gmeiner@gmail.com <chris=
tian.gmeiner@gmail.com>; airlied@gmail.com <airlied@gmail.com>; daniel@ffwl=
l.ch <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org <etnaviv@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vge=
r.kernel.org <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in GFP_HIGHUSE=
R with 32 address

GFP_HIGHUSER is a combination of GFP_USER | __GFP_HIGHMEM.
Only the highmem part is incompatible with DMA32. Reserve
GFP_USER bit here, as the driver allocated buffers might
be mapped to userspace.

Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when neede=
d")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
change log

v1:
  https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.20187=
83-1-xiaolei.wang@windriver.com/

v2:
  Modify the issue of not retaining GFP_USER in v1 and update the commit lo=
g.

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c
index 7c7f97793ddd..0e6bdf2d028b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
          * request pages for our SHM backend buffers from the DMA32 zone t=
o
          * hopefully avoid performance killing SWIOTLB bounce buffering.
          */
-       if (dma_addressing_limited(gpu->dev))
+       if (dma_addressing_limited(gpu->dev)) {
                 priv->shm_gfp_mask |=3D GFP_DMA32;
+               priv->shm_gfp_mask &=3D ~__GFP_HIGHMEM;
+       }

         /* Create buffer: */
         ret =3D etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
--
2.25.1


--_000_MW5PR11MB57648F441CEDD36E614E31EA95812MW5PR11MB5764namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ping ...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
thanks</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
xiaolei</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wang, Xiaolei<br>
<b>Sent:</b> Wednesday, August 7, 2024 9:33 AM<br>
<b>To:</b> l.stach@pengutronix.de &lt;l.stach@pengutronix.de&gt;; linux+etn=
aviv@armlinux.org.uk &lt;linux+etnaviv@armlinux.org.uk&gt;; christian.gmein=
er@gmail.com &lt;christian.gmeiner@gmail.com&gt;; airlied@gmail.com &lt;air=
lied@gmail.com&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;<br>
<b>Cc:</b> etnaviv@lists.freedesktop.org &lt;etnaviv@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in GFP_=
HIGHUSER with 32 address</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">GFP_HIGHUSER is a combination of GFP_USER | __GFP_=
HIGHMEM.<br>
Only the highmem part is incompatible with DMA32. Reserve<br>
GFP_USER bit here, as the driver allocated buffers might<br>
be mapped to userspace.<br>
<br>
Fixes: b72af445cd38 (&quot;drm/etnaviv: request pages from DMA32 zone when =
needed&quot;)<br>
Signed-off-by: Xiaolei Wang &lt;xiaolei.wang@windriver.com&gt;<br>
---<br>
change log<br>
<br>
v1:<br>
&nbsp; <a href=3D"https://patchwork.kernel.org/project/dri-devel/patch/2024=
0806104733.2018783-1-xiaolei.wang@windriver.com/">
https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783=
-1-xiaolei.wang@windriver.com/</a><br>
<br>
v2:<br>
&nbsp; Modify the issue of not retaining GFP_USER in v1 and update the comm=
it log.<br>
<br>
&nbsp;drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +++-<br>
&nbsp;1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c<br>
index 7c7f97793ddd..0e6bdf2d028b 100644<br>
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c<br>
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c<br>
@@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * request pages for =
our SHM backend buffers from the DMA32 zone to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * hopefully avoid pe=
rformance killing SWIOTLB bounce buffering.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dma_addressing_limited(gpu-&gt;de=
v))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dma_addressing_limited(gpu-&gt;de=
v)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; priv-&gt;shm_gfp_mask |=3D GFP_DMA32;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; priv-&gt;shm_gfp_mask &amp;=3D ~__GFP_HIGHMEM;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Create buffer: */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D etnaviv_cmdbuf_ini=
t(priv-&gt;cmdbuf_suballoc, &amp;gpu-&gt;buffer,<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW5PR11MB57648F441CEDD36E614E31EA95812MW5PR11MB5764namp_--
