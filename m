Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBF4967E81
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 06:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28F710E1F4;
	Mon,  2 Sep 2024 04:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="RGzrxrn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716610E1F4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 04:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMhO27Rx+bRwQF75/EZVYumsvVtVGptSGi+ZM6i+34TCUeo2N5ELaB6SFotGhu4ZX302alPd92UcA7jzxJu/AI0lhrb8OBkSojVhvV3gzakvkcRHIP5SrtB/jZsUdJ7fhZSmLKTj8wxz7yIcDxsQzZ3fiBdOdAIhNYnxW9v0VImRKvbIJrPRoJRI0mNYC6iTArnyaeHvR+tFt6bFyx6MIgfv8GHpjApZ4w0DuiMGftzFqrqsLhJPOUt4B37bjrK8ZAiLDrcCNNf5iMnWzZ1UfryFNhuSp41Q6M9qDOnBjN5p4F8H26kpG7uwH4zuT0GautqQH1+CKmj8F15YNKK5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3KfstgbIOIFnQ8sU2Fk3AVXA3OPqMl3KbixtAwx7J0=;
 b=vMuMVTMcmo8JwvaR3NR+8oZ0NUPLD+m4AkoSVe87SS3/IZQi1+R9qFkAsFudvtFPJkntCsZe/B2Te+rFQgsCiVENBFcXf6fLRRoMI7jZ2EhIwmalk3V9RBzLiXkIRsbbqG2lCUJGag+jZfTI7m7K5z3/JpUkbl/gJ6zzkqvdbfZY1LzO6ruZCCbnEpD8jaZvX9g0kXxfEEKpUwNd1fM0hg+rNl7OYJOuxSIVikkVMpK5g+N6mFzdiAzpIjOHBz7Pxc+AKZ5msrSLilCOdfPXYBfxvGLMcnO8ou+ci65jHAoeNECMJcho8bLv5aBIwjGmEMvg+yStMmbty6R+YpVCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3KfstgbIOIFnQ8sU2Fk3AVXA3OPqMl3KbixtAwx7J0=;
 b=RGzrxrn7B6QE/NqdWglM0upPUIViy+BXEXsnHZEb5jaifn8xNDbuv6AIQoF41/SMQBiYcWXbaFwH5rE8QR0Kours0ziPFGIGEli1e140ejde3BvagRM2wnv+VKfB2IXUUP+a8sJhalF953l/oG5pxjklKbDpKGSHA5iNPpOj8LsLqfJCJ1CO48B1yLKSj2Hicc4idTmtbyu3elku3QvAKqZlMg0RgJZJshvaIWQbNrW3F8wgQSdiKYJnDKeMgn94jDDCCNpcYeQigG/FnzPLj0Emfkacj5cB5Fmv1GTaDPNo1ewb3NJI1HHm3G0zn2fMJ2YhYqrZcA8VQlCrnn/WSw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 04:39:34 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 04:39:34 +0000
From: <Dharma.B@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Hari.PrasathGE@microchip.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] drm/bridge: microchip-lvds: Use
 devm_platform_ioremap_resource()
Thread-Topic: [PATCH 3/3] drm/bridge: microchip-lvds: Use
 devm_platform_ioremap_resource()
Thread-Index: AQHa+Jv6o1VJo8WIvk6M+dMWgRJh+7JD8v8A
Date: Mon, 2 Sep 2024 04:39:34 +0000
Message-ID: <5c5d870b-acc2-4d50-8a37-2110af1325b9@microchip.com>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
 <20240827161223.4152195-4-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240827161223.4152195-4-claudiu.beznea@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|CY5PR11MB6437:EE_
x-ms-office365-filtering-correlation-id: bc7b0e40-4996-4f54-5915-08dccb093eaf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?SjZBV2VFWlFudWFnV3NKT2hJWU9OanJaZUx5cXUyaWJnOUk5TDhKWjVDd2tV?=
 =?utf-8?B?ZTlCSi9WejQ3WjJjVVovS2VnTUdXVjlWOFFrdUxQemxiV0U3OU9LUFhiaW92?=
 =?utf-8?B?UFNTakovVUtKQnB0R3JDZEJWV1V4Qmx6V0p5ZndKZDNYSUNjTzZiTjNaTS9p?=
 =?utf-8?B?V1FhMm9uY1hjeU9ZZUVsZ3hnekUwR2VURmdsWjB2SzFvVjZ4VWNoRkpZcldD?=
 =?utf-8?B?VldleklPZHV6R0NDMFdmT2ZURVpMSDRNeTB2YllsbXg1Lzh2dDNQdHdlUnh5?=
 =?utf-8?B?SlRoNWFVeUROY0pldVNrM0JaYmQyMWk5T1JCbDB1eCtVYUp1ekVDY0t2dUlJ?=
 =?utf-8?B?Z1pubWFpSkxETDNhUTVLOUNWdVFzNjlTcks5R2lFTW5WR1g0eFhjd3lhcnpL?=
 =?utf-8?B?cy9MUkpjQmFjY3NDOTEvT2d4QzdNWW44TVQzcFNhdkExSGtYa2xaclh0YzUr?=
 =?utf-8?B?bUpCQ2pvUEFpQy9uUTFkczZEOEl2V0VWK0lobWg0NjdHeU83YmtmYzlvSVhZ?=
 =?utf-8?B?NXZ6VEErWm5YbzZiT3lwa3dNVk5RV0RUcDAxMjcrL2NGZ2JoM1hyMzdIbGV0?=
 =?utf-8?B?YnhpeFE0QnRtaCtKK3lrNk5zb3laQUoyRkg1ZktxWm9iYnlnVWt2ZmxaKzhW?=
 =?utf-8?B?WjArUGRLVm1wN3YwVVpPVFY5WEJRcmo5UG95OGhGS3FKckF3VWNzOU5aTzh4?=
 =?utf-8?B?VVlXVi9qTWFqRWUwekxQc2FOMW95M0J3WHM3bDlCTFhWV3ovTVhsZWVGNVNx?=
 =?utf-8?B?dnZaZEM0Y3FWbzVVVkpBd0YxS0lHSWsvRVc3RnVnMnA5a2FJQmFNRnNPQnV0?=
 =?utf-8?B?dnI1VUFQd3ZzTjlMVGo2Skc5SVBQOC9GSTVVbFVMdWxMMVN2NXc3WkdkMzh0?=
 =?utf-8?B?a3ZTY1JnMGpVbnNFRFppb09EaEFRMng5cDZRbEdqVEdPa2dTUXhiN2t4Z2pU?=
 =?utf-8?B?WGNmVVlWQWcrcEIrTE5jSWFlNmU4REE0UFhWVVVxWGpFdUFuenJJT21ILzJR?=
 =?utf-8?B?T2FVbG9pRjdyYndYZ2lCWlRNb0tzSkYrLzF5VXBRT0R1LzdmVkJWVm93T3po?=
 =?utf-8?B?ZXJmZlBjZ1V3a3l2ZzZtY1FnT3p5M2NqYjk2bWxMV01tckZqT3kvek96Qmxy?=
 =?utf-8?B?eUQ4NE15Nnp1aWZpaytvUktJbmJkeko2dkROYTFML3cyQ1hOZFlKYVMyWjVG?=
 =?utf-8?B?b1FBWkp0MEc4eDQ3Q2VYN2l4Wk13b0hWblJzRzhCK3BBcXBNeWduUWQwVHFr?=
 =?utf-8?B?VURjT1NuN3A5Yk9GSENNdi84ZlBsY0VVK29HR1BiNGRhcWp6cDQxZ3kxdjZX?=
 =?utf-8?B?Znk3UGVmRTBGSzZiSGpBa0dLb21hTWdBSHNFbC9WS2kzb3l5SjRGSUU3Nktj?=
 =?utf-8?B?SmxnbW90UkVSdkp2U1ZqZ3lpdkx1N2xLNkNmVGcrbGtJb2pjdlh2TXJ4Q3hE?=
 =?utf-8?B?N1grdHo5UDF5M1RVcEtFY2lqVmdsVHJYcXVaYWJlVDNsOGJsL1NSZDA3MWFZ?=
 =?utf-8?B?TDhpZ1ovT1c0NmdNdUI2TVRGU1JlZ0FoZzY3M1NMOTZuZkxiak9RR1FhZE9v?=
 =?utf-8?B?cWFJQW9ZSVlpc3R5Snh6M0M4MStrV0lkTkhPODhkR2RVeWU0aVV1VGh1RnJM?=
 =?utf-8?B?MnNibEV0YnpPSWUrMkpJV2dwQ21LUzlOeHRUTGNlMFZXQWRBM0REWGU1UGpJ?=
 =?utf-8?B?MWc0TGJrOTFxMVV6SmxDa0x0VWZoWlIrdDBRRUtLVkhmaFMxVEVIMlA5QnNZ?=
 =?utf-8?B?U1dMeGt5TkVhVlhycFZNOXFsbXVXTEtEa1djRThVYkJZaXJmcjZzTHpNWVBH?=
 =?utf-8?B?UXhyVHVwMFBiVTJJVW8yeEFsRjBVR2xpazc0WWlKTTFpWlBJa0thUmFDRVQv?=
 =?utf-8?B?d2JvamdpSlcvQTBTSGptMXF4NHd3YVFzbS9BL1NhWU9nZU9oZzUxZjA1UzAy?=
 =?utf-8?Q?bzD2BTzIbo8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXdxcDIvdmViSmdGcnNubkhNTVJMV2RiY0h2VnZFVWdVeEw4SHRtSk9jcE9F?=
 =?utf-8?B?UERobWJJRzQxSlgwcXVzN0JVUVVhMUEwajFzMDBGV2ZCNWlVcGpocEFFT055?=
 =?utf-8?B?b1RhVzJId0pBUzBaK3dmY1ZrM0VGOVI0Qjc0cDNGbXlLeVhMamhBdnMvdW02?=
 =?utf-8?B?eE1pUHVWM2ZabVlwVklxOGNTOTJTeXV2UFptSnlXUDVRRHJxQmNaT3NhbktW?=
 =?utf-8?B?RkJZVUVxM1ZFNXVFbjQvR2FRQlBNMmJRUmNncms2L3BsZGQ1RWF3bGZBUDda?=
 =?utf-8?B?MVhVcmJjek5tcHpLdTM5Y3YraHB6V3prQzFzbENWb1MxNDR6V012aE9mdTdW?=
 =?utf-8?B?dTVUeTZWZTFSNHdnTTVJaGZKamtpdWovU3VNd2RlM1BvT1pxeDN4OEJISkV0?=
 =?utf-8?B?UmlrT0l5bTJPdTBKTXVYT05yVjdKNWhQa2NmU1BjditDbjdBL0pucUdva1Fy?=
 =?utf-8?B?T0ZySmx0ME05U29qWVFiK0FISTQrc2tmREFZeW1wenVRMjlNaWRBQmYxVTla?=
 =?utf-8?B?bTZSNGxIR01GL2QwQU9DTmRCRGp6bi9vcXBTTGRXYitIazhIa213ck5vRE1y?=
 =?utf-8?B?aVgzaXhBeXVEc0NDUEVYUDQrSHRCc1cxOE9IVmc4ZjRDdGtJUWNSVTNjQTM0?=
 =?utf-8?B?Z1RpaStBRTJnYlg3NlU4UHMybGJoWEN2bWR3aWtZWnhsZDFUNUsrNWh2RS9x?=
 =?utf-8?B?SnhRb0hFbW5sR3U4VFpmY0lTWHlmbFhaY3FUT1lucExEV1ExeHBnRXNMenVC?=
 =?utf-8?B?bjJ2R0gzRDIybE5ML1NicVE0a09kTVdxb2hieGVmYzdSaUU1NEdhZHhpVEc3?=
 =?utf-8?B?bkwxRHRVb3RqR09uZjRrWFJzdVlWcTMwT1Rrcm8zcVY3dE91VUg2cWdtZFNq?=
 =?utf-8?B?RWJnSm5OTGlGdE44bXFsdnB0OEF4NWlneWhmQ3MxSEUyb0J0My80aWxKbXJE?=
 =?utf-8?B?cy9kWnRBbkVsTXhrejA3MUR1YUNFVTRLNXJDZ1k4eTNzMzlTclE5eStBRzVj?=
 =?utf-8?B?U3NObjZSR3RwcmxSQVlKT2FFTkRWZ2o3anp4ZXRWWEx4Y0svUCs1cjhJeG1o?=
 =?utf-8?B?Wlo5QzhYQkVYcXpKbTRHdkV4RE1GZmt0a0c4SkFHQjlvSitCbkhrQTV4S2Fj?=
 =?utf-8?B?UHVQNWlqNXZJN0t6UW80OEE4bmlPVi9USUtqT1g3TFc2TXBqekp5SktQY2dS?=
 =?utf-8?B?a1hlUDgwV2tyOHF1SW90NkQvblVTTmV5a3VOYTkvNlF0a1FnWC9sNStpT1dV?=
 =?utf-8?B?d3l1UFp1UHRBZGc1TWgrdVMweWs5REtIRFpGZXZJc2VDMGRBL0F0WllocVFT?=
 =?utf-8?B?MUpUV09LSTVCc24wMFpsQVdBMWYyaEdkZVE2QmJ5QWNMM3ZNbG9IZEhuYUx4?=
 =?utf-8?B?WVFpcEhXVlpXdXBhZGdaVTd3anBXT2tCbE5sQUlFeE56SU1IYUU5QS9SNXhH?=
 =?utf-8?B?UEVEendWZVNzV3JrdThkbGp2QU9JRzFYS1MrQzNjWi8yN1BKS1FXZ2dqc1Jn?=
 =?utf-8?B?bExqcGdYeEpKSkdaSGlTUUtyb1IvMW5XNmRUY1R5VmhRb0xEdUZOVFc2MklY?=
 =?utf-8?B?RGlIblQxSDk3Y1dTNDgwdXI5MTh4YXFKa2I3b0RtNENLZHBqcGJicnNRMVRz?=
 =?utf-8?B?YkhWTXdIamRDaXVPaDgydUVZVUd4bTBRa0dFRTlZOGFSbVJuT2ZqNjlCQk93?=
 =?utf-8?B?cU43b0lSS3orT0laOVNJOEw4aElVUEcyNlFHcjB3ZWlqclZJNHBvTG9yZ3FN?=
 =?utf-8?B?SkQwTkFDc3hwZWtBQVByU0cwZXFuVlJFRzYwclFKOWxGbDQ0WTFHSU9XVUVB?=
 =?utf-8?B?VTNYd0hrM0IyajBtbVZUN0FrMEVRSm5vbmlEZzNzbmxieG42VklUZHRYMU1v?=
 =?utf-8?B?blVGZWRIRzZBUDVpWmFySjJQbkxSbkxDNVZ6Vy8vU0t3TUhMZUtPOGtDemt1?=
 =?utf-8?B?QVZHNGdDa2tDV0RPT1JBR0RvUGZneW52QVhROGw0QTNoMFo3c0dDdWZGV0l1?=
 =?utf-8?B?SjJyamhpRnZPRGluQXVNQ1h6VnlONkVra0NwU212YUFkNmNPNFhIR0NWYTNw?=
 =?utf-8?B?RkhpSndJUitXUGVpcm9tc0xVNklDbGFNNFJSUlhUc1FobndUTCtFMzY3QWkv?=
 =?utf-8?Q?MXu2xcG8uKF4D1Cm8Cql/O9UM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F265993147D544419AB6C82FAE748678@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7b0e40-4996-4f54-5915-08dccb093eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 04:39:34.6312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdQd3DcADr2x/jDqPaEeddG11kDnUP20bf3I5AcL1jd/Tvfrhu8o80cxu3fEceF8LZxW65CEAWcix8iy/M6wlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

T24gMjcvMDgvMjQgOTo0MiBwbSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdWNlKCkgZG9lcyBleGFjdGx5IHdoYXQNCj4gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgY29t
YmluZWQgd2l0aCBwbGF0Zm9ybV9nZXRfcmVzb3VjZSgpIGRvZXMuDQo+IFRodXMgdXNlIGl0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9u
LmRldj4NClJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhh
cm1hLmJAbWljcm9jaGlwLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9t
aWNyb2NoaXAtbHZkcy5jIHwgMyArLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9taWNyb2NoaXAtbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAt
bHZkcy5jDQo+IGluZGV4IGYwNDgzMTEwNmVlYS4uODVhZmY4YzVhYWY0IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+IEBAIC0xNTQsOCArMTU0LDcgQEAg
c3RhdGljIGludCBtY2hwX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gDQo+ICAgICAgICAgIGx2ZHMtPmRldiA9IGRldjsNCj4gDQo+IC0gICAgICAgbHZkcy0+cmVn
cyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShsdmRzLT5kZXYsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCkpOw0K
PiArICAgICAgIGx2ZHMtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRl
diwgMCk7DQo+ICAgICAgICAgIGlmIChJU19FUlIobHZkcy0+cmVncykpDQo+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIobHZkcy0+cmVncyk7DQo+IA0KPiAtLQ0KPiAyLjM5LjINCj4g
DQoNCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0K
