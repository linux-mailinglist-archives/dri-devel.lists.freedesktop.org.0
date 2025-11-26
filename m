Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C5C88F20
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76B810E56D;
	Wed, 26 Nov 2025 09:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="e72ibdAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012040.outbound.protection.outlook.com
 [40.107.200.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C0710E237;
 Wed, 26 Nov 2025 09:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYVsQgI041qixjG4Jd9s8QR9lIGeynTj0rs7IKcwNDsxxnsrb3RbHmoBytcdgGxOTyruCg62m7YMsLU6CrUFwivxP/MVtttiqUGz1ORiuLzMyubjIlGDk2zVMBSSRHizqVi9aOsiPr80FzrDeI0EGwb6/Oe55L3tfm8kA8IZGxfmT9KaE9DAI2FxFxfLkwUUYOJT8+/jt5kRaTkWBfL+mqpRFiy9bdVZAjSMcq2Ltv7/qi8btl52LZtLD9stuFYTprLy4MRJkrhh7gax5kUVwngqdHS8jIXucFbKF0ICsVw3rKi+1wpM4FWFtuirHkvqLOQXTAoAdy6qB+SsC2BKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzgw5UbmasbtEMSiDa92RkZK/Iow31iu/1SNNh35H6g=;
 b=l6QGWKMuaT205WoAK9FnpCUfJbe828FyJlo8H/qT/hpDAy9nBsuxfC1IMxV6EEDOt2ugQ+oUy/rR+MnQNBBsHdR5Xl6A+pkeaZCEEpXdUzKwuEmhI7pTSDo0F+cj94TYtvX/rLfomHTS3j2PCbpXIPx2P8gyeUnlsdlqo2inOK1SgMjtGwlfJRsxIYuZQi2VkDYlPouRjDk0Vu3j4U53BligaCIRMOIh09yGyd+JOxeneLs0ZJyM8BD1TVpQzdpEfxOKrRSchfeq11ig/5bx+JJV7+svzXGCQGvPGiSOZW/XX2IBOrr/zQVFlCFVH7o/816Z3qxFzvNlfjrUTHRhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzgw5UbmasbtEMSiDa92RkZK/Iow31iu/1SNNh35H6g=;
 b=e72ibdAIDLS78rLG7Wre34MayIrYImrCeJ+kubi/n5sxxMJWJ0vJct/41vOr9bKlXCZOSowA1MJAfCLMB7BnVi/xl0N1Ohy63bCqUGXnR+QNkKIYUHvthrHRYZGAdoyiMVcBOxb75VSkyZ5dfoWMAtCyjfNZkSSL76QgYnPrcEKhVKyVzMVHL3oaxolX7PnTPG9k8k7+l0+uFpNZGk45E8VZxikFzW7W5wou2sCyywRSX+0hPBWZlc7GnpNv8Sn5QxqcnusRggVuLYO8A06GuGCJbjO8aAzRsnLgeZ9seL2/CUQ0YFHzAPFmqBmQNDQGIyXqCCGvVamhyhBZhHYheQ==
Received: from IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:29:09 +0000
Received: from IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3]) by IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 09:29:08 +0000
From: <Ludovic.Desroches@microchip.com>
To: <tzimmermann@suse.de>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <geert@linux-m68k.org>, <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <spice-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Thread-Topic: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Thread-Index: AQHcEnS8fucA3LjqjkuGZw8r9BxHgrUEDdaAgAAGpQCAAQFLgIAAFRiAgAAedQA=
Date: Wed, 26 Nov 2025 09:29:08 +0000
Message-ID: <09cdbc92-63db-473e-8c5b-5ca9ac3c6a2a@microchip.com>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-4-tzimmermann@suse.de>
 <52600bf4-2c1c-49a6-82c5-b31818141a43@microchip.com>
 <a11c195d-197c-45a4-962a-e2336c7360c2@suse.de>
 <2fbe0d43-67c5-4816-aff0-c23ac1507ec5@microchip.com>
 <58b768ad-00fb-4fe5-924c-9cf6ec12f75c@suse.de>
In-Reply-To: <58b768ad-00fb-4fe5-924c-9cf6ec12f75c@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7257:EE_|SJ0PR11MB6765:EE_
x-ms-office365-filtering-correlation-id: 693cd87e-3f91-4a9d-e55f-08de2cce4067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?WGRvenFyTW0xRm5uSG4vcFc1Qm1Fazhwb0xxakNlSm4zOGQ5elExQ1FLMWpo?=
 =?utf-8?B?YWxacS9USUJpRC8zUkI5U01DRHdJUkJQTzNhdURIZDN0emNyRXBFZ3c4cHRt?=
 =?utf-8?B?cGw0TzArZm41Qzl0S3EyU2ZCUm1DMEwyd0RvL0VqS0RlUHNaMEczaEpnM2Za?=
 =?utf-8?B?Ky9OL3N6MzJRd3UySTd0S1RkZkc4TTZxZk8rZThlVjZqM2ZzN3lBRWE4MTkx?=
 =?utf-8?B?czZZQ1Qyc1J5N2JsaWRobWNsTHUxZmptbXVrZVZKekhGZEZnYWpreWIvZTA4?=
 =?utf-8?B?b1NINUs3eU5zT3k3bzdkL0Fwclk2Sm9Lb1czcWFxTHIxNGhqVitLK3ZhNUYr?=
 =?utf-8?B?ajBHRHpSOTlpM2pFdlhSRkpkL2toRHd2TzlYRWEwQldmTmNDL2wzQm5RSVN4?=
 =?utf-8?B?RUUrdmRpb2FlYVJkTXIwZEFJdTA2N0ZwcVl2QU1uWDdwb0dESzlvTTFpRjhv?=
 =?utf-8?B?SU1Pc0RMRjY1VkdMWmN4eDZNTnJ3MUpxWklOaHlDdGEvMXVvcHVQNWxmQ09U?=
 =?utf-8?B?K2VCbDQ2cWJrSFBBS0V6eFA4YmdQaWNvTTdCTlYwN0RlaE1LTWREZnBUWHF6?=
 =?utf-8?B?WWErdmRBN3hRV2dkVFY5cXlOTE1Zdmw1aENYL0NJYk5KdzlzT0VJOGNVU1pt?=
 =?utf-8?B?L3pTK2dUMEpXTXFkQWFKOUZhbHVhSy9DWXpWR1BqallNUUVqZWJ0bGVMQVFp?=
 =?utf-8?B?a2ppaWQ2MXVRYThLSUxiY3hBOUhUZm52QUo1cVZyaEdIRDNjK1pMN0x1Z05C?=
 =?utf-8?B?R2lET1ZQWUZ1TFNvd0ZyZG03ZnVLNmo2NEppai94MTZ5eGI2R0FvMzVUMkRp?=
 =?utf-8?B?clh6SGxqOTc5U2FGVVVtQ2dWZlJPdC9oM0RLQUkrQU1TdENMbGR3TEZ1S2tB?=
 =?utf-8?B?VDNKai8zZFVUQjdCN0poZkhXSUlDZ3hKZGQ4b1hBUVhTVDR5SEpnVWwySGpa?=
 =?utf-8?B?VmxZMUFVM0hLdExoNWlKTnlXYU1XNUpGVHNXLzZNdG1qRDJWUC9aejE0eUxS?=
 =?utf-8?B?YXZjY21rVUI0UEtqVnpRWllXSmVrMUlsSEFmMWI1ZCt2dWlxMHUzVzEwRWJH?=
 =?utf-8?B?d0s3TVZmOG5ySEJPbVRzQllyR1ZoUmZIVksxUEo0NjJUbUNXMW5zT1E4dzFn?=
 =?utf-8?B?R2luY0w1MEhWTUVqOGQ1TU14WGdKZ2lSWkNhWjVLbjN4Q1hUQ3N2SHlwU0xK?=
 =?utf-8?B?dldna1dVWFlVYWJKMlZzQXJGTXJEbzNqZEZQQS9KYzVydFNuSHZXdkVYbVRU?=
 =?utf-8?B?MVhPWGcvSXY0Uml4alNCNU10cWc0RVNZUlhSZW8xK3pmR3FYVWhicUtGMzcr?=
 =?utf-8?B?WXdsbDJzeWNra3kxVmtpa2hwV1VTOGcxeWs0ZC9OaFBEMWxvMEJ6V3p2N3JK?=
 =?utf-8?B?WGc2TkpDODN0b2tnTEhLSDVtMHlsWGZyN3V0djRyalNWazVFSmZaNi9UOGE0?=
 =?utf-8?B?dUJILy9DaS9iR01CRU5IaXZIWUFHaGdNellRV01RejErTytYNkhEcnRmQUR5?=
 =?utf-8?B?SDlNZkxXYWhtU0R6YWlIbjRNRkdGL1lwSlY2blc3UEU2K3Q3eSsyaUxmYUNl?=
 =?utf-8?B?TncxZmgyM0xONU5EcmJMTkxST3lHMzI0VnVBaVNiZXBSYit4cU5Mdno5eFJl?=
 =?utf-8?B?NzFoTkxGYThkN21QMGNGZmw0RVhUTVVvYnVmM3AxUk55RUJaci91d1lORkdB?=
 =?utf-8?B?RTBXL2hMMEFSVllxMGNzWW5QQk9Da1BoSG1zOU52UitsZDBDOEFibFV3bHBX?=
 =?utf-8?B?MytwOE9DZlNyVHVMdGk0THcwbUdJNkNqSTNNSEU1OVZtSEpxSUdabEFkd0Fl?=
 =?utf-8?B?UGphNytEdlRZNXZYWXFrODVZVnBPZE1JUnFsQUVWcW5mNk5wY3lXMFU0anU3?=
 =?utf-8?B?MXBuUmlvaFhCZkg2TTVmQm1jWm9LSDNyTHBsNXBxeFVuMmJySnZJeFZwd1Rl?=
 =?utf-8?B?NHMrYnIzb2NSbXJBcmZzbWNEczM5Z1FHbXE4Z1lxZmhLcldPanlqcm9hRDJ4?=
 =?utf-8?B?QUxEdU9CT3o5MXFSQ280QW5WSE9Tb2ZRUWtncDhsWGN4RUNkTDZzT3dDODdR?=
 =?utf-8?Q?NqBEDR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjhobDVwaFJnZVpkdk1nVU9OZFBLeXZGcTBSUit1TFVNVWRBM3ZXTEFqdHpG?=
 =?utf-8?B?S1FEWGJQM0FJNjQ2YndoNERTeEZCbVplYkFmNGtPTm02djJOOERTT0RmdXgw?=
 =?utf-8?B?am1Wc3ZIQllGOC9MNUFhUXRiaTlHSmVPY2l0S1BjZ3hHUkR0dTlQUmNyTWpF?=
 =?utf-8?B?dTF0QjdZTWhlYlhMWkpiZnhTZkZUV0NxOThZV2V5alljU0xBVC9UNDJvamwv?=
 =?utf-8?B?dzQ4cXZHV2JTZ3VnbmRlWjBseHRDa01LRXY3cWtSektaOU5DLzBjQi8vOGZQ?=
 =?utf-8?B?QW92YTJTWHRaanlORmtiQWpYWEZMeUpyVC9lT3JSQjBoSGRuUEgvMFYvdkpZ?=
 =?utf-8?B?RWRsdHFuVVJGWHQwcjVHVmt1cEFOQXRnQUF2YmNJbmJNOUJYOHh3anRyRno4?=
 =?utf-8?B?NGdQanVocG4wYnRzNGtVdE9rS3E1bzdWLzNuQ1crSWF0MlY4cGZYL1JVWFJn?=
 =?utf-8?B?U2pDYTJMUm9HYjI4TndRdXJjbGlSNmpjazQxbFhTdXF2OHhjY3liQnVJc28v?=
 =?utf-8?B?SWNQQm8zYzJTM2RVc2RGeUhuTS84STZ1OWtpM1IwK2JNSENZMERSblRXZXds?=
 =?utf-8?B?dkdaWjV0NjNmWjRWcGNzUCtpTzV5NVJFcVp4cytFNHV4UzVNNFkzRDdHT28v?=
 =?utf-8?B?UmhMa21ML2pjWjhIYUQxM0pPdkJCalI3bmxENmRkUDh0ejVkZmp4Y2FlYVBW?=
 =?utf-8?B?SWtET00yV2hWajJKZ2RWMGFMS0V3M1ZTQmRLdGhINzRTV0V0RWFsOTVYOUNm?=
 =?utf-8?B?N2xGeTR2V1lWSklaRlF1OGs4Mk1Zdmp0d1hRUDF6dnBtdVJyUHVqSU0zQkhS?=
 =?utf-8?B?Y0p5SnJxQ3k2a1llZE5JTEJwZlJONThXeWhtUjdpclRqc3hoWkFkcHpsTlRE?=
 =?utf-8?B?YkRYU1ZISXVjdVNzcDdXZE1FMUFwVWRNNU9HRTk5UGJzSFpkK1F5VnlGN1Rq?=
 =?utf-8?B?cFZ6NUZoUU1vYjNMZUx4UmZlRHFOVW9qTmhodytlcmt3ZXBlZ0J2SlFDY3F5?=
 =?utf-8?B?RHc1VmF4Vm83RWtUamF1RkZ1K3NhSGcxVDltVnhwRUtDbFZyKzdFcGhkMXFI?=
 =?utf-8?B?ZjNoRUpDOVhZbk4rN0d0Z2dRaHJ6dWNPZEFsVGxDVnlsV3ZjWlJGLzdBY3h1?=
 =?utf-8?B?aDJrNGlpdTRLbkVLN3pyY2QzOFc1eUZtWjJuWUtKQlFBTHNFQmFiOUV0WUMr?=
 =?utf-8?B?TFBFSldYL01EWHVLYW5aWXNDMEVicmZhcEw0WGVpZ2tKbXlWVy9CYzN0cFhB?=
 =?utf-8?B?NWNUaVBXR2NBNlFtOHFCanRwejg5bGk0RCtPRVNra1NjS1hlT1NrR2dqZkcr?=
 =?utf-8?B?dGt3M01Bb3gyUUl4RzJwM0JITWgxK3prRjU2aVE4T3FvUlBwTHQrQ0xDWU5I?=
 =?utf-8?B?a0s1OVFtQW1YYjJFeVkrMll3a1hTOVhNVWZ2S1FEVU1qNys0R0M2Q3pQY2xT?=
 =?utf-8?B?L2ZPdzcwVEZUTXByK2FSWUFwdDdiVzJFVHpIMmUvUkhPNkhnYWNmWFVyNSs3?=
 =?utf-8?B?NHNJQ1k1TzhEaTdsbnlqeUN0OGc3ZG5ab0VSK3BvczdSSmUzbTdWK3YxUWhS?=
 =?utf-8?B?STQ2V0p5Misxd2JWcURJc0JhdDYxa1JoSlBrRG9ucG55MEJTbm9lL0Y4Y1hE?=
 =?utf-8?B?aGcrMUI2M3h4cGNUQWROcEJDemRSL0g3bXdFMW9vWmZLdDZZL0VaVXJadUZ0?=
 =?utf-8?B?VW45b1A0ZDc1eWZWV2piWnFSeWdXbGJKWkJtR1ZORno2TVVsS1VRRzdRbHd5?=
 =?utf-8?B?RUFnRXQ3K0orWEN3R3U2Y0hNZ2UvRGk0b1kvaWV6b3QvdUV1VFhYUkJTSkta?=
 =?utf-8?B?MlptY0lEeGRnSlRza0ViN0h4T0l0RTBDV0t0WjBxUFJWTGdOQktiSFZaN1Fu?=
 =?utf-8?B?OFFyQ1liTlNaNTVWeXkrLzN4ZEozL2o0T0hFZHovb0hxRUJmYXhNNnNJVVR0?=
 =?utf-8?B?OXhwS0M3K09WVHgyNkNhTm5RSU5SMlJyUzRVQnBnVU9jamtKSTFjRmlPbG96?=
 =?utf-8?B?N3MrOGVwdzdYK3Y4bk1kV1JuZytsR2JSN0pueU4yUXAzN0g3ZUhHWnZjR25Z?=
 =?utf-8?B?WERFUjJHNVJyNllQRjJ4R2ZHczhIV3UyUjQzc2M2TE5oY1E5OEZYWDJiUFZj?=
 =?utf-8?B?bUZ1WFcySS9acUllUFg1MjJHNnRBWVd4OWVHZFk3SzcxajBRdGtPamFXUWFR?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <608CB1FEC4DBBF4490FA73BC45B7B863@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693cd87e-3f91-4a9d-e55f-08de2cce4067
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 09:29:08.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8onpMeK/RT6VjUr9CeY3t+lynwBkxmwMBGkrnXrIYxoi0UigxYmIxgsbw++Zns9kBiA/dgTYSoAw4KRUUsk1ik93UVr6noSRMCe+uuwANk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
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

T24gMTEvMjYvMjUgMDg6NDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IA0KPiB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaQ0KPiANCj4gQW0gMjYuMTEuMjUg
dW0gMDc6MjQgc2NocmllYiBMdWRvdmljLkRlc3JvY2hlc0BtaWNyb2NoaXAuY29tOg0KPj4gT24g
MTEvMjUvMjUgMTY6MDMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cNCj4+PiB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBIaQ0KPj4+DQo+Pj4gQW0gMjUu
MTEuMjUgdW0gMTU6Mzkgc2NocmllYiBMdWRvdmljLkRlc3JvY2hlc0BtaWNyb2NoaXAuY29tOg0K
Pj4+PiBPbiA4LzIxLzI1IDEwOjE3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4+IENh
bGwgZHJtX21vZGVfc2l6ZV9kdW1iKCkgdG8gY29tcHV0ZSBkdW1iLWJ1ZmZlciBzY2FubGluZSBw
aXRjaCBhbmQNCj4+Pj4+IGJ1ZmZlciBzaXplLiBBbGlnbiB0aGUgcGl0Y2ggdG8gYSBtdWx0aXBs
ZSBvZiA4Lg0KPj4+IEkgbWlzc2VkIGEgY2hhbmNlIHRvIGV4cGxhaW4gaXQgaGVyZS4gOi8NCj4+
IEkgd2FzIHdvbmRlcmluZyBpZiBpdCB3YXMgOC1iaXRzIG9yIDgtYnl0ZXMuDQo+Pg0KPj4+Pj4g
UHVzaCB0aGUgY3VycmVudCBjYWxjdWxhdGlvbiBpbnRvIHRoZSBvbmx5IGRpcmVjdCBjYWxsZXIg
aW14LiBJbXgncw0KPj4+Pj4gaGFyZHdhcmUgcmVxdWlyZXMgdGhlIGZyYW1lYnVmZmVyIHdpZHRo
IHRvIGJlIGFsaWduZWQgdG8gOC4gVGhlDQo+Pj4+PiBkcml2ZXIncyBjdXJyZW50IGFwcHJvYWNo
IGlzIGFjdHVhbGx5IGluY29ycmVjdCwgYXMgaXQgb25seSBndWFyYW50ZWVzDQo+Pj4+PiB0aGlz
IGltcGxpY2l0bHkgYW5kIHJlcXVpcmVzIGJwcCB0byBiZSBhIG11bHRpcGxlIG9mIDggYWxyZWFk
eS4gQQ0KPj4+Pj4gbGF0ZXIgY29tbWl0IHdpbGwgZml4IHRoaXMgcHJvYmxlbSBieSBhbGlnbmlu
ZyB0aGUgc2NhbmxpbmUgcGl0Y2gNCj4+Pj4+IHN1Y2ggdGhhdCBhbiBhbGlnbmVkIHdpZHRoIHN0
aWxsIGZpdHMgaW50byBlYWNoIHNjYW5saW5lJ3MgbWVtb3J5Lg0KPj4+Pj4NCj4+Pj4+IEEgbnVt
YmVyIG9mIG90aGVyIGRyaXZlcnMgYXJlIGJ1aWxkIG9uIHRvcCBvZiBnZW0tZG1hIGhlbHBlcnMg
YW5kDQo+Pj4+PiBpbXBsZW1lbnQgdGhlaXIgb3duIGR1bWItYnVmZmVyIGFsbG9jYXRpb24uIFRo
ZXNlIGRyaXZlcnMgaW52b2tlDQo+Pj4+PiBkcm1fZ2VtX2RtYV9kdW1iX2NyZWF0ZV9pbnRlcm5h
bCgpLCB3aGljaCBpcyBub3QgYWZmZWN0ZWQgYnkgdGhpcw0KPj4+Pj4gY29tbWl0Lg0KPj4+Pj4N
Cj4+Pj4+IHY1Og0KPj4+Pj4gLSBhdm9pZCByZXNldCBvZiBhcmd1bWVudHMgKFRvbWkpDQo+Pj4+
Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+Pj4+PiBSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QGlkZWFzb25ib2FyZC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+IMKgwqDCoCBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9kbWFfaGVscGVyLmPCoMKgwqDCoCB8IDcgKysrKystLQ0KPj4+Pj4gwqDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvaW14LWRybS1jb3JlLmMgfCA0ICsrKy0NCj4+Pj4+
IMKgwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZG1hX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtLw0KPj4+Pj4gZHJtX2dlbV9kbWFfaGVscGVyLmMNCj4+
Pj4+IGluZGV4IDRmMDMyMGRmODU4Zi4uYWIxYTcwYjFkNmYxIDEwMDY0NA0KPj4+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZG1hX2hlbHBlci5jDQo+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9kbWFfaGVscGVyLmMNCj4+Pj4+IEBAIC0yMCw2ICsyMCw3IEBADQo+
Pj4+PiDCoMKgwqAgI2luY2x1ZGUgPGRybS9kcm0uaD4NCj4+Pj4+IMKgwqDCoCAjaW5jbHVkZSA8
ZHJtL2RybV9kZXZpY2UuaD4NCj4+Pj4+IMKgwqDCoCAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4N
Cj4+Pj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9kdW1iX2J1ZmZlcnMuaD4NCj4+Pj4+IMKgwqDCoCAj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fZG1hX2hlbHBlci5oPg0KPj4+Pj4gwqDCoMKgICNpbmNsdWRl
IDxkcm0vZHJtX3ZtYV9tYW5hZ2VyLmg+DQo+Pj4+Pg0KPj4+Pj4gQEAgLTMwNCw5ICszMDUsMTEg
QEAgaW50IGRybV9nZW1fZG1hX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZQ0KPj4+Pj4gKmZp
bGVfcHJpdiwNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAqYXJncykNCj4+Pj4+IMKgwqDC
oCB7DQo+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX2RtYV9vYmplY3QgKmRtYV9vYmo7
DQo+Pj4+PiArwqDCoMKgIGludCByZXQ7DQo+Pj4+Pg0KPj4+Pj4gLcKgwqDCoCBhcmdzLT5waXRj
aCA9IERJVl9ST1VORF9VUChhcmdzLT53aWR0aCAqIGFyZ3MtPmJwcCwgOCk7DQo+Pj4+PiAtwqDC
oMKgIGFyZ3MtPnNpemUgPSBhcmdzLT5waXRjaCAqIGFyZ3MtPmhlaWdodDsNCj4+Pj4+ICvCoMKg
wqAgcmV0ID0gZHJtX21vZGVfc2l6ZV9kdW1iKGRybSwgYXJncywgU1pfOCwgMCk7DQo+Pj4+PiAr
wqDCoMKgIGlmIChyZXQpDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Ow0KPj4+PiBIaSwNCj4+Pj4NCj4+Pj4gV2FzIGl0IGludGVudGlvbmFsIGZvciB0aGlzIGNoYW5n
ZSB0byBhbHRlciB0aGUgcGl0Y2g/DQo+Pj4gTW9zdCBoYXJkd2FyZSBkb2VzIG5vdCBuZWVkIHRo
ZSBwaXRjaCB0byBiZSBvZiBhIGNlcnRhaW4gYWxpZ25tZW50LiBCdXQNCj4+PiB0aGVzZSBidWZm
ZXJzIGFyZSBwb3NzaWJseSBzaGFyZWQgd2l0aCBvdGhlciBoYXJkd2FyZSwgd2hpY2ggc29tZXRp
bWVzDQo+Pj4gbmVlZHMgYWxpZ25tZW50IHRvIGNlcnRhaW4gdmFsdWVzLiBVc2luZyBTWl84IGlt
cHJvdmVzIGNvbXBhdGlibGUgd2l0aA0KPj4+IHRoYXQgaGFyZHdhcmUuDQo+Pj4NCj4+Pj4gVGhl
IGFsaWdubWVudCByZXF1aXJlbWVudCBoYXMgYmVlbiB1cGRhdGVk4oCUZnJvbSA4LWJpdCBhbGln
bm1lbnQgdG8NCj4+Pj4gNjQtYml0IGFsaWdubWVudC4gU2luY2UgdGhlIHBpdGNoIGlzIGV4cHJl
c3NlZCBpbiBieXRlcywgd2Ugc2hvdWxkIHBhc3MNCj4+Pj4gU1pfMSBpbnN0ZWFkIG9mIFNaXzgg
Zm9yIGh3X3BhdGNoX2FsaWduLg0KPj4+Pg0KPj4+PiBGb3IgZXhhbXBsZSwgZm9yIGFuIDg1MMOX
NDgwIGZyYW1lYnVmZmVyIGF0IDE2IGJwcCwgdGhlIHBpdGNoIHNob3VsZCBiZQ0KPj4+PiAxNzAw
IGJ5dGVzLiBXaXRoIHRoZSBuZXcgYWxpZ25tZW50LCB0aGUgcGl0Y2ggYmVjb21lcyAxNzA0IGJ5
dGVzLg0KPj4+IE1hbnkgZGlzcGxheSBtb2RlcyBoYXZlIGFuIDgtYnl0ZSBhbGlnbm1lbnQgaW4g
dGhlaXIgd2lkdGguIDg1MCBwaXhlbHMNCj4+PiBpcyBzb21ld2hhdCBvZiBhbiBleGNlcHRpb24u
DQo+PiBJbmRlZWQsIGJ1dCBvdmVybGF5LXR5cGUgcGxhbmVzIGFyZSBvZnRlbiB1c2VkIHRvIGRp
c3BsYXkgd2luZG93cyB0aGF0DQo+PiBhcmUgbm90IHRoZSBzYW1lIHNpemUgYXMgdGhlIHNjcmVl
biwgYW5kIHRoZXJlZm9yZSBwb3RlbnRpYWxseSBub3Qgb24NCj4+IDgtYnl0ZXMgYWxpZ25lZC4N
Cj4+DQo+Pj4+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3XigJlkIGxpa2UgbWUgdG8gc3VibWl0
IGEgZml4Lg0KPj4+IERvIHlvdSBzZWUgYSBidWcgd2l0aCB5b3VyIGhhcmR3YXJlPyBVbmxlc3Mg
dGhpcyBjcmVhdGVzIGEgcmVhbCBwcm9ibGVtLA0KPj4+IEknZCBsaWtlIHRvIGtlZXAgaXQgYXMg
aXQgaXMgbm93Lg0KPj4gWWVzLCB0aGF04oCZcyBob3cgSSBub3RpY2VkIHRoaXMgY2hhbmdlLiBJ
IGhhdmUgYW4gYXBwbGljYXRpb24gdGhhdA0KPj4gcmVxdWVzdHMgYSBmcmFtZWJ1ZmZlciBsYXJn
ZXIgdGhhbiBteSBzY3JlZW4sIGluIHRoaXMgY2FzZSA4NTB4NDgwIGluDQo+PiBSR0I1NjUgZm9y
IGFuIDgwMHg0ODAgZGlzcGxheS4gU28gSSBoYXZlIGEgcGl0Y2ggb2YgMTcwMCBieXRlcy4gTm93
IGl04oCZcw0KPj4gdXNpbmcgYSBwaXRjaCBvZiAxNzA0LCB3aGljaCBzaGlmdHMgbXkgbGluZXMu
DQo+IA0KPiBIb25lc3RseSwgeW91ciBhcHBsaWNhdGlvbiBpcyBicm9rZW4uIFRoZSBpb2N0bCBy
ZXR1cm5zIHRoZSBwaXRjaCB2YWx1ZQ0KPiB0byB1c2VyIHNwYWNlIGFuZCB0aGF0J3Mgd2hhdCB0
aGUgcHJvZ3JhbSBzaG91bGQgdXNlLiBTb21lIGhhcmR3YXJlIGhhcw0KPiBoYXJkIGNvbnN0cmFp
bnRzIG9uIHRoZSBwaXRjaCwgc28geW91IHdpbGwgc29vbmVyIG9yIGxhdGVyIHJ1biBpbnRvIHRo
ZQ0KPiBzYW1lIHByb2JsZW0gYWdhaW4uDQoNClllcywgSeKAmW0gY3VycmVudGx5IHRyeWluZyB0
byBmaW5kIHdoZXJlIHRoZSBwaXRjaCBpbmZvcm1hdGlvbiBpcyBiZWluZyANCmxvc3QsIGdpdmVu
IHRoYXQgd2UgZG8gY29ycmVjdGx5IHJldHJpZXZlIHRoZSB2YWx1ZSBwcm92aWRlZCBieSB0aGUg
DQprZXJuZWwgYWZ0ZXIgdGhlIGlvY3RsLg0KDQo+IA0KPiBBbnl3YXksIGZlZWwgZnJlZSB0byBz
dWJtaXQgYSBwYXRjaCB0byBjYWxsIGRybV9tb2RlX3NpemVfZHVtYigpIHdpdGhvdXQNCj4gU1pf
OC4gVGhlIGJlc3QgdmFsdWUgd291bGQgYmUgMCwgc28gdGhhdCB0aGUgZnVuY3Rpb24gcGlja3Mg
YSBkZWZhdWx0IGJ5DQo+IGl0c2VsZi4gU2luY2UgeW91J3JlIGF0IGl0LCBtYXliZSBhbHNvIGxv
b2sgYXQgcGF0Y2hlcyA0IGFuZCA1IG9mIHRoaXMNCj4gc2VyaWVzLiBUaGV5IGhhdmUgc2ltaWxh
ciBjb2RlIGZvciBvdGhlciBtZW1vcnkgbWFuYWdlcnMuDQoNCkkgaGF2ZSBubyBzdHJvbmcgb3Bp
bmlvbiBhYm91dCB0aGlzIDgtYnl0ZXMgYWxpZ25tZW50IGlmIGl0IHdhcyANCmludGVuZGVkLiBU
aGlzIGNvdWxkIHBvdGVudGlhbGx5IGJyZWFrIG90aGVyIGFwcGxpY2F0aW9ucyB0aGF0IGhhZCBi
ZWVuIA0Kd29ya2luZyB1bnRpbCBub3csIGV2ZW4gaWYgaXQgZG9lcyBpbmRlZWQgcmV2ZWFsIGFu
IGlzc3VlIG9uIHRoZSANCmFwcGxpY2F0aW9uIHNpZGUuIEFuZCBpdCBjYW4gcmVzdWx0IGluIGxh
cmdlciBidWZmZXJzIHdpdGhvdXQgaXQgDQpuZWNlc3NhcmlseSBiZWluZyBuZWVkZWQuDQoNCkkn
bGwgcHJlcGFyZSBwYXRjaGVzIGFuZCB3ZSdsbCBzZWUgd2hlcmUgdGhhdCBsZWFkcy4NCg0KUmVn
YXJkcywNCkx1ZG92aWMNCg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+DQo+
PiBSZWdhcmRzLA0KPj4gTHVkb3ZpYw0KPj4NCj4+PiBCZXN0IHJlZ2FyZHMNCj4+PiBUaG9tYXMN
Cj4+Pg0KPj4+PiBSZWdhcmRzLA0KPj4+PiBMdWRvdmljDQo+Pj4+DQo+Pj4+DQo+Pj4+PiDCoMKg
wqDCoMKgIGRtYV9vYmogPSBkcm1fZ2VtX2RtYV9jcmVhdGVfd2l0aF9oYW5kbGUoZmlsZV9wcml2
LCBkcm0sIGFyZ3MtDQo+Pj4+Pj4gc2l6ZSwNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICZhcmdzLT5oYW5kbGUpOw0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pbXgvaXB1djMvaW14LWRybS1jb3JlLmMgYi9kcml2ZXJzL2dwdS8NCj4+Pj4+IGRy
bS9pbXgvaXB1djMvaW14LWRybS1jb3JlLmMNCj4+Pj4+IGluZGV4IGVjNWZkOWEwMWYxZS4uYWY0
YTMwMzExZTE4IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My9p
bXgtZHJtLWNvcmUuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My9pbXgt
ZHJtLWNvcmUuYw0KPj4+Pj4gQEAgLTE0NSw4ICsxNDUsMTAgQEAgc3RhdGljIGludCBpbXhfZHJt
X2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZQ0KPj4+Pj4gKmZpbGVfcHJpdiwNCj4+Pj4+IMKg
wqDCoMKgwqAgaW50IHJldDsNCj4+Pj4+DQo+Pj4+PiDCoMKgwqDCoMKgIGFyZ3MtPndpZHRoID0g
QUxJR04od2lkdGgsIDgpOw0KPj4+Pj4gK8KgwqDCoCBhcmdzLT5waXRjaCA9IERJVl9ST1VORF9V
UChhcmdzLT53aWR0aCAqIGFyZ3MtPmJwcCwgOCk7DQo+Pj4+PiArwqDCoMKgIGFyZ3MtPnNpemUg
PSBhcmdzLT5waXRjaCAqIGFyZ3MtPmhlaWdodDsNCj4+Pj4+DQo+Pj4+PiAtwqDCoMKgIHJldCA9
IGRybV9nZW1fZG1hX2R1bWJfY3JlYXRlKGZpbGVfcHJpdiwgZHJtLCBhcmdzKTsNCj4+Pj4+ICvC
oMKgwqAgcmV0ID0gZHJtX2dlbV9kbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoZmlsZV9wcml2LCBk
cm0sIGFyZ3MpOw0KPj4+Pj4gwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+Pj4+DQo+Pj4gLS0gDQo+Pj4gLS0gDQo+Pj4g
VGhvbWFzIFppbW1lcm1hbm4NCj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+Pj4gU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+Pj4gRnJhbmtlbnN0ci4gMTQ2LCA5
MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQ0KPj4+IEdGOiBKb2NoZW4gSmFz
ZXIsIEFuZHJldyBNY0RvbmFsZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5LCBBRw0KPj4+
IE7DvHJuYmVyZykNCj4+Pg0KPj4+DQo+Pg0KPiANCj4gLS0gDQo+IC0tIA0KPiBUaG9tYXMgWmlt
bWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFua2Vuc3RyLiAxNDYsIDkwNDYxIE7DvHJuYmVyZywg
R2VybWFueSwgd3d3LnN1c2UuY29tDQo+IEdGOiBKb2NoZW4gSmFzZXIsIEFuZHJldyBNY0RvbmFs
ZCwgV2VybmVyIEtub2JsaWNoLCAoSFJCIDM2ODA5LCBBRyANCj4gTsO8cm5iZXJnKQ0KPiANCj4g
DQoNCg==
