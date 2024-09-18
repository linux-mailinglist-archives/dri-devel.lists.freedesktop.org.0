Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DB97B705
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 05:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C81310E521;
	Wed, 18 Sep 2024 03:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="naSIBY85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C91110E521
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 03:08:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnPAGvXmNyOmxNZgItLB1NOhv/4es5UnBKgpvSiJgriPU2JOuF8xqZtFs39nDjIDl7sgW5CATq2NwSqSQ6fd8FzDDF/8ce5mi2StodlBMTxL9+DwgWK7DkjsndqNVwvTmJr+zDWFiFhAtCJ8utJIzjcsk0i9hZ440TbQhLZPSs8DVMf8+bf2QcTGVYIzH2Ir0E4gIqxjzbkwgSruAajcqKhI7nHojRHGwSxyuBnWY+vSrin/qIm3Mv3YjPyho+hocUj5s6sgjvAR3o6CQlHwfi0/VVuwj4SaWjhj/aalR8rscp2egmq7ODjwepvkMYXnfAEezKGqO+/wZVM0BIyUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B2Oe74iSWnhk8PBs4ZW7mN3tcHNkJn0Oi/E7Y/h2Dc=;
 b=aYkULhJHBn1TF2xK+TrAIVDJb40VMo7H9LQ4LFZam/528NPGnE7gwgpNOsW3IBkckYRsnWiIwNwlNyT0ZkHw9g2yG/gE83eqHOtbNgDJybgbpWXRJtzwvi8E07/5HGFvaMCiz7GG2V3FT0cJwQosAOowhxchFtdAKkVie1Ste/+itHJ9EG2VRfwXUXpxVc6Yp8KNovZYd1Etrz08gyStVgzrSPt+FCkktFd6+PdlsOS52tYgaow9uoK+yrzKixINjoNqQEI9SL4QEUbGqi4Uje0Q9qW1HzezKOvadafKrtQuBDGQLDbw3fXEiaQedvdW/SRTTqDCiLAVFISSWQk/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B2Oe74iSWnhk8PBs4ZW7mN3tcHNkJn0Oi/E7Y/h2Dc=;
 b=naSIBY85E0u/1fq81RaCYZrG+y21yA832eXKKummGfyzgWJ6N2AGn8IVa2iPkWBRlRmzuoOySPA3yNxTBPQaUcsCWn1aWD81Dxn1u919iwW4Uq6AjyqAQP7r1es5rBRmTq4Nto5/hqBfsisuwrWfnGxIc1BiN9QQIDVlljnWz/19VLhh5qzqvIxAYdqqnX3Tj1MKqifQvWLm0Yjt988RsmddXdVR1ZxlaV2NKQYyetDgPyogmz+cLuaHF3v2Ycs7Van7IQ6Te04MlA3wmfTI4e7AV9/2J3R5y/QcZozN1JmteWeUB+ZkVtjmyWVx46312lCf/5czmrmANNTIat55CQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 03:08:15 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 03:08:15 +0000
From: <Manikandan.M@microchip.com>
To: <krzk@kernel.org>
CC: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel-simple: Document support
 for Microchip AC69T88A
Thread-Topic: [PATCH 1/2] dt-bindings: display: panel-simple: Document support
 for Microchip AC69T88A
Thread-Index: AQHbCOd/4P1bTjahw0mA0mav0u6PLrJbyV0AgAEU1AA=
Date: Wed, 18 Sep 2024 03:08:15 +0000
Message-ID: <46cb2204-ee5a-4999-b229-ee1282f96a69@microchip.com>
References: <20240917095330.267397-1-manikandan.m@microchip.com>
 <df51e0ae-a97d-4567-a16e-ef0667aac661@kernel.org>
In-Reply-To: <df51e0ae-a97d-4567-a16e-ef0667aac661@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|CY5PR11MB6415:EE_
x-ms-office365-filtering-correlation-id: e99fd8de-811d-44e5-bce1-08dcd78f2379
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MUhzaW81cm1CaFBRMS9ubTI5YXRvWFJ4SGZHUElxNlhTS2JZcE1zakd1cWFI?=
 =?utf-8?B?bTZ0NkVHL1NQcFFTbVVMZE1IaEY4Zk5pU3d0d3NBRHgydmZkU3gzYm9ibjVo?=
 =?utf-8?B?ZnJqM0M1cGlxRUhNZm5sWVNsWXdlZ0F4RTRsc09BbGJLdmVJMEc1ZHRnNUxn?=
 =?utf-8?B?ZlVDSWtTcGFzd2tjZFg3UE9MMDBTMElKcWVkZFROQjh5VWk2NkEyS0pOSU1O?=
 =?utf-8?B?aWRyeXBKQ3psSnpVN21MbmwxUDFpa0ZsaXNVUUVTQkFmeTk0TkVJVzREOFo2?=
 =?utf-8?B?TjhiVUxYMTZXK0F4ZXZGeUc1c3VtR2Yyb0xRbEpFR01JSUxUV0FDR0VlYitr?=
 =?utf-8?B?U0JBSXhZMXFEeGhnc0xhMFBGMXdVY3hnQ2trK2daNlY1MThRMFZ5dm8xWFlw?=
 =?utf-8?B?WWhjWVg5RjRqNTBNYlorSU5rYzN4b2dZeHpoZXBsWHF2ZmQzcHNOWDk0aTlI?=
 =?utf-8?B?WFd6YmFKRFJENnpGRzlSc3BBQmF0WHArY2ZoZmk1cGdhUThEeFYrWHZ6R3V2?=
 =?utf-8?B?WXh3bTQyNGdrVHpxL25tOEprb1d1b0VwN1pXdElJdk5mUmJCVUt5U1IxL1M1?=
 =?utf-8?B?T2lJK1oySTl6MjljN0pYbkVUOWx2QnRDZnJrR29EVmp3aDFKbXI0SFdQNTZW?=
 =?utf-8?B?cnBKUU9md2xBYk9uY05KYTM1T2lxc3FNUFowVWpYSkVCOFBQQ2NjNld6RmFY?=
 =?utf-8?B?blZsUGhSSHVvM1l5UE55L1phWDljQXJrUmU3RHV1eU1zdGI4YnJVQXA2SnZL?=
 =?utf-8?B?ajRzY0Ztd1JUSWxNaXZwWmdoelh6NENub2FIWXNkL3VMQndGd3FHMGQyb09R?=
 =?utf-8?B?cDZsOFVLK05DRm9DL3FHM25VUUpHMUxLM3Z4Z0psQXQrY0Mzci9ocUNoVXFI?=
 =?utf-8?B?Ulh1TXpFWm0rZ29FOXdEM0RYcWMyYnNvYlF4ak8yQzdXY2E0ZjJuTVcxeklW?=
 =?utf-8?B?ZlFhb2NjQ1pxYVg4a3lqNVRJaG1IWk53d04ybFNUV2ZkTWtEVCtkRTlCMk5Q?=
 =?utf-8?B?VXNpbEVraGVHSGZ1R0E3UC9WK3FQeXpIL1V4czROWjd3eWY3alVTbWtMNTU5?=
 =?utf-8?B?QldPZHdQcmhoLytEcEY5VVRsVFVMWHA5VWovQ212ZWNrbkZLUG4rSXRqNVpG?=
 =?utf-8?B?UUpVMUZ3WGdpWnNBSUllMnhSNEx3ZmpWd0w3Qk43blY1TVNaNDlseXZKdXQz?=
 =?utf-8?B?b2l2cmRrZnJldVB0eHF3SVFpS2grRU5menFRRG5GWnFRbVh1cmkyWEt6S0FR?=
 =?utf-8?B?YTZGOTZjNEt0S0tUVVE5VFNsUGx2anlnQXpJdVZKVE1ER1EzR0RYZFNobUJM?=
 =?utf-8?B?NmJGbUNtMlJyZmd5QzJtZHFtWFFDeFkvZEdyWjdRWEY4T0RkTU9CZU4rZjRn?=
 =?utf-8?B?TFNEYndrZ0R5NE42WkVsbDE3b1VnTk9iNEdhNmRMMGxsVXJZeWZGYXlEY1U5?=
 =?utf-8?B?VkJHdzg2b1B2SU85UVFjNzNxMHBKSkJlSGdlRGRTNzVKNUo0Yys1WVB1Mm1X?=
 =?utf-8?B?bmZBWHNvZkEyY1NEbzhmaXR1clVzeUo4V1paRWhoN3JMTmdCMFF2eVIrZkJX?=
 =?utf-8?B?NlFJaEN2VzM1TkJDT0tvUjdiSm5id0N1aFo3L2VmUmtYSXU1bDJaTGlrcFRD?=
 =?utf-8?B?ZmlkbUpZbnZ6aTRYV3NJQXFxQmYzZHc0R3B1eVp1NzRIL0MxV0dqS2xIN3JT?=
 =?utf-8?B?R2pLYnMxZkNDcis4Y2FZcTNKUDFNblRuZHJXR244YmY4SGp5K2JlUWIyQzJF?=
 =?utf-8?B?NzlOeVFibVY5S1VkeWlkUnhucWVxekVVZ3Q0cnpGZmxSeXhjVzdBWkZHK2RK?=
 =?utf-8?B?bUd2aUs0QXUwdFliUDZtZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTVjR29OaTdUd3IrdTVvUm1RaitmbHhXTXdyMkt6Nk5jaDVaTnVPYU9jb1Zm?=
 =?utf-8?B?OVpEeGhkUVJXQXlOUS9Ed3ROK0lRRklVcHV5WVdJQURpZjlmazhsSmNmTWhj?=
 =?utf-8?B?VWhRYkVNMHV3eEtDVlJjRDRhTnBKZUVUL0RkbmJELzN4OXRKYkpOcktJaGxS?=
 =?utf-8?B?dVQxd1cwYmpXdVdBTitGMWFoNDd2K3NhcEJJQlIydDdXbThHaEZKM3FzK2hB?=
 =?utf-8?B?cVIzb0tIMGMyZGYvYVBtZGd3UXI2M1JMb1pNSFdqa2xrTmZYRGN6Y1ZaOW0z?=
 =?utf-8?B?b1RJeHZQT2p3NXk3VFkzdGZuOGpuR0VYRGkwUXhmN0RMOE14WnNBSWhwQ0Zp?=
 =?utf-8?B?OU5acDNMSjhBaDJJT0hQaVJnTTJBcWpiSEJvVGlNYUs0TTYzdW02TDRHSkpP?=
 =?utf-8?B?NWpXcXdnaXRGYy9OcGkxc3NEdmgyemZvWXdXbERnNFlzRnNuQnJ5dXF0QTd0?=
 =?utf-8?B?aHF0eFBmZGFMQnlCYW5ydDMxOGNnRG9uYXdmNmdmNnpGVXBVckhZTURNVGFv?=
 =?utf-8?B?cDVOSWdrSjlsYnFMRVlBdEdzUTNUMXBCYlJlQVBZWWltbGhlQUVSdWpLblJt?=
 =?utf-8?B?UkUybVgzN1hva2JRSVZjMnNuZHdBVVdPQkdZSkxraUZzMGp3Y0wvMkJ6OGJK?=
 =?utf-8?B?RWp5L2lKNW9DV1dzVHZlK0Y4U21LUU10NWYwV09NSlQ2UFMzSWJrV0dTSDFB?=
 =?utf-8?B?a0RCZ0N0dEZLUVBmNU5BcWsvTjY4Z0tiT1lZR3pGWjNHZU5ndllRUVBlNXpB?=
 =?utf-8?B?dkFKcjNCdklRaEV5Yy9wN3o3ZE1sVXNRazFGVDArRWx0ZjR6QkNFcFE5KzNB?=
 =?utf-8?B?WUNna2JmT05oeVFQWitNU1RsVkhQbmpEY0JYSmlKVGFnUS9JNWo0RVNjbldW?=
 =?utf-8?B?b3VPSk8xbWswNVZqMHdXUmtpSHdZSFJzbERmL3R4VVNCNXZuRnNHMXRPLzZL?=
 =?utf-8?B?S0RRMytIVlhDcE1RaWVWV2RPb1VQVEVOU0FKUUpyOHBpZ1FjOEVGMDV6VWVW?=
 =?utf-8?B?U2VSVGpTQmJmRkVWR28wZFpja0M5bGxCelRsWFFjYi96cGFIdjNvTXNONzY1?=
 =?utf-8?B?NzNsYVNxT0V0VEJIcUdWTjVnM3V2RzdIUitXWVBKVGl6R05NRmFZbUxjODVh?=
 =?utf-8?B?QlRsYXpqQlNIVFpScjFhZkZhYjFOb2VRei9sa2lwU3NjcC8yUHFWeHRJelF2?=
 =?utf-8?B?Z2lCeGs0T0tGL2pHQmEra0JoU2pPRDYrQlNFNkE1NGJxa0hFT0FOSmI1aHlO?=
 =?utf-8?B?VXcwWkptNzF5MlB3eW9LMDdOdlhIbVppekdLcHhha3d0d3czcXlKVnQyaVF0?=
 =?utf-8?B?R2I5SmQzQUZ4WVQ4NUx2clpiUnlZTTI0VFhDVjhBRlM0VGlGQXE2Zi8vSHF2?=
 =?utf-8?B?L3J4WDdXa2swMkZRSUVUZ3FWZTkrYVBOYitJTVllbnR1N2ZFUUI5cFhRNVJL?=
 =?utf-8?B?SzZmVDdVWWdjdExaYlhNNkRsKzhZVjl3MHlOSmZWR2dLUzBPK2RXaDFLUzFZ?=
 =?utf-8?B?S2JVTThvZnRiSk8vWWovVUZ1dnNUQXhmY0ZmMWU4Y1lhaU1rajhudVZkQVM1?=
 =?utf-8?B?b0dwMGt1Ry9Nd201R3lOTUp0UXpHNHA4cGRnZVM4Q2ZqR3hxNEt2R2R2NTI1?=
 =?utf-8?B?M1Y0Y2xKZkJCeC9LcU9pOWNCVzd6bkxqODgrWE5GcGl3elphR0IxOEJCWUhq?=
 =?utf-8?B?VjkrdFZRVjVaWk9FUXcwUkU5MW9vV0dOY0VZTmUvZW9FZk5lQ1hjVkRMVElN?=
 =?utf-8?B?eTFZMjlMc0dGK21vR3JUUUdoeG1lYlh6ZXBjQjhyVjZGV1JtNituRHFuRjBB?=
 =?utf-8?B?bnZqSk5pVzBSQ3B6aUdyZUk4SWgwQzN2TDRSOGxHZm9RNTJjWGNHbG1wSkE5?=
 =?utf-8?B?eDlGM0xTUmZzVjQzKzNER3BGT2pXY29JMjBpaXUyK1lCQyswbkJBc0xZQXVj?=
 =?utf-8?B?elhXL3pnN3FMZnYyTC9KeENkUGY0eWtoT0lXMjMzT2h6dksxamxVYTZmbmJV?=
 =?utf-8?B?RjZ2VC9OOVpUa0J4N3U2MTdSSXVubGZwTWtyRUVTU2Y1bE1wNGgxcXlhUU0z?=
 =?utf-8?B?MkRMcTFNbEhHbytKN2g2ZjJLS0g5REMrVitCa2N6a1FuRGZSR3c1amhpcGFI?=
 =?utf-8?Q?J5JepR7PxViEZQFtE9alcIZS4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DC871CD7699C648ABBFB71F74C6FEAF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99fd8de-811d-44e5-bce1-08dcd78f2379
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 03:08:15.4801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzcklTemyCbATJOe9ez7ZPvJALDyzUeZ8tlmUlf8LYoWPWihk1zrUujftqxoy2wOOuTui8bzPmaMHkHSQ2LtzZlw+3Vt5vvAcrOmXo0aW28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAxNy8wOS8yNCA0OjA3IHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDE3
LzA5LzIwMjQgMTE6NTMsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPj4gQWRkIE1p
Y3JvY2hpcCBBQzY5VDg4QSA1IiBMVkRTIGludGVyZmFjZSAoODAweDQ4MCkgVEZUIExDRCBwYW5l
bA0KPj4gY29tcGF0aWJsZSBzdHJpbmcNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFu
IE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAg
ICAgICAgIHwgMiArKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwNCj4+IGluZGV4IGI4OWUzOTc5MDU3
OS4uMDk5MTFiODlkMTQwIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwNCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55
YW1sDQo+PiBAQCAtMjAwLDYgKzIwMCw4IEBAIHByb3BlcnRpZXM6DQo+PiAgICAgICAgIC0gbG9n
aWN0ZWNobm8sbHR0ZDgwMDQ4MDA3MC1sMnJ0DQo+PiAgICAgICAgICAgIyBMb2dpYyBUZWNobm9s
b2dpZXMgTFRURDgwMDQ4MDA3MC1MNldILVJUIDfigJ0gODAweDQ4MCBURlQgUmVzaXN0aXZlIFRv
dWNoIE1vZHVsZQ0KPj4gICAgICAgICAtIGxvZ2ljdGVjaG5vLGx0dGQ4MDA0ODAwNzAtbDZ3aC1y
dA0KPj4gKyAgICAgICAgIyBNaWNyb2NoaXAgQUM2OVQ4OEEgNSIgODAwWDQ4MCBMVkRTIGludGVy
ZmFjZSBURlQgTENEIFBhbmVsDQo+PiArICAgICAgLSBtaWNyb2NoaXAsYWM2OXQ4OGEtbHZkcy1w
YW5lbA0KPiANCj4gSXMgdGhpcyBkZXZpY2Ugc29tZSBzb3J0IG9mIG11bHRpLWZ1bmN0aW9uPyBX
aHkgImx2ZHMtcGFuZWwiPyBXaGF0IGVsc2UNCj4gY291bGQgaXQgYmU/DQpUaGlzIGRldmljZSBk
b2VzIG5vdCBtdWx0aS1mdW5jdGlvbiwgSSB3aWxsIHJlcGhyYXNlIGFuZCBzaGFyZSBhIHYyDQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KLS0gDQpUaGFua3MgYW5kIFJl
Z2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
