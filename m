Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CB9A1B9E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AFA10E7B3;
	Thu, 17 Oct 2024 07:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2200 seconds by postgrey-1.36 at gabe;
 Wed, 16 Oct 2024 09:04:22 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4A410E035
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:04:22 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G60WR4002866;
 Wed, 16 Oct 2024 01:27:20 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a397gc3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 01:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAfsbv6fPyuGdpsgdqDOh3uGKbsY9+IihBJ4UoX5sBjORLNU9RwzoBxvzMmonKULTw1x39Yt+YfEXPXSLYMP0BkbSPxewaPlOy7WBx0/GoMs6jkUEf6YDrWQtXby0DljntHruhBKXl0EKjIiFMzVZeOLFObgjBnWcmcDZgctxLvnlI71lCf2hVYUts+oE/iCPSHzUD20X9oLm+hrdbd5yxpmWeNjCq7gvgevb02z1TTv2/gcnV8S1AjOJcy5dhoesiJcy0Vkf/saByDPVCCRkIv3YgzVxV5rurC7XJk7YKbX0RiUGB5XvjS8OVIsA4FPUPxSxohU+4ek8jWp+GQ5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+UE8vjJbeHaW42Q4jY1dKkICD+yVPCTye5SlmN6TOk=;
 b=qMQbJjIZOyXkyf8+9jCjPisFg5pTvoLu8LFHEbhSSUydF1pEPGCj/EfevnUG5tTsnJwF4Bv0uPGLXtQdt4wDAQSAFMk1uHa4tob0d26uF0VVhWIXNGPh+GE+c6HYAgogWHTQCy6fPN+1VsuKMbvJg6Nz0wy2i8ntrbC6XC+jdDQhJsDj7QopADBVh3aYjyKsWZM2Jc0/UqQwGeD9FKMX42LrF0IFmmy+35eujj4xVFxSwknfFsT7jzhySLAcWYdDUdKo6q5ppWVfjiwARKkdFx0jutRRX+PL3jCCU0uNnR0Bu8cRbhWfGpvh0fTTFNXuhIRvoltnAY99kiWZHu3zKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 08:27:17 +0000
Received: from SA2PR11MB5193.namprd11.prod.outlook.com
 ([fe80::8ce7:ab08:1934:1d71]) by SA2PR11MB5193.namprd11.prod.outlook.com
 ([fe80::8ce7:ab08:1934:1d71%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 08:27:17 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, xulin.sun@windriver.com
Subject: [PATCH] drm/tilcdc: conditionally calling drm_atomic_helper_shutdown()
Date: Wed, 16 Oct 2024 16:27:02 +0800
Message-Id: <20241016082702.2981970-1-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To SA2PR11MB5193.namprd11.prod.outlook.com
 (2603:10b6:806:fa::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5193:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: ad660575-8db9-4327-d62c-08dcedbc588b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hGOWC6Q70cSPPj2LcMIL/yUhKV4WN2yJJdZHHu7DewsJFSyiVP/8FUJnec4q?=
 =?us-ascii?Q?kWs/xV1nTjvVunQghphJmgVrZ709lgFOYVxhPtpOOuKyQf5w3CCzckKJgLfn?=
 =?us-ascii?Q?uXOTIJGFqOgrbX+fcnvcTkKid4q7EYIQdZr4HWM2MmxjBiX0R3+nEHSwYcsy?=
 =?us-ascii?Q?Al3QKCBwgeuTzYdTw3bp2Qa+Le43YK0VU/TrBPxKzRb7o7XMj40sr/5kSDuX?=
 =?us-ascii?Q?boEtKKlJUQlaSvyzpSiWrgKIX8xIYFV1GDcwA8NuSqDo34XuLiYX+hsLzmxU?=
 =?us-ascii?Q?kSeP+v9mtS9wHh6BqNlPdr/u+Vf1NNd4p3c9UR1KyZigcnG7GXzAoc9vH60Y?=
 =?us-ascii?Q?Tn2a++7dRW2vy3siL3vbBQbA1TzdXroaHzgVeXVNFtmnjZiF7mxpWyFDkoZC?=
 =?us-ascii?Q?RBMMjwqSoN4EwiNeIPkSa7RsWgyiXwSHeT2KNIH5jpPYfvImwztpacO8rzT1?=
 =?us-ascii?Q?IrgljNYt17KDN3aH16nUbFe0K1AUJYNcqVN2+FgI5fRJPtTQp5mTD5JNd78S?=
 =?us-ascii?Q?yjY12KzJk5MOxzwCNFg9yNRWMinRTLUL/KKhuqYjvlDNafOKes8nu7YYaVjS?=
 =?us-ascii?Q?CdC6vvZvVFWetig4b8Xw0GWI2v3ya1DBybJQQXLuIyDhjEmJk+oHnLE0DRXa?=
 =?us-ascii?Q?eFa88KjXUwc6XgUfQeiBaFlmHwQjwg6w9HRMoWSW3Ho1dKqinSDeJG5kqyDF?=
 =?us-ascii?Q?qbuSHY6Gipi9mFa1liDr2zOJtFn7cS1udF/xVT/zYZyXryZAmKDOnVbf4+IM?=
 =?us-ascii?Q?jdxYwMMpO7YTQGmmlyE/UAfdfSzih/ZXu9r2yiiy7Zv1+SjV5hB9p28k/2CG?=
 =?us-ascii?Q?eUQkDveMzIzOSfztlBDj0VbWh/AUtT/WAfXU6lSqZRQd33xC8JlJb/RzJnsD?=
 =?us-ascii?Q?91EbvBeoawV7HBwyrw/PaOdDFTTJFu7zWMcvPKiCeuUeKLzyh+Y5TpnR98rj?=
 =?us-ascii?Q?nahlbEGHHOxBX7vPOSP7jolRki6m5xPqefcz0yi8QZCO8Ixtl11wdQHvTxQW?=
 =?us-ascii?Q?jj1CF+74zqZgKmZnKD8KB8aJVrfpGbPa4Dd60Z43m527ZDWGDNiLr1cnX9On?=
 =?us-ascii?Q?cuLI/+ehwE46cC1+jb0ZTTZ2LtpWW8zcuhyiHwh0hu4u296eK1WL4sHHFwrb?=
 =?us-ascii?Q?MFO7YCZs8qRHlbiBv9lzGGnWVUrYwhfxMaoM6MvXCMMVVLhj147Mlm3crWjo?=
 =?us-ascii?Q?dN8+Cy69h8i7SVuQfgZBqVr/7mtvwZWSR9J3rSBYB3f5h77lC1UDsAwekpcy?=
 =?us-ascii?Q?MbJudLh4wzuqtV9N7XURlwbMNoozQ02e+9Iwgd6HQMWRfontNdCU+OGD2V14?=
 =?us-ascii?Q?tBOd5gQhCdfhcKIBB/vD0GgJ6adVQTxKCfDf2beX2WBShQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hxvvNk/ujS9vR6kvbtVhAU63NbDGJ7lh3CvLnJsQOILwCOcbt8CUsgGlYA8?=
 =?us-ascii?Q?QRUMNke0HEMHE5ex5md+YnWnK4Yjk0Cw6DZ4GWnTooPHnaaF583Gce0yqAnm?=
 =?us-ascii?Q?HdXC89GzaC6pnI7yltTUB2/A33tXbcH9MdrkEoj4R2PixRUG7/Rquw7B49dS?=
 =?us-ascii?Q?KNrK1UqleJRxxqJrdVluHwAkpxEW5hraEOF/4YILaX8ws5e/PfWRowRXGDpM?=
 =?us-ascii?Q?nDIB5gPlzWb9HIvpLXdyCHfg3tJCbVhuHhYjTiwxWOAt43azmQvIGYP7VlR/?=
 =?us-ascii?Q?WmtgukAJ2Og9g/MoS1zTC2WjjUnHzxCw5LTObsfCuQvX1fAqaVZp+dQbGvWP?=
 =?us-ascii?Q?7Utwhx+i2MAPTWrlv3Zo+L2CzBwroTz4ra2rTRml3u5nQ2f3vjK8PVNRKe1I?=
 =?us-ascii?Q?XWooqTnSZ8hbkihknBl8sjyOcPTU2Ezj+PDyBbrq7rjvbKPu3773WBlKJN92?=
 =?us-ascii?Q?6f2BgoiG1gxI7GapCTLZDFcAGiGBH8VenwFwb4rUdZH7W/bLYW84IM9jgCOH?=
 =?us-ascii?Q?4qa2b5S3+hDTiFycqgkVNkY1JjvC8qoSFMh104Zw23ai+G1iMlpvBh4tQw4D?=
 =?us-ascii?Q?Ci8bzBY2ne2MNLy1UgbGkWTQtB+S8TG7ZISTIsul31wFcqwwFyrau/5GHemb?=
 =?us-ascii?Q?F1U3pC6ZMCZsuShSQCAmhLr/cVc96SEbBGcqrq/wn06BClUWmjjt3gM3SZ6D?=
 =?us-ascii?Q?Z1IAD4MBOylhSBbXxrGt2R39dlo13heke9I4isxW/RGZcIhZKPglt/N/BGak?=
 =?us-ascii?Q?qFNldh9bs9oC780o/0vf/zNhrqAwEhowqPm2U0zpZnnEAIrZJm9b3r8O4PyQ?=
 =?us-ascii?Q?Z7Xz3dGdA6blTPMqPfZM/Cbd2yBzmQqerOrLmt7qCmwe1FG4gOBeIWMzcIvI?=
 =?us-ascii?Q?+OMv4N/v5vDQPY9RrYZH54isP8M4zgvabWflHOPt9vH9dNEYWYjetTXhp9Vb?=
 =?us-ascii?Q?l/DB58AN1t/Lf3pWxKmuYpnhQiS+zsIvj4eQWjVM+ClRR1W0aslfiEn8pr5z?=
 =?us-ascii?Q?aAL9zVnuUoIvlehb2OTX207qZfTuhQ7r0HmmrYLIaWQyaM8QoNvXP7nH7/FQ?=
 =?us-ascii?Q?N5UFAMgcOELs0I3j1eSLDHqL/ryEIeBdmfdQS2ulK9QMUYytpqbw7rDNsqOZ?=
 =?us-ascii?Q?inPg+Tq4ZvY64O97jLaZHFTxIel4WM8UqvST/o2u6wYFmTwr4ZFpYnG5ThPA?=
 =?us-ascii?Q?Ci0x4mlmxe+YiKEYnMkWwO0/0aM28TUh9KdjiiCFrcm/YoTacFW4XXPW6fDw?=
 =?us-ascii?Q?CnDlVnKoaPdrUT+0ShTbPq7S6NKpIOkA9niGD0M9e/ISUNJqwhwtFTzvROtS?=
 =?us-ascii?Q?Pya1SVG4qNFCyjGCq/OUJeAMFKinHW+n7xBfOufJOwGybPSX6N8brMmipx+n?=
 =?us-ascii?Q?Ny7/jGAlvXbXlBpF0dEj40AH48SBbcc5Oj2ymCbFyy3FAQ7lNaiIH4BGY8NO?=
 =?us-ascii?Q?6tiMsb2T/qcvRIFQ32Yhf2N9SKqoewAtmGwGTPHLJ51o05XQ26jEADhgj2Ra?=
 =?us-ascii?Q?Z3tAP9gKXQn6RjNi28WNsmrQYWeOYxqr9Zq+LgQuFf7qbfnN21PAT14qVYx4?=
 =?us-ascii?Q?ed2+xT3o2txhWxymh/Sa9Un3Sn4xMPwEgdpxonem?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad660575-8db9-4327-d62c-08dcedbc588b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 08:27:17.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AH2AWW5qsaiz8Efaq48biu2FRgyvndtZRgvJtFJjUUVP5/K91KQmjkp2d9CwB2Xjinq5fnTU8v2KkJXxNOG0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
X-Proofpoint-ORIG-GUID: Aniz20oSpSp4EP1qFrQHU5pgqsAzW3O0
X-Authority-Analysis: v=2.4 cv=Fc1lx4+6 c=1 sm=1 tr=0 ts=670f78e8 cx=c_pps
 a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=YuAILjPrcoIfSKu_7RYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Aniz20oSpSp4EP1qFrQHU5pgqsAzW3O0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_06,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410160055
X-Mailman-Approved-At: Thu, 17 Oct 2024 07:24:49 +0000
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

The `drm_atomic_helper_shutdown(dev)` is called only if
`priv->is_registered` is true, ensuring that it runs only when the device
has been properly registered. Otherwise, if it encounters a defer probe,
the following call trace will appear.

WARNING: CPU: 0 PID: 13 at drivers/gpu/drm/drm_atomic_state_helper.c:174 drm_atomic_helper_crtc_duplicate_state+0x68/0x70
Modules linked in:
CPU: 0 PID: 13 Comm: kworker/u2:1
Hardware name: Generic AM33XX (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
 unwind_backtrace from show_stack+0x18/0x1c
 show_stack from dump_stack_lvl+0x24/0x2c
 dump_stack_lvl from __warn+0x80/0x134
 __warn from warn_slowpath_fmt+0x19c/0x1a4
 warn_slowpath_fmt from drm_atomic_helper_crtc_duplicate_state+0x68/0x70
 drm_atomic_helper_crtc_duplicate_state from drm_atomic_get_crtc_state+0x70/0x110
 drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x98/0x1c8
 drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x90/0x144
 drm_atomic_helper_shutdown from tilcdc_fini+0x58/0xe0
 tilcdc_fini from tilcdc_init.constprop.0+0x23c/0x620
 tilcdc_init.constprop.0 from tilcdc_pdev_probe+0x58/0xac
 tilcdc_pdev_probe from platform_probe+0x64/0xb8
 platform_probe from really_probe+0xd0/0x2e0
 really_probe from __driver_probe_device+0x90/0x1a8
 __driver_probe_device from driver_probe_device+0x38/0x10c
 driver_probe_device from __device_attach_driver+0x9c/0x110
 __device_attach_driver from bus_for_each_drv+0x98/0xec
 bus_for_each_drv from __device_attach+0xb0/0x1ac
 __device_attach from bus_probe_device+0x90/0x94
 bus_probe_device from deferred_probe_work_func+0x80/0xac
 deferred_probe_work_func from process_one_work+0x198/0x3f8
 process_one_work from worker_thread+0x35c/0x550
 worker_thread from kthread+0x108/0x124
 kthread from ret_from_fork+0x14/0x28
Exception stack(0xe0039fb0 to 0xe0039ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end trace 0000000000000000 ]---
tilcdc 4830e000.lcdc: [drm] *ERROR* Disabling all crtc's during unload failed with -12

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index cd5eefa06060..9c11ea126b46 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -171,11 +171,12 @@ static void tilcdc_fini(struct drm_device *dev)
 	if (priv->crtc)
 		tilcdc_crtc_shutdown(priv->crtc);
 
-	if (priv->is_registered)
+	if (priv->is_registered) {
 		drm_dev_unregister(dev);
+		drm_atomic_helper_shutdown(dev);
+	}
 
 	drm_kms_helper_poll_fini(dev);
-	drm_atomic_helper_shutdown(dev);
 	tilcdc_irq_uninstall(dev);
 	drm_mode_config_cleanup(dev);
 
-- 
2.34.1

