Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15859CA5AC3
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 00:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9AF10E9DF;
	Thu,  4 Dec 2025 23:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rlveByr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010069.outbound.protection.outlook.com
 [52.101.193.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B796C10E22A;
 Thu,  4 Dec 2025 23:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4AXLblGTd6INgMZODaK/LL36fjUduuw5zupZjZCrSi7kNY7e6HNjkwcd1QXwQ5o0tmgPgDac+MqKqg22F60TvRG085RGRKIktaLVAIjsO5O2eFI84CYb4JSoyjcV85OZnHgk9GJNERPBdkqfZ597lYzOPhyn4dGH9JloKxt6RwdTwSVtFaFaym0Wq7NEOFpN+2dUIv3V+owZ0tquVtenPlTXYpdI5PdZsNsazp2vY/E5W70vI1lJbhPAbYLQh52FTtVWZBdCpgfXLc+IY4sEO1vAW0OBrxAD3W68O7j0snf56vHkzLXj4gncQQSWnnv+7wORbEqG6IW2+zTb8M4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isNet7kMtaXOIRn/jPJmVRTdkJ3Ekha0r2IoWQDiq98=;
 b=rC+SrEVM8mok0nKyh8yIobwDvoult7ty6vhRxWeI0eYph7Yc47oxQo5SPZOANJwtJAh1mo1vUxQm6aqDVzXTVZLkqTBwA6GPe71RKOacCEDYwCIB8Un8SPjs7WyIVyLnNF3ZhwIhFcZjD0Z+eNa+wDhpUHzlJ94S9xEgJjg5DGr8Lygs6SSSAdxBD3W19hhn9xuf4OlEDWt6JbnWJ3wAay8eYF0zCkJnXZ8ODOLGjXUci5vXOfZrFL2JIEAd2nYNd+jUEkUck3WsdEGUujz2V7aFNkDn9R5Tc6LHFlB55u7EP5Gx3ZIa1H8Qy6Jvn0ZKWxbaoTpQIuzItz+iP7al2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isNet7kMtaXOIRn/jPJmVRTdkJ3Ekha0r2IoWQDiq98=;
 b=rlveByr7esVvEvxFcCxj3UrcKsT83fHXpMOKRgGO33/7xdzH4NgrI67uKIvL5yayrsbg7V0QOFuYNiUrcpssdLJNa22lN/vU/rdAL+Jiu0i6kFE4Vhq+MNIgfRCWka5/3T7K6qD8nH+al5oD06XNCw/IDD1AqMXWOMOBm7yDNfrfi1xsgBpYI4YLQXbg6WhTZAy3YnZC2xgtIkhbxWkD/LDTPL1pwPGLpX+GHn4dl9J3HZ0AOzAhCUcvHmaJgh+phinMpD05D9fd5HWAs01R7CtLZjRXEJ3EgHnSBTChtd8WE1opZ7Cow4vTigrVp7hRifR4NO80vlZYSKmrcMtEmg==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 23:10:16 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 23:10:16 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mhenning@darkrefraction.com"
 <mhenning@darkrefraction.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Zhi Wang <zhiw@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "bskeggs@nvidia.com" <bskeggs@nvidia.com>
Subject: Re: [PATCH v2] drm/nouveau/gsp: Allocate fwsec-sb at boot
Thread-Topic: [PATCH v2] drm/nouveau/gsp: Allocate fwsec-sb at boot
Thread-Index: AQHcY7VuNY9B/N3o9EGK9zmc04EvmrUSHuGA
Date: Thu, 4 Dec 2025 23:10:15 +0000
Message-ID: <c043bcd69d4630bfc63ea33ad927be6ea55ceac3.camel@nvidia.com>
References: <20251202175918.63533-1-lyude@redhat.com>
In-Reply-To: <20251202175918.63533-1-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB7664:EE_
x-ms-office365-filtering-correlation-id: 3eb7578b-0ab2-4cc7-6770-08de338a4943
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?U1B0NkU3dVI1NnN5QkdnVjRNSlZOQzZobGZCVWZId1g4RlV2YmFDQ01NcHVI?=
 =?utf-8?B?ekRVQmpWekZkWkFrS1BGcFRxUnJjc1JGRmdWVm1SRU1FYWpUa0V5VVJjUWlW?=
 =?utf-8?B?bzhFNzNSSXl0UVpRc2pkUXRudzU0NVN0eDkwQkpQNDBqQ2wxUzlZN1NvUlJw?=
 =?utf-8?B?YTQ1SitSYnA3L0lYMmtRRWdDV1pBamM2SlNkNC9WN1Jwa2FIWnFNVElDNXFR?=
 =?utf-8?B?RUd4Yk9FZVRBclVZa1JsWGZlNHhQSi9rSEgzUXlhMjJwRXVSeXdXZGxUK09M?=
 =?utf-8?B?Y0FIaVFBV0FjeXhTdHE4V0UyUk54MVA1bTNKN2EzZmFleGVtM05mZG5YRTVz?=
 =?utf-8?B?ODBYOW5VaDA0S3NYY1Q2UVBVdFhuSnl6OEJYcGdhQlFLL21zOUo5SS8xaytt?=
 =?utf-8?B?SzYyNnFjK1dveko2c2RsVklPOGt0clU5NGZ6dlVRV1UxNzJBd3FnbjhsTzRl?=
 =?utf-8?B?S29DRSs1OUUzS0FvWm1DbitIemZ5K3FHVmM2LzI2MlBhQmJsVmVxSWVvaEtG?=
 =?utf-8?B?U3ZnWTJKVFN2TzQ2OFQ3aHdFK2IvbmhyTG5GOEZDNE96dUc0eHU0OVpEM253?=
 =?utf-8?B?WVlKa25xK1ZPSXRBNjYzc0ZBeFFWaDVjNDVIa3BKMGc5NkV5MlpYdUg0Wnlo?=
 =?utf-8?B?aGJJdHdXR1lPS3l2YTBGdHQ2TFJCb21RUWNzMXllVzc1b2ZiOVd5SHV3UXV2?=
 =?utf-8?B?d1U3eXlLTVlDRVNvcEcwNXhJeFZaWllEU1BraFZqQlBzMy9ja3RqdGsrUzlZ?=
 =?utf-8?B?aXBlM055WEtFMjNLREdoZEdUZ0VmcllFOTBkZ2lQZGw5OTQrSWlFYmdMa1hp?=
 =?utf-8?B?NmtFdG9FUjdhTnN6Wmp3RlN5TkV3ZCtDTi9TRE1lZzF5b1QwWjN6SzVuMEJu?=
 =?utf-8?B?bXRIVDczWHBQaVVIVC9ETk9zVnZaSkM1WGZHTDBCbHp4SnlWLzdzcTFvNVlP?=
 =?utf-8?B?SFVGYm5ETVEyVXEyaVhCZWN4VVM0K1RKdWZpOGxPMzM3RjQzcXZhaDg2cVRx?=
 =?utf-8?B?U2gvRXovN2orTFRTUG5WZWlSSzJGc2ozaTd0MzIrRldVbk5na1ExTlhkSTM1?=
 =?utf-8?B?YUJrRUc4cmpvMGxYbWxLOGFtNFVBWThnMGlBa3Q0Zy9BaTM2Z0dYWGlibkl6?=
 =?utf-8?B?WXIwV0E4OFdLMmdvUTdFdmV2VEZBYjQwSUxGUTlXWjNUL2FEUkMrQTNIalI1?=
 =?utf-8?B?b29ZeUVTc204ODBXZkJyQ2pOM0xWVlozck50QXI5UTQwdERkQnNNaVlZSlBZ?=
 =?utf-8?B?SnlBTWZPcHEvVy9mblVqTElURm0rN1g1cFhURFFRdE1jTDdzM2RrUG5hQ01p?=
 =?utf-8?B?TjJyWGhrYnBGanhLUTBXM1IyZ05zdHFwNkR2bDRvWFhVLzV2bEk0d2o1emN5?=
 =?utf-8?B?N0UvdUE5dlI2STRXZWpCanhXbFFOWW1NR3lrTXRuSno5WHgwcGxEdkhWVHA0?=
 =?utf-8?B?bFdzb1dJZlhWQ1dCdmxXSGZlWUw2Njh0ZXltck0xNEJBUVRMczJ2ZUYzUXV1?=
 =?utf-8?B?ZkttYUYvbnI1OVZrWTM5OWZXK0lpMS85eWpaQlQwVHpkQ0pyR2xsa21KR0tl?=
 =?utf-8?B?akhsOXNKbkZEUmlmYm5FTGMvL2ZTNVlSV1l4VFN6UEVMMnVkRlh0MWpSM1p1?=
 =?utf-8?B?aThKcWZVSytUYTR4VWZjRUEydi9sQ280dXhoeTJqZUJwNXVHWENuTThLdFlR?=
 =?utf-8?B?c3U0alc0M1dwbVRqelI4K2M1RzNvRWpqcWtRK3Y1QUsxVUl6emY2YWVlMmt0?=
 =?utf-8?B?cnlVVUlIUHpKWGN3emM0OTRFb1VCQUE5RTVEZGh6aHlxcUxWMk9Uamx1aWNr?=
 =?utf-8?B?TVVvRDVzQmpBVUVxWE5NYjRMRWJBK1BDK05QbkVJQzlQT1crMDBGa1pPOTlV?=
 =?utf-8?B?aFNodGNCRVpoei9FMGNPOWJjdG5VaC95OVA2OGt2eVo4K1lVY2llN1Zsb2gx?=
 =?utf-8?B?WXh3TzZTaXVqTExNYjBRTDBwWUp5Q010S2NDV1R4OWxYdEsya1BXdC9kOVZK?=
 =?utf-8?B?T2c2SEJuVS95K3FoK0NqNWsrLzdlS0MycDh4QUFVQWtGa2Q2N1pueUFhdnJh?=
 =?utf-8?Q?/dSpXZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0ZHVWE5TTBwdHN2N2ZHTHk1NU9WalYwOEhiQUtHMGRsMStkMjNKZmh2Ujhu?=
 =?utf-8?B?MDZwZVF3OTU2OC91QU9GUTJwcWE1L1dveVpYdzYzaVdDWjBXeVVXQ1hNYWFT?=
 =?utf-8?B?UGJoWlpxeDEyZnFlSGtqUTl4eGUvMHd0enlNTGhJTlZ2N25HZkMyeExNbE40?=
 =?utf-8?B?OXJRYUE0M1dVVE16b1ZQRHc2TDhndC9qUkZHcVBSeis0cTFVZUdrQWYzd2V2?=
 =?utf-8?B?NWJ4SWxEMDlSdFhrQ0FNNW9SNHN3L1hzaWVGajNjWXVrblRCQlc3bnk2SmRy?=
 =?utf-8?B?eS9MMW9Ca0g2MzVPaU85TFlFQWNlRHRaUitVMFRPQTJIWVJjWnRxL2ZnWklh?=
 =?utf-8?B?cVluT1JxNHNRUEJCTm94SU83VFIwQ3ozY0lQUWhDb0xZdkRTU0ZqcnNJZzR3?=
 =?utf-8?B?WlhWUWxrbXBTTVdCYXRyMng2b0QwaGtHMDMxYzJsTmlIM09kMFZmbmkvUTZM?=
 =?utf-8?B?MnZnVU1tTUpEWVFUMVFjTkEyU3JDWUN1T2NBWHlWQzhsRmxTaEswV3g2dWRl?=
 =?utf-8?B?MSs0TFllN1JUZ0Frck01TFFyVnZ1WmhVUEc5NUdYeTkzc1BrMXFVTlh3ZUpX?=
 =?utf-8?B?aVU1VmhRNlIxUS9GMjdERzlCUzdzc1FEZHhiWkxmQXRLOTFhUjBHMFovOVpJ?=
 =?utf-8?B?YUg4L05VdXBpRUorMkxoNlVSV1BaNjFpdU1vSnBqdkNYY1B3S3hld28xTG5V?=
 =?utf-8?B?azRkL2ttZmpNa3hrWThGUUJYQ0NzcHpvaFZFY1Q5MDczYUlFRGFDdG14Unp6?=
 =?utf-8?B?SUFXaEdHODlBRlAwMmcya090b3o2N0RNaGhtQytvSkhxUjYvT01VKzh3VDNB?=
 =?utf-8?B?QSs3S29DcnBtcFVjVFB1bEpGK2ZCYm5vU2l3ekp3MVM2cjdTWldpWE1Nemsx?=
 =?utf-8?B?S2dhcDMraDRPUWYvbXlIYjNRc3VNRVRPZEFzMFg2Wks0eGVRWnlKaklQOUQ4?=
 =?utf-8?B?NGlYekZIQjRwLzdDbUluZEJrWDNzbHo1NFg5ZjRZK2VDSm5XYmJ6YVlxOE05?=
 =?utf-8?B?Ui9YVkhLR1NGYStpeTA5NlNKdzhKUHBmWkFyemZCeXQ4RVJTN2pOaTJVQ0lp?=
 =?utf-8?B?SW5YbkJtUklIYkVwUUlWVFovblVKZm5mZEF2WHpqaGxzSVhUaXdvZUd3R0dU?=
 =?utf-8?B?dURMOFIxRlZoTzIzS2VMZVRZSjROelBIakk3UkVGb2xvL3VTQmY3U1RUMDJR?=
 =?utf-8?B?Si8yUDh6Qld5eEQ4MXUzMFQ3a0IxY0oxbFdVaDhqWkMwWi9ORCtrMnJ3NlJl?=
 =?utf-8?B?clZLZTFVSnMxbXV5QjhUYmZvc3hNcEMxMlV2T2gyT0dYWmtjVEVmaXVGRDYr?=
 =?utf-8?B?bUEzejdmS0szek4yWFpGT1ByQmpHVzFkUFBFT2VkRmdlOHB6d1h0RExGVExL?=
 =?utf-8?B?bERRalFRUWlVN0t3VUZjaGlMZlVHL2tmazZGUHA1SGxiM3cwTHdZWG5qUVVV?=
 =?utf-8?B?UlRYbStKTUYxUDRjMWZiOFhUNGhhbVg1Z3IyWVd5aWpDenQyK0J5RzFjYzV2?=
 =?utf-8?B?Ny9pZGxwVnJNWWQzWUorYVh4Q29HdDJja2g5d1lXZWdoMTZUeFRoek82b3V1?=
 =?utf-8?B?SUV0RjEra01kMlEvS3cxa2hOekVLbUt2M1NHU3ZCdXpQdjB5Q0wzZENRQ1BL?=
 =?utf-8?B?RXFGTTF1eGhuS2ZRZ3dJR0E3d0FTb2JzTjFoTmh5K0NkWjN0cU43bGlWMmpB?=
 =?utf-8?B?R0hibytJMWFWU1Myb2czbENac09rdzZJN2RrSHU1Z2dJM0hVK3ArM2EvTE0y?=
 =?utf-8?B?dGNUcGZLK0lPTE9Dbi9NYit2MCtwS2JYY2dReG9tVlFsblZmNlFTQ3lTYjJh?=
 =?utf-8?B?QmZjR09KSTF2ZkdNMDc5am5NaUxWeFIvUzhLYSt3bmsxT0oxUkFPWHJzdDhp?=
 =?utf-8?B?TE9pQmU5VEV6S3pHWEQ0amU0Z1dpVlBWQ04rcVI4Mlk4aXE1UTdVMVlPMlo2?=
 =?utf-8?B?ZmNNSUFlRzhQZ1RHbVpvUmhySVBSNi83V1ZWc1lrZWRWNlQ4MzhXYnQrV1ZS?=
 =?utf-8?B?VWZVL2x1SUt3TXVRTlMrV0V1U2RRTW9ycGsrMUtVd3Q5Z09sQm1Ka3ltZTVz?=
 =?utf-8?B?Y0JITHhmR0ZNM1pxRlVjZFlwWTRaQVlwdktvKzNDMUNpRkxYRWdMa3RFM2dE?=
 =?utf-8?Q?yyLoiIZfXz3a+SlZVmThnsCHA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1826419DB34E1D4DAA9371DED3C44BC7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb7578b-0ab2-4cc7-6770-08de338a4943
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 23:10:16.0313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2I+OJ+noOBU01JX/cwCxgYXKd7zkQotUgFPsEa6me+yL3qN6zCxM67RhL9tc/vlwnyaVbc94cu7FhdQEZPlRNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDEyOjU5IC0wNTAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBT
aW5jZSB0aGlzIGZpcm13YXJlIGNhbid0IHVzZSBub24tY29udGlndW91cyBhbGxvY2F0aW9ucywg
dGhlIGJlc3Qgc29sdXRpb24NCj4gdG8gYXZvaWQgdGhpcyBpc3N1ZSBpcyB0byBzaW1wbHkgYWxs
b2NhdGUgdGhlIG1lbW9yeSBmb3IgZndzZWMtc2IgZHVyaW5nDQo+IGluaXRpYWwgZHJpdmVyLWxv
YWQsIGFuZCByZXVzZSB0aGUgbWVtb3J5IGFsbG9jYXRpb24gd2hlbiBmd3NlYy1zYiBuZWVkcyB0
bw0KPiBiZSB1c2VkLiBXZSB0aGVuIHJlbGVhc2UgdGhlIG1lbW9yeSBhbGxvY2F0aW9ucyBvbiBk
cml2ZXIgdW5sb2FkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4NCj4gRml4ZXM6IDU5NDc2NmNhM2U1MyAoImRybS9ub3V2ZWF1L2dzcDogbW92ZSBi
b290ZXIgaGFuZGxpbmcgdG8gR1BVLXNwZWNpZmljIGNvZGUiKQ0KPiBDYzogPHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmc+ICMgdjYuMTYrDQoNClJldmlld2VkLWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBu
dmlkaWEuY29tPg0KDQo=
