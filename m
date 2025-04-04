Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0364A7BA96
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 12:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C89910E31C;
	Fri,  4 Apr 2025 10:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="B2Qv0lv+";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="gINkLvzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C510E31C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 10:20:45 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5347e4tv031458;
 Fri, 4 Apr 2025 11:20:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=x4m0wwWnABJ5AR5/96UYuf3h3
 1kKmnvCAmJbFDKa7uk=; b=B2Qv0lv+j+mzWEs86wVxCzO7tW9ENmMqQ4NDEziEz
 rMFQCcEHofO2I1lbLHF+hCG0u64iOvs7O9YWQXTfgPaNTDXGRXbnE4/Zw3DO7NpD
 OBsPD601amJ/jczYeQw6G6c+T9qc8upw38WBNUUs903UqtRiHCjBWl6UwQZmo0Fj
 hNlXU9j3cRDV8QgwMN2sQ1KGogVoy1pJIAd4rVr6+KxrXZgjthxNF3HyPuCfyGBV
 k3e1KKGwP2puHftaPER16ovXHkNNlXX8bFPRm5+xddeAcO2PoZL6qQA5tfuwUVJu
 jGdooVoGnP+BcHGfkFKOhy7Fdo0MPJUlGBpKkCdAXhYQw==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010004.outbound.protection.outlook.com [40.93.68.4])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45sg1qh1ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Apr 2025 11:20:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fE8ke+JCsv6fNVkc7t/vONQBIGoANNtdAPMBDw45q/aO2Nw+GFJFnPWJPMCAFoM/aetjfp9rEpd26HBaI2jPdik2idjhX2APnPF7cRFvkjWJMeOuHm3M6A9WSF3hd1sAokelh4++xJC9cYcCPsMFc/+I2yAhPwlN/6pI3a1ZNZ2ibRdR2ehZqGS6iNpqjTw42D00OhOFbgk5QKgXa9VbP0Fs/si4b/8lzy1IN+Qsh6gI445CmKeeKh+XuNmUfRIYO4GJFvr+p1DWzJLl9GIRyT76D+Wgma3LBJNCLgOXyN0cfiHR2FrFRfU9bCHiW/ydMfLClF4W0rNUbiSQaAc6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4m0wwWnABJ5AR5/96UYuf3h31kKmnvCAmJbFDKa7uk=;
 b=fN186mluIgcFTfwKT/tN0XHeFQM6OmtgfjEHbHCAwMtOwT0EDvoiZPw4BspOaOc1zC/0Ouljfp4vak/f9bKB9idX7uZYwTIjmTe9BEbyO3JxMnzuPnu2n1QMwK+uE0x7cixf9MzUR50Bjhu9ankWWb83Ao5sjWfLv0uTOHEI/OwQUGxr1+BP4ngmZfGFnCZbrGDEZ4b2ZK3rBPFrA5mIzJbb/E6dq2vxcPQX6OEpHMmAOJWNkCr5xOFcEF1KKlaTFXC17ri3ARANwk16xiLcJWjdaH2KYSid4BjzsLkuQ7m+0vdebmv3F6nQLppsAsB9K6o/dWUaZM7XbE3PAuBfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4m0wwWnABJ5AR5/96UYuf3h31kKmnvCAmJbFDKa7uk=;
 b=gINkLvzYZ/UFKEOBVu4Exwl9/zO/xMnQfw7q5DUZIONjlMRfa0UiKeqwMGpHlKdiH//lG+b2xbGtw592jT6+djPxnlAR2nbHB415wvv3iTR4OU0gR27em/UGvatogmjUR9f6SBaZ0wvgEYbkcqxQaCy+qjbMbhbxsfyoh0LG+Hw=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB3013.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.11; Fri, 4 Apr 2025 10:20:19 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8632.011; Fri, 4 Apr 2025
 10:20:19 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alexandru Dadu <Alexandru.Dadu@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: loop counters moved to loop scope
Thread-Topic: [PATCH v2] drm/imagination: loop counters moved to loop scope
Thread-Index: AQHbo6rYQay1TewG+EuHc4hcB0HINLOTTv0A
Date: Fri, 4 Apr 2025 10:20:19 +0000
Message-ID: <b79f9391-2d99-4d4d-b4a0-d2e9a47019a1@imgtec.com>
References: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>
In-Reply-To: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB3013:EE_
x-ms-office365-filtering-correlation-id: 45d67427-0d87-49d4-e909-08dd73624d12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dXhpc1hidGVQMGwzOGRXUlNvelJZVUZDb2hZTnlkMXVjQVZKUzVYcFpMdDlS?=
 =?utf-8?B?RnYrMlUvWDFPc25hSmdTek9lVHI5ck1JZ254aEdZd3gzWjdvaEpKV1l1VS9I?=
 =?utf-8?B?aU9JaHdDZWx5SjhuclFlRGR5SDl3M2lNRnBkZkpGbXQ3bktGakxhS1BLYnJ0?=
 =?utf-8?B?bzN4V3Z4NUJJY3ZsNXNmOHBiK1N0ck51bkVxS2ZuRDF0NWt4ZmtoWDlyaEJM?=
 =?utf-8?B?N3Fjd3lIcjNMSjJGVldFc0dZK3pZRW1zWTRYS0tqa1pPOFY4ZnJOSXpQWHpk?=
 =?utf-8?B?aHlZZXJnSzB3ZmZjekRGTU5aUmlNeXJSQ3pUVnE1R0Rxc01PbmdBZGtDS0dv?=
 =?utf-8?B?MnJXYldIRjJrc2RRMTFHMkhuUlhYNEtndzJIMlE5UWFsSExVcnUrOUJqMng0?=
 =?utf-8?B?WHNGeEtGWXV2UkM3NXdxcjRlUGR3QnFXWVRaMTQybFVLbWE2KzFJWXZuM3FY?=
 =?utf-8?B?cnpjb1p1bUxiU1AxRXUwbk9pcWt3Mm9vRHY2MHdUWGgveC9oS1FFMEJhM1o2?=
 =?utf-8?B?bkcxTmNZeFYxYml1UEYvSnpYN0ZwcHJBeDFIcXRaaTZHUUcyU1VVRlpIRUJT?=
 =?utf-8?B?OUpYR05KNS9YYTA2K3gzVXE4Z0ZrcThzUDNUc3ZzcVRZK200d1RZZHZET3Rh?=
 =?utf-8?B?cjVxdi9rR0VUdjBBK3ViNzJ1NkZWK2paZXY0TExyK01FOTNKQTZIT1F0MzRO?=
 =?utf-8?B?OTFNR25MY0VSMFJmM2hTRVZlSnFHQm96L2doZFYxNnhFRWNxTjg5Zlc4ek5Y?=
 =?utf-8?B?TSs5YnBIaFI1UkhxRyt4N1BJdzVzL1RucDNnaEN5Ly9WUmhSdm9zQW5JWURS?=
 =?utf-8?B?YWVuVFFtQW1mU0xFSHNUR2oxSklCTWlmaGhJZGI4VTJvNFIrNGs1YVFISDEv?=
 =?utf-8?B?MUx3QlZ0UjNIcjlQS2R0Zy85VVVvOHZwMUxleVh0Yjl3MlF1MVFmdVErK2hk?=
 =?utf-8?B?M3ZvQWZpS0l4RGNJKzJ4MVR1S1UxSUlCSVZkTVE4U1Y5ejY5US9qU1lnWXp4?=
 =?utf-8?B?KzlGTUFRbjhTTWtYT21yOHJkWk15QXpkelV4cGloQzhBKzRpdFMxTDFCcmh3?=
 =?utf-8?B?ZmdySHpnWm1kbmlWeUNIQXo0ZnVGbGc3NXh6WGVKS25XUkJlS2FHbGIwQzlX?=
 =?utf-8?B?TERqK0tybklSUDVOUVRDRjI0VnB2T2VtQlYvaWNrelh0YWw1MUkvbzdXTXVa?=
 =?utf-8?B?aW1GUlovREdjQ1pOMHJoQ015YlcvSU5EOFpFNkh3TXhwU0VHam80QUY1bnJL?=
 =?utf-8?B?ajNsSFpjWCtWY0ZHSVlPZjRrendXQnMwdUJZNjFLdUNBZURySVdNRHpVZGhy?=
 =?utf-8?B?Zm5ScmEwMDdUeUJDcm9ZL1d4UE0zbERQZUlCbVpJeWxUbXE4RlRldC9FSTlw?=
 =?utf-8?B?U3d2enhubnV0Y3g5dEdnMDVjeS9NMWlxMkM4OU9UU2tJR1pDcE1lUVg2MXFD?=
 =?utf-8?B?K2ZlcEl4am9zdTlFRUZBdWFaVHAyaW5ySmN6SmwxMkM2aG1UZm9SWjVEd0Fs?=
 =?utf-8?B?YWRMZmZIdE5lWXpLV1NrcnNhMGJ1L1FxL01aMkVaUHFhWWFvWVNVbXJlY1Q3?=
 =?utf-8?B?Y0JFb2ZSVjhvQmJWUU9VRXE1RDNPSnlYZ2YzcTNnYStWTjhOQisxUlhNNzVY?=
 =?utf-8?B?Sm0zdkZJT3RHMG92YjVqNTJJZEllbmNPd0xIRDFiNzhKNnJwS0VoTjNheTZN?=
 =?utf-8?B?RWh5YmlwUWgwMlUrUGQzcUdJNnEvNnJkTUttcWJOZTNGdzdWN0NUK2UwV1N6?=
 =?utf-8?B?WVBPd1dPOC82a20xamtUcEtveEx5ZGlNV1RRWGxmZDVSZlk3T0hxeWxEcS84?=
 =?utf-8?B?SmVwS0luVjhwZWZEU0ZrcEJGcldZQ1ZGdDJhd1NaemNVRGJqVFYzQUgwenZU?=
 =?utf-8?B?N2dKYXVYL0w5cHNCYW1NVmk3WnhKNXdseWVTYXMyMDRoNkxrWUt3T1V5MDZJ?=
 =?utf-8?Q?1Tw1/zyGcsqvyj38XBtNLiutKMsULFFu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blh2RkNUOXBkNGJkN0EwcXgrVjRkSnhJV2xSaGwyNFpHeXcvOHg0NGh0RXIx?=
 =?utf-8?B?SkkvUEd0RnpSWTl4dVRMY2VDMUZoK0tBSU51OUVsMGZwYVI4SnBSb0R0ZFRX?=
 =?utf-8?B?Nlo5dkdpQWZmaXNTUHpacHRTZEYzNU9WbExRbjVNclJCRk5sTlRKNEFlTjRr?=
 =?utf-8?B?TWwrTDdGTVNvTUpSWXo3OEVCbWRUTE4yUkNjM3N3c1FIbU4vRFJRQTN5dW43?=
 =?utf-8?B?alJ4Z1prWkdRU0xFVnMyeGZ3bWZoVFB3bmxpNmlhai9TOENMc3Z6M2h5cHZh?=
 =?utf-8?B?amlJWW5lYndMUTUyY0k0WmVOTVVDZnFIT0ZzamdLMWJveG4rMFp1V2p4T2lK?=
 =?utf-8?B?TVhGWXNzaFJkbm5leW93WUJheERzNk1JQTNRNGZ2M0c0WXgxeTJKc2svSGgy?=
 =?utf-8?B?eVBVZnJQbHdRQkRWR3lpUy9CM283dDE4MktWeFIydTZjcjllSWNRM2JFVGZP?=
 =?utf-8?B?ZnVhR21rT2dpQ0dZbWJ5QnBHdzl1YkJoL00yWnNmVnZNT0swQzJIZktmNnNJ?=
 =?utf-8?B?Smo3azE5Ukh2NTl6QTF2MjVnVVcvRWpHd0ZTejYyY3hHTlNuZE5EZ25tcXA2?=
 =?utf-8?B?TDNOUFg2MnVHUW51M200Zk1RZXcrcjBBVXRsZFFoWDhZb3U5ME1YU1pGcWpi?=
 =?utf-8?B?ZlNKNEx4L1FuZDM1Q0pTWnhlaG9XOUtRUEZRZFdpOVllbVRpYU9OcWt6UUdh?=
 =?utf-8?B?dkJ4d01lS2ZDOHM0ZEtYNEFIZ05zM0loYkJ6Z3VHckFnN2t0a1RGaW54dEdh?=
 =?utf-8?B?cWRBN0JzcXlPOFVzb1NqRVUyUjBuQUtZQVIvYWZmcE1WMys3ZldGYjBYbTcy?=
 =?utf-8?B?WHUwUnZGNC9NM1BLVCt4NGpQSnNuckNFenZmQTBMVkVMeHViSjd1ZkJmVGY2?=
 =?utf-8?B?SWdrbE84QkZSQjkvMEttUExjYmlrTE1LSW9VWGRBZzJFbElzaFVIOTZvZDZp?=
 =?utf-8?B?YXAyaEczQXdKcStKOGpSdDFIRW5WMjFoWlM1MVRxZ0taaDBFcXhmZEVEOHlM?=
 =?utf-8?B?aXlBblZPRmZ1ZW9nYlU1M0FMQ0V5Z0NVNmtraGR6T09hSUZiZ3RLeisvcjcv?=
 =?utf-8?B?dGxwcmxmLzgyQ3RuNTNZT1QrMlM1akJ6QWwwQldqRk5XaFV5RTdDK3pzRHhm?=
 =?utf-8?B?TTIyNXhwdHQyMkZWRzVHdktDQVBHYVpPVC9tNVgvdGg0d3lNMlRrU2pyK3lP?=
 =?utf-8?B?R2xGMkdUbFB3VU1FRjRxd3pHanpNUFRaY3VzSDdNWkFWNWRselBDTjRWV3NV?=
 =?utf-8?B?SWVzM3RNL2V1WmpxOTZHaGJoTmJHdmVBeFgrSXNKRm5HQ3JqWURaU2FRSFdj?=
 =?utf-8?B?L0dEMHRNK3premdYVkU0NkVKeEovN0pIdnZtK01HN3BKbS9nQS9TYjBnYTdC?=
 =?utf-8?B?T085MkNYYjUyTkpZZlhPWVhPTkRPWG9PYXVHbUVuMGJnT3lsY2pqNVpXbWJz?=
 =?utf-8?B?QXZTU24rWVpaWG40UE9kN21aU21Oa0w5Q1JJRGJZUVUvKzhUN0l5S0FIS2k3?=
 =?utf-8?B?Q0ZpQUZGK3BXZk9XOUJMYngxdVFyQThZZXc0TmtReThUamQweTVWT3BuZmVh?=
 =?utf-8?B?OTRrTHZLbzArNkg5ZlRoUG5xS1NKTXV2Wlh0SDFpcWhrWUlFUEtKamk5aXgy?=
 =?utf-8?B?dFY4VjhaR3V4OG1yS0IvRTNjTk5kQTRtNFI2S1R0ZnBFYlZjSlNCOWFKREpE?=
 =?utf-8?B?N3l0UFdMcU9qemNBMEhHLzU3NXBZZ2FSeFZqdVJScExKaGllSDh0UFNkOGg1?=
 =?utf-8?B?MCtabGxIRVNvd1J0ek1xcVJxV2l6YThTSERIczBTaDZPTmVFT0tWNUwxQTJ2?=
 =?utf-8?B?WFFKZVVPVzJCaC9uYUswQ0FxaW53VURmOW5SSjlVUW1hM24wcVdaWlNXblVQ?=
 =?utf-8?B?YmxSZFZSR3JEOUNZSWhaS1kxa1cyVUxISm1aMnFORzUxQ0twNE5ydGJ3Mmsx?=
 =?utf-8?B?L0dta3FrZE1wbVlySU9vUXNBMEgraEJEcGdXVkN2RTlPejlkQTZJOE0xUk8y?=
 =?utf-8?B?VTNPT2lmSlVJM1pSbW9KV21CallUNmFJU21POE1WRWx1Rjg4Ynk0QUlTb3RN?=
 =?utf-8?B?VDEzWWJhWUlCbDQ0aUZmSngxSzRQRlhPMmxrb2RKV211VlliSFhXZGJJd2Iy?=
 =?utf-8?B?R1NOWnV2aFBvcG9Na2NQR2Uwelo2VWZ1V25NYUcvb2c2SzM2dXdCU3lyL1RK?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------90fxWH52m5CqqococGL0K0Oe"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d67427-0d87-49d4-e909-08dd73624d12
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 10:20:19.3409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBa8QF2Ztyw34l+YOl5R4vMgzakdreeOg6HJiC5rO3VF2JbwrWNZuiRqePd1JgyHmumrZUi/8mFYu8/z5/II2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3013
X-Authority-Analysis: v=2.4 cv=S8HZwJsP c=1 sm=1 tr=0 ts=67efb267 cx=c_pps
 a=tbUAc5YXJZE2aXMCunvlBA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=iJnY2EXcRThUePSrK04A:9
 a=QEXdDO2ut3YA:10 a=oVbbWKwRlYsmPyuGzBcA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: igl5H45q_Vdiq3Jr6TpLMH6nuX4E0-ei
X-Proofpoint-ORIG-GUID: igl5H45q_Vdiq3Jr6TpLMH6nuX4E0-ei
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

--------------90fxWH52m5CqqococGL0K0Oe
Content-Type: multipart/mixed; boundary="------------040A0P0AYqQQTKmEMrnbxBH0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <b79f9391-2d99-4d4d-b4a0-d2e9a47019a1@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: loop counters moved to loop scope
References: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>
In-Reply-To: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>

--------------040A0P0AYqQQTKmEMrnbxBH0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/04/2025 09:40, Alexandru Dadu wrote:
> Reduce the scope of some loop counters as these aren't needed outside
> the loops they're used in.
>=20
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>

Hi Alexandru,

Thanks for dragging us into the bright, bright future of (C)99!

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll apply this to drm-misc-next on Monday if nobody has any objections.

Cheers,
Matt

> ---
> Changes in v2:
> - Remove a loop counter variable definition
> - Link to v1: https://lore.kernel.org/r/20250401-for-loop-counter-scope=
-v1-1-5ba75770be52@imgtec.com
> ---
>  drivers/gpu/drm/imagination/pvr_debugfs.c   |  3 +--
>  drivers/gpu/drm/imagination/pvr_free_list.c |  3 +--
>  drivers/gpu/drm/imagination/pvr_fw.c        | 12 ++++--------
>  drivers/gpu/drm/imagination/pvr_fw_meta.c   |  3 +--
>  drivers/gpu/drm/imagination/pvr_fw_mips.c   |  6 ++----
>  drivers/gpu/drm/imagination/pvr_fw_trace.c  | 23 ++++++++-------------=
--
>  drivers/gpu/drm/imagination/pvr_gem.c       |  4 +---
>  drivers/gpu/drm/imagination/pvr_hwrt.c      | 12 ++++--------
>  drivers/gpu/drm/imagination/pvr_stream.c    | 12 ++++--------
>  drivers/gpu/drm/imagination/pvr_vm_mips.c   |  3 +--
>  10 files changed, 27 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.c b/drivers/gpu/dr=
m/imagination/pvr_debugfs.c
> index 6b77c9b4bde880cac6606764952d14be6c30b230..c7ce7daaa87a09b1c8e79f3=
91e54b93642f0cb26 100644
> --- a/drivers/gpu/drm/imagination/pvr_debugfs.c
> +++ b/drivers/gpu/drm/imagination/pvr_debugfs.c
> @@ -28,9 +28,8 @@ pvr_debugfs_init(struct drm_minor *minor)
>         struct drm_device *drm_dev =3D minor->dev;
>         struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
>         struct dentry *root =3D minor->debugfs_root;
> -       size_t i;
>=20
> -       for (i =3D 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
> +       for (size_t i =3D 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) =
{
>                 const struct pvr_debugfs_entry *entry =3D &pvr_debugfs_=
entries[i];
>                 struct dentry *dir;
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_free_list.c b/drivers/gpu/=
drm/imagination/pvr_free_list.c
> index 5e51bc980751c9e84f5365b633a22540426631ee..5228e214491c6217965a465=
dd91d52bd2a0b8945 100644
> --- a/drivers/gpu/drm/imagination/pvr_free_list.c
> +++ b/drivers/gpu/drm/imagination/pvr_free_list.c
> @@ -237,11 +237,10 @@ pvr_free_list_insert_pages_locked(struct pvr_free=
_list *free_list,
>                 dma_addr_t dma_addr =3D sg_page_iter_dma_address(&dma_i=
ter);
>                 u64 dma_pfn =3D dma_addr >>
>                                ROGUE_BIF_PM_PHYSICAL_PAGE_ALIGNSHIFT;
> -               u32 dma_addr_offset;
>=20
>                 BUILD_BUG_ON(ROGUE_BIF_PM_PHYSICAL_PAGE_SIZE > PAGE_SIZ=
E);
>=20
> -               for (dma_addr_offset =3D 0; dma_addr_offset < PAGE_SIZE=
;
> +               for (u32 dma_addr_offset =3D 0; dma_addr_offset < PAGE_=
SIZE;
>                      dma_addr_offset +=3D ROGUE_BIF_PM_PHYSICAL_PAGE_SI=
ZE) {
>                         WARN_ON_ONCE(dma_pfn >> 32);
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/ima=
gination/pvr_fw.c
> index 3debc9870a82ae7de9b2dc173df84c466c137bb3..d43efa8810b80f77edde8a6=
901317e43e629b4b3 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw.c
> @@ -50,9 +50,8 @@ pvr_fw_find_layout_entry(struct pvr_device *pvr_dev, =
enum pvr_fw_section_id id)
>  {
>         const struct pvr_fw_layout_entry *layout_entries =3D pvr_dev->f=
w_dev.layout_entries;
>         u32 num_layout_entries =3D pvr_dev->fw_dev.header->layout_entry=
_num;
> -       u32 entry;
>=20
> -       for (entry =3D 0; entry < num_layout_entries; entry++) {
> +       for (u32 entry =3D 0; entry < num_layout_entries; entry++) {
>                 if (layout_entries[entry].id =3D=3D id)
>                         return &layout_entries[entry];
>         }
> @@ -65,9 +64,8 @@ pvr_fw_find_private_data(struct pvr_device *pvr_dev)
>  {
>         const struct pvr_fw_layout_entry *layout_entries =3D pvr_dev->f=
w_dev.layout_entries;
>         u32 num_layout_entries =3D pvr_dev->fw_dev.header->layout_entry=
_num;
> -       u32 entry;
>=20
> -       for (entry =3D 0; entry < num_layout_entries; entry++) {
> +       for (u32 entry =3D 0; entry < num_layout_entries; entry++) {
>                 if (layout_entries[entry].id =3D=3D META_PRIVATE_DATA |=
|
>                     layout_entries[entry].id =3D=3D MIPS_PRIVATE_DATA |=
|
>                     layout_entries[entry].id =3D=3D RISCV_PRIVATE_DATA)=

> @@ -97,7 +95,6 @@ pvr_fw_validate(struct pvr_device *pvr_dev)
>         const u8 *fw =3D firmware->data;
>         u32 fw_offset =3D firmware->size - SZ_4K;
>         u32 layout_table_size;
> -       u32 entry;
>=20
>         if (firmware->size < SZ_4K || (firmware->size % FW_BLOCK_SIZE))=

>                 return -EINVAL;
> @@ -144,7 +141,7 @@ pvr_fw_validate(struct pvr_device *pvr_dev)
>                 return -EINVAL;
>=20
>         layout_entries =3D (const struct pvr_fw_layout_entry *)&fw[fw_o=
ffset];
> -       for (entry =3D 0; entry < header->layout_entry_num; entry++) {
> +       for (u32 entry =3D 0; entry < header->layout_entry_num; entry++=
) {
>                 u32 start_addr =3D layout_entries[entry].base_addr;
>                 u32 end_addr =3D start_addr + layout_entries[entry].all=
oc_size;
>=20
> @@ -233,13 +230,12 @@ pvr_fw_find_mmu_segment(struct pvr_device *pvr_de=
v, u32 addr, u32 size, void *fw
>         const struct pvr_fw_layout_entry *layout_entries =3D pvr_dev->f=
w_dev.layout_entries;
>         u32 num_layout_entries =3D pvr_dev->fw_dev.header->layout_entry=
_num;
>         u32 end_addr =3D addr + size;
> -       int entry =3D 0;
>=20
>         /* Ensure requested range is not zero, and size is not causing =
addr to overflow. */
>         if (end_addr <=3D addr)
>                 return -EINVAL;
>=20
> -       for (entry =3D 0; entry < num_layout_entries; entry++) {
> +       for (int entry =3D 0; entry < num_layout_entries; entry++) {
>                 u32 entry_start_addr =3D layout_entries[entry].base_add=
r;
>                 u32 entry_end_addr =3D entry_start_addr + layout_entrie=
s[entry].alloc_size;
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/dr=
m/imagination/pvr_fw_meta.c
> index c39beb70c3173ebdab13b4e810ce5d9a3419f0ba..d8004a56b1f4e29be3a773a=
41a7ffd74c14c5786 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
> @@ -370,13 +370,12 @@ configure_seg_mmu(struct pvr_device *pvr_dev, u32=
 **boot_conf_ptr)
>         const struct pvr_fw_layout_entry *layout_entries =3D pvr_dev->f=
w_dev.layout_entries;
>         u32 num_layout_entries =3D pvr_dev->fw_dev.header->layout_entry=
_num;
>         u64 seg_out_addr_top;
> -       u32 i;
>=20
>         seg_out_addr_top =3D
>                 ROGUE_FW_SEGMMU_OUTADDR_TOP_SLC(MMU_CONTEXT_MAPPING_FWP=
RIV,
>                                                 ROGUE_FW_SEGMMU_META_BI=
FDM_ID);
>=20
> -       for (i =3D 0; i < num_layout_entries; i++) {
> +       for (u32 i =3D 0; i < num_layout_entries; i++) {
>                 /*
>                  * FW code is using the bootloader segment which is alr=
eady
>                  * configured on boot. FW coremem code and data don't u=
se the
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/dr=
m/imagination/pvr_fw_mips.c
> index 0bed0257e2ab75f66d8b8966b2ceac6342396fb5..ee0735b745a9ff5c99637c2=
cb312998679f47fd3 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
> @@ -37,10 +37,9 @@ process_elf_command_stream(struct pvr_device *pvr_de=
v, const u8 *fw, u8 *fw_code
>         struct elf32_hdr *header =3D (struct elf32_hdr *)fw;
>         struct elf32_phdr *program_header =3D (struct elf32_phdr *)(fw =
+ header->e_phoff);
>         struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> -       u32 entry;
>         int err;
>=20
> -       for (entry =3D 0; entry < header->e_phnum; entry++, program_hea=
der++) {
> +       for (u32 entry =3D 0; entry < header->e_phnum; entry++, program=
_header++) {
>                 void *write_addr;
>=20
>                 /* Only consider loadable entries in the ELF segment ta=
ble */
> @@ -97,7 +96,6 @@ pvr_mips_fw_process(struct pvr_device *pvr_dev, const=
 u8 *fw,
>         const struct pvr_fw_layout_entry *stack_entry;
>         struct rogue_mipsfw_boot_data *boot_data;
>         dma_addr_t dma_addr;
> -       u32 page_nr;
>         int err;
>=20
>         err =3D process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw=
_data_ptr, fw_core_code_ptr,
> @@ -132,7 +130,7 @@ pvr_mips_fw_process(struct pvr_device *pvr_dev, con=
st u8 *fw,
>=20
>         boot_data->reg_base =3D pvr_dev->regs_resource->start;
>=20
> -       for (page_nr =3D 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_add=
r); page_nr++) {
> +       for (u32 page_nr =3D 0; page_nr < ARRAY_SIZE(boot_data->pt_phys=
_addr); page_nr++) {
>                 /* Firmware expects 4k pages, but host page size might =
be different. */
>                 u32 src_page_nr =3D (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4=
K) >> PAGE_SHIFT;
>                 u32 page_offset =3D (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4=
K) & ~PAGE_MASK;
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.c
> index 73707daa4e52d13fd1388cb2e9feff0aea109620..74b4c21ea69fbc4f2a97a5b=
283a71ffed88f0882 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -21,7 +21,6 @@ tracebuf_ctrl_init(void *cpu_ptr, void *priv)
>  {
>         struct rogue_fwif_tracebuf *tracebuf_ctrl =3D cpu_ptr;
>         struct pvr_fw_trace *fw_trace =3D priv;
> -       u32 thread_nr;
>=20
>         tracebuf_ctrl->tracebuf_size_in_dwords =3D ROGUE_FW_TRACE_BUF_D=
EFAULT_SIZE_IN_DWORDS;
>         tracebuf_ctrl->tracebuf_flags =3D 0;
> @@ -31,7 +30,7 @@ tracebuf_ctrl_init(void *cpu_ptr, void *priv)
>         else
>                 tracebuf_ctrl->log_type =3D ROGUE_FWIF_LOG_TYPE_NONE;
>=20
> -       for (thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buffers)=
; thread_nr++) {
> +       for (u32 thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buff=
ers); thread_nr++) {
>                 struct rogue_fwif_tracebuf_space *tracebuf_space =3D
>                         &tracebuf_ctrl->tracebuf[thread_nr];
>                 struct pvr_fw_trace_buffer *trace_buffer =3D &fw_trace-=
>buffers[thread_nr];
> @@ -48,10 +47,9 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
>  {
>         struct pvr_fw_trace *fw_trace =3D &pvr_dev->fw_dev.fw_trace;
>         struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> -       u32 thread_nr;
>         int err;
>=20
> -       for (thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buffers)=
; thread_nr++) {
> +       for (u32 thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buff=
ers); thread_nr++) {
>                 struct pvr_fw_trace_buffer *trace_buffer =3D &fw_trace-=
>buffers[thread_nr];
>=20
>                 trace_buffer->buf =3D
> @@ -88,7 +86,7 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
>         BUILD_BUG_ON(ARRAY_SIZE(fw_trace->tracebuf_ctrl->tracebuf) !=3D=

>                      ARRAY_SIZE(fw_trace->buffers));
>=20
> -       for (thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buffers)=
; thread_nr++) {
> +       for (u32 thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buff=
ers); thread_nr++) {
>                 struct rogue_fwif_tracebuf_space *tracebuf_space =3D
>                         &fw_trace->tracebuf_ctrl->tracebuf[thread_nr];
>                 struct pvr_fw_trace_buffer *trace_buffer =3D &fw_trace-=
>buffers[thread_nr];
> @@ -99,7 +97,7 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
>         return 0;
>=20
>  err_free_buf:
> -       for (thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buffers)=
; thread_nr++) {
> +       for (u32 thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buff=
ers); thread_nr++) {
>                 struct pvr_fw_trace_buffer *trace_buffer =3D &fw_trace-=
>buffers[thread_nr];
>=20
>                 if (trace_buffer->buf)
> @@ -112,9 +110,8 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
>  void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
>  {
>         struct pvr_fw_trace *fw_trace =3D &pvr_dev->fw_dev.fw_trace;
> -       u32 thread_nr;
>=20
> -       for (thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buffers)=
; thread_nr++) {
> +       for (u32 thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buff=
ers); thread_nr++) {
>                 struct pvr_fw_trace_buffer *trace_buffer =3D &fw_trace-=
>buffers[thread_nr];
>=20
>                 pvr_fw_object_unmap_and_destroy(trace_buffer->buf_obj);=

> @@ -184,9 +181,7 @@ struct pvr_fw_trace_seq_data {
>=20
>  static u32 find_sfid(u32 id)
>  {
> -       u32 i;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(stid_fmts); i++) {
> +       for (u32 i =3D 0; i < ARRAY_SIZE(stid_fmts); i++) {
>                 if (stid_fmts[i].id =3D=3D id)
>                         return i;
>         }
> @@ -285,12 +280,11 @@ static void fw_trace_get_first(struct pvr_fw_trac=
e_seq_data *trace_seq_data)
>  static void *fw_trace_seq_start(struct seq_file *s, loff_t *pos)
>  {
>         struct pvr_fw_trace_seq_data *trace_seq_data =3D s->private;
> -       u32 i;
>=20
>         /* Reset trace index, then advance to *pos. */
>         fw_trace_get_first(trace_seq_data);
>=20
> -       for (i =3D 0; i < *pos; i++) {
> +       for (u32 i =3D 0; i < *pos; i++) {
>                 if (!fw_trace_get_next(trace_seq_data))
>                         return NULL;
>         }
> @@ -455,12 +449,11 @@ void
>  pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *d=
ir)
>  {
>         struct pvr_fw_trace *fw_trace =3D &pvr_dev->fw_dev.fw_trace;
> -       u32 thread_nr;
>=20
>         static_assert(ARRAY_SIZE(fw_trace->buffers) <=3D 10,
>                       "The filename buffer is only large enough for a s=
ingle-digit thread count");
>=20
> -       for (thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buffers)=
; ++thread_nr) {
> +       for (u32 thread_nr =3D 0; thread_nr < ARRAY_SIZE(fw_trace->buff=
ers); ++thread_nr) {
>                 char filename[8];
>=20
>                 snprintf(filename, ARRAY_SIZE(filename), "trace_%u", th=
read_nr);
> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/im=
agination/pvr_gem.c
> index 6a8c81fe8c1e85c2130a4fe90fce35b6a2be35aa..f936fc7d4e4d16fabe7836e=
4b053de6a11d3577e 100644
> --- a/drivers/gpu/drm/imagination/pvr_gem.c
> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
> @@ -76,8 +76,6 @@ pvr_gem_object_flags_validate(u64 flags)
>                  DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS),
>         };
>=20
> -       int i;
> -
>         /*
>          * Check for bits set in undefined regions. Reserved regions re=
fer to
>          * options that can only be set by the kernel. These are explic=
itly
> @@ -91,7 +89,7 @@ pvr_gem_object_flags_validate(u64 flags)
>          * Check for all combinations of flags marked as invalid in the=
 array
>          * above.
>          */
> -       for (i =3D 0; i < ARRAY_SIZE(invalid_combinations); ++i) {
> +       for (int i =3D 0; i < ARRAY_SIZE(invalid_combinations); ++i) {
>                 u64 combo =3D invalid_combinations[i];
>=20
>                 if ((flags & combo) =3D=3D combo)
> diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/i=
magination/pvr_hwrt.c
> index 54f88d6c01e565f4f0d1bd4fcc7e2983914b9141..dc0c25fa184700992c8e986=
466a2020e4b2ad355 100644
> --- a/drivers/gpu/drm/imagination/pvr_hwrt.c
> +++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
> @@ -44,13 +44,12 @@ hwrt_init_kernel_structure(struct pvr_file *pvr_fil=
e,
>  {
>         struct pvr_device *pvr_dev =3D pvr_file->pvr_dev;
>         int err;
> -       int i;
>=20
>         hwrt->pvr_dev =3D pvr_dev;
>         hwrt->max_rts =3D args->layers;
>=20
>         /* Get pointers to the free lists */
> -       for (i =3D 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
> +       for (int i =3D 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
>                 hwrt->free_lists[i] =3D pvr_free_list_lookup(pvr_file, =
 args->free_list_handles[i]);
>                 if (!hwrt->free_lists[i]) {
>                         err =3D -EINVAL;
> @@ -67,7 +66,7 @@ hwrt_init_kernel_structure(struct pvr_file *pvr_file,=

>         return 0;
>=20
>  err_put_free_lists:
> -       for (i =3D 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
> +       for (int i =3D 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
>                 pvr_free_list_put(hwrt->free_lists[i]);
>                 hwrt->free_lists[i] =3D NULL;
>         }
> @@ -78,9 +77,7 @@ hwrt_init_kernel_structure(struct pvr_file *pvr_file,=

>  static void
>  hwrt_fini_kernel_structure(struct pvr_hwrt_dataset *hwrt)
>  {
> -       int i;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
> +       for (int i =3D 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
>                 pvr_free_list_put(hwrt->free_lists[i]);
>                 hwrt->free_lists[i] =3D NULL;
>         }
> @@ -363,13 +360,12 @@ hwrt_data_init_fw_structure(struct pvr_file *pvr_=
file,
>         struct drm_pvr_create_hwrt_geom_data_args *geom_data_args =3D &=
args->geom_data_args;
>         struct pvr_device *pvr_dev =3D pvr_file->pvr_dev;
>         struct rogue_fwif_rta_ctl *rta_ctl;
> -       int free_list_i;
>         int err;
>=20
>         pvr_fw_object_get_fw_addr(hwrt->common_fw_obj,
>                                   &hwrt_data->data.hwrt_data_common_fw_=
addr);
>=20
> -       for (free_list_i =3D 0; free_list_i < ARRAY_SIZE(hwrt->free_lis=
ts); free_list_i++) {
> +       for (int free_list_i =3D 0; free_list_i < ARRAY_SIZE(hwrt->free=
_lists); free_list_i++) {
>                 pvr_fw_object_get_fw_addr(hwrt->free_lists[free_list_i]=
->fw_obj,
>                                           &hwrt_data->data.freelists_fw=
_addr[free_list_i]);
>         }
> diff --git a/drivers/gpu/drm/imagination/pvr_stream.c b/drivers/gpu/drm=
/imagination/pvr_stream.c
> index 975336a4facfd0472958c72683ed1a302f7144a1..679aa618b7a9cd2853c7f58=
0e326461c58b535bb 100644
> --- a/drivers/gpu/drm/imagination/pvr_stream.c
> +++ b/drivers/gpu/drm/imagination/pvr_stream.c
> @@ -67,9 +67,8 @@ pvr_stream_process_1(struct pvr_device *pvr_dev, cons=
t struct pvr_stream_def *st
>                      u8 *dest, u32 dest_size, u32 *stream_offset_out)
>  {
>         int err =3D 0;
> -       u32 i;
>=20
> -       for (i =3D 0; i < nr_entries; i++) {
> +       for (u32 i =3D 0; i < nr_entries; i++) {
>                 if (stream_def[i].offset >=3D dest_size) {
>                         err =3D -EINVAL;
>                         break;
> @@ -131,7 +130,6 @@ pvr_stream_process_ext_stream(struct pvr_device *pv=
r_dev,
>         u32 musthave_masks[PVR_STREAM_EXTHDR_TYPE_MAX];
>         u32 ext_header;
>         int err =3D 0;
> -       u32 i;
>=20
>         /* Copy "must have" mask from device. We clear this as we proce=
ss the stream. */
>         memcpy(musthave_masks, pvr_dev->stream_musthave_quirks[cmd_defs=
->type],
> @@ -159,7 +157,7 @@ pvr_stream_process_ext_stream(struct pvr_device *pv=
r_dev,
>=20
>                 musthave_masks[type] &=3D ~data;
>=20
> -               for (i =3D 0; i < header->ext_streams_num; i++) {
> +               for (u32 i =3D 0; i < header->ext_streams_num; i++) {
>                         const struct pvr_stream_ext_def *ext_def =3D &h=
eader->ext_streams[i];
>=20
>                         if (!(ext_header & ext_def->header_mask))
> @@ -181,7 +179,7 @@ pvr_stream_process_ext_stream(struct pvr_device *pv=
r_dev,
>          * Verify that "must have" mask is now zero. If it isn't then o=
ne of the "must have" quirks
>          * for this command was not present.
>          */
> -       for (i =3D 0; i < cmd_defs->ext_nr_headers; i++) {
> +       for (u32 i =3D 0; i < cmd_defs->ext_nr_headers; i++) {
>                 if (musthave_masks[i])
>                         return -EINVAL;
>         }
> @@ -245,13 +243,11 @@ pvr_stream_process(struct pvr_device *pvr_dev, co=
nst struct pvr_stream_cmd_defs
>                 if (err)
>                         return err;
>         } else {
> -               u32 i;
> -
>                 /*
>                  * If we don't have an extension stream then there must=
 not be any "must have"
>                  * quirks for this command.
>                  */
> -               for (i =3D 0; i < cmd_defs->ext_nr_headers; i++) {
> +               for (u32 i =3D 0; i < cmd_defs->ext_nr_headers; i++) {
>                         if (pvr_dev->stream_musthave_quirks[cmd_defs->t=
ype][i])
>                                 return -EINVAL;
>                 }
> diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/dr=
m/imagination/pvr_vm_mips.c
> index 94af854547d6c52471527b6388086a8f7a35aef4..5847a1c92bea8b0923628ad=
7b72913e8977d4b97 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
> @@ -100,10 +100,9 @@ pvr_vm_mips_fini(struct pvr_device *pvr_dev)
>  {
>         struct pvr_fw_device *fw_dev =3D &pvr_dev->fw_dev;
>         struct pvr_fw_mips_data *mips_data =3D fw_dev->processor_data.m=
ips_data;
> -       int page_nr;
>=20
>         vunmap(mips_data->pt);
> -       for (page_nr =3D PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >=3D 0; pa=
ge_nr--) {
> +       for (int page_nr =3D PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >=3D 0=
; page_nr--) {
>                 dma_unmap_page(from_pvr_device(pvr_dev)->dev,
>                                mips_data->pt_dma_addr[page_nr], PAGE_SI=
ZE, DMA_TO_DEVICE);
>=20
>=20
> ---
> base-commit: 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
> change-id: 20250401-for-loop-counter-scope-115373392913
>=20
> Best regards,
> --
> Alexandru Dadu <alexandru.dadu@imgtec.com>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------040A0P0AYqQQTKmEMrnbxBH0--

--------------90fxWH52m5CqqococGL0K0Oe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ++yYgUDAAAAAAAKCRB5vBnz2d5qsGfr
AP0SJs7ntFio9QDFaTEievp2Kd09VaJZxuUTmcJTLOFDYQD7Bq13jUx8wVwYm+Wfz1z8MseGjXNG
45auCvyQae0J3gc=
=aPue
-----END PGP SIGNATURE-----

--------------90fxWH52m5CqqococGL0K0Oe--
