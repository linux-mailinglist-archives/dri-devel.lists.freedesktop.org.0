Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A197E5BC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 07:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F87B10E1E3;
	Mon, 23 Sep 2024 05:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="U+9pnD2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82CA10E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRXzYN+qbqHzMPDTjuGPytk6zGxw/XSrlmJLwmV9lm5uKZXjybDkmRY/ZUGHefHbtHtoic4MnMd2pYPWEEb+9Od7WfkhKeFE1wbq1h0Xv4A9Wv1kE8LRzFhsnZdOkEtp4WXXS6dGu0iMTpSysbS5DgYptDkeOQkjQvnxvxTHWOKKckWfvZqsYkJZ2hled+pB1Zlfk1Kqto917jlR0zo3e8c0hJQDvkNUO+aNGzwMsoeI76Uv72zmT4OzeUFxgV3MOkcXrpjoUSgL3KR/46CmVlzOqSGo8xL0zoZs7gf32j75oj3xRM6MBerAtxrJejH0+yFs0HW3kj7aVuAhmphkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ0GEPEzBf0ZJtrhqPhZsappcPfgm/IKjnNdzdYYv/0=;
 b=KM+xxUUKMJdp39PjTg76tJrXfm4WFInoBClHwcZjFKU308X/TW+5bREu1CW5NeBC2Jj2xoIUoCUlmJaFQQPhqZUsRdR1kjH1mZY2nOXdjqGA3oxsWEQdfyUe8VHk3TvGiaeWDWMqOL+j5btfh56euF4AgWo6Z9lOjGQ4B1SOGCJAiq+Z367X9zBQQBSkiU6HXFfWh0oD7v6n3OOLBA2Jz+SbQlcUrD1K55F+FpPAGXBL/4OCbF776x7ZHqH3pl8940xUlNVLNCe0zYrafg6Q1aT2nWRu/x40Kr22+g4Ki0Wf6NxVopJ2bnVxW0AQJlkSCswsSNc78uzKhg3xJgSa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ0GEPEzBf0ZJtrhqPhZsappcPfgm/IKjnNdzdYYv/0=;
 b=U+9pnD2tNK7mQOQQIJMRkzI0AcwfCwab4wli9ISfvSd8I/bz8Y5sye/dGjuBUaKNSJ25fUp3vONO2t9Yz5ZGuBI7xjSmlkCH1aSxjHlzLwqqka2/rQmN9WR79aCA+cT871EVWVcgk3Zh/1uLZKI/RshbvOAxCnE8muhongFgzsBpwIhMdNedWEGgDAUQUReQJKTjA1EoTLH16n6d+OyJqgqXHJK5L+QxLYels27bOezjKMrE54dYZAgCBDNmSr+VojNBU8BnCj2ViG1Uq0txia7vJV2z+vdVMiS+SvsWdPMDtOvGGhfXdxQfn/wmtDulJjfcR10q47/Lt/lNvy5w/Q==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Mon, 23 Sep
 2024 05:50:23 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 05:50:23 +0000
From: <Manikandan.M@microchip.com>
To: <dmitry.baryshkov@linaro.org>
CC: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dharma.B@microchip.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Thread-Topic: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Thread-Index: AQHbCnSYAKfSHYvzgEG+hCzJDy3M9bJg0qeAgAQRYgA=
Date: Mon, 23 Sep 2024 05:50:22 +0000
Message-ID: <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
In-Reply-To: <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SA1PR11MB6613:EE_
x-ms-office365-filtering-correlation-id: f10d3842-47be-409d-d6a0-08dcdb939d82
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OWtKS0JtY3ppcEFUcGVDcStjNm5FVzBXOXlPU3VEeU1NUGR1TUg4ZklkMUJS?=
 =?utf-8?B?bzRaNXFET0EwNEE3c0VOZk1qNkk1dDBSdjFXUEt4SU1uR284V1JNU3ZWRnZO?=
 =?utf-8?B?REQ5SWFQZ2VxWW1XV0VOTkN2WERVSGZQc2xkT0FzRE11RUtqNDBDQlJUN3Bn?=
 =?utf-8?B?L3g5TnZ6bjhEYmpUL2xhQitLZ1hVZVhsSVB2U0FydlN5UHI5NitoVGtiRmo0?=
 =?utf-8?B?L0FPcWhRTUZDYlE5K2lCQXJENnJybE1WYzE3M082dEg3enZYQ3V0TG9DbVJr?=
 =?utf-8?B?d1BqY0w4V3Y2Tjh6eDBwM09KL0U4RmlPYlNQakhMR21Lak5sdFFmQkV4WWpM?=
 =?utf-8?B?UTdtdnk4dGpvdjl2c203NnlCTHhodTBSaEtybGpMK2oxMkZCZkNVL29rRkJO?=
 =?utf-8?B?OEl6TmFET2RVdENpT1dUMXVBWDhUbUF1cFBFaldzbUprMHVTNjEvUlRsSE4z?=
 =?utf-8?B?d25sN1ZINmhjbFZzOS9jcEgvd2Z5NjhNc2lLdzhRaWJOWkQxYlNsT3pWWm5X?=
 =?utf-8?B?bzNBSFZlNWdHZ2poc2dGOUZvZlQvdndtczBoR0dBK3phbzNxVWsvcG51NzFX?=
 =?utf-8?B?MW0wZGIwVjBBL3dLNjd3M0dTb2RaMEpUSytxVE1OVWo0L1hNZXh0NmxmVkdC?=
 =?utf-8?B?M0RYdnhSaGUwYVFMMm1MOTZ5ejQ5cEJDeTRENE8xRXBwTzl3QkRiVlo1RWIr?=
 =?utf-8?B?WXB5cDB4azA4VHJhb2xyUk9zMENOdDhKdm5zLzZDejA3ajZhUGFSWXc1TDV2?=
 =?utf-8?B?aVFGQ1FaTUFOQk1MSmptU3JQemcrUTJyWlM1d3ZzNVM0VFJvaGNRanZoZ2xz?=
 =?utf-8?B?UHFYbVhaRHpqcy9NSUhTYVk1bEVjOVFjR0M4WTBsYWxmdFdTNG5HOWlFTDVQ?=
 =?utf-8?B?Z1BSeDNYZnZHR0huL2l5STc3cEUvZktHb0p6VU5iN1N6dEVOQ2xUMmtvV3FF?=
 =?utf-8?B?Q2xsT3U3K3BVeWh0ak9LT3BVWmZ1R3hYN3pNNmpvTE81MmRtK2xlS3h0TGNN?=
 =?utf-8?B?ODMxcnF0TnVjTFhTVU8rZ1crWmJaVk4ydFRad2dMYWpCNEVxYmdObStrYUpI?=
 =?utf-8?B?QWE4UWtHOG5iQ3lRaks1LzVWWXYxQmtRL3IvM3JXN2NvRSt1V00zdmd0bWFQ?=
 =?utf-8?B?MlZmN2lxN1dZRTRYMHJ6Qll4VUUvSGM3VllrRllBQUpnWS8rTGV6dkpvY2tP?=
 =?utf-8?B?ZElpZSt1ZkZpbTBtbDUwVGVMbzhqbWIyVTlua0tFc2x3ak9XZnlsKzRUK1pw?=
 =?utf-8?B?TFBvbWt3Nm1TenByVkZyTEtpYnZFRmZhT3VIQW05ekdnRUNtOXdDZHFSOFhU?=
 =?utf-8?B?S2p5a0N2TFhWTmtCTCt6QjlZanIvNmdWWnRGZVcyZVNPRXRWSmg4VlhDNE1H?=
 =?utf-8?B?YlNCcGp0OVZHeXkreVpzTmhSWGMwWWVuc3FkNk1MbkRMZGhtMW5veVlmZDgy?=
 =?utf-8?B?ZkJWbU9Mem1iRmVkTEUwL0RVcnNYSW03WEhKanNZSFhpTHpQbVJFNFlucnBX?=
 =?utf-8?B?bWhiVFF2bEI3bkZYUEl0b0p6ODMxelU1aEwrRjlnQk9uakFUYVk1aXphTnhs?=
 =?utf-8?B?aDRYS0FKSnZmVWxnRXNVc3ByR1VUUW5MZVU5d2NrNkNtalQvblA5VUw0Mnhx?=
 =?utf-8?B?ekQ3RHhPMGt3eHR6djQyWndWb3VXdVBZalcxaThrZTZYMFdSSG5wclpZWXdl?=
 =?utf-8?B?UTRXWXhKam5ydUR6dnVLekhQNFkvSkFBcjcwbDhncFBIOGZWbTMwdkRhQk5Y?=
 =?utf-8?B?ejRxT0N4MGZmbVhaMTFnNTlERUNQZi9SSHdSQi9KeEFjWkh6R3NpZkh3MmFk?=
 =?utf-8?B?RHJKdHRWSnZ0QTFXZXdodz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWVMa29Ed20vQmZGQkNqMkE5MTNYVXcrb3N6OCtEbUE2eDBJSkJiMGIrV1dU?=
 =?utf-8?B?Zi9ETmY0anBIeFVjdG9uS0NHa3VMa05jelg3Z0xJZkdDMkE5THNpbjhkcnJX?=
 =?utf-8?B?UVRGNTA4cEYyeWFpN0Q4Yk5oWlB0MllRejVMWTVBQXpFYmpZUWRTelJsZHVN?=
 =?utf-8?B?bjVISUNiUE1UMEFxOXE3WGthNDByajVsaEpYRVlnT09NQ1Q5Mkc0dlFzUVUr?=
 =?utf-8?B?WnEwMk9sa3M2ZXJqZmtiM0JZMlBWbWpHR0RsSU1NVDdYRHc1N1hsZEYwdlVs?=
 =?utf-8?B?RklmOEtieC8xUk5ZbGlYTGlmVm85OGJGNmVhcndRZ0dPVmJnYnd6cENValFl?=
 =?utf-8?B?K3p6Nkp2a1IxeG1mdW13SHdUOVY1b1VoQlNESjV0RFZDdHM1eTFhejloL2c0?=
 =?utf-8?B?WUtUQUliUk9kTFp6WkljTUllWkphNTZJUXN1WGJsVk5UcXpaaGFQenJreXly?=
 =?utf-8?B?TU9LRUxHb3E5QWdtMGFrNEU2b2RWM2ZSRlJ6V1JCcWRjWG9uNG1MT1BzeUUy?=
 =?utf-8?B?U0dMbi94NXBMN25OWGVtc0VyYU1HM1QrT3hqOHZkZ1RpKzNUK0FibmNpQ2ds?=
 =?utf-8?B?cWJxRFZVVmthckRQZXMxYVlxUmhNZGpNSktjZWhVakRET3MydEpuckRJcisr?=
 =?utf-8?B?WUFiOFRyRUZzYm9WUHo1cnZ2Y2JmSlgxSGdVQWRUbmhGaDRhZEtlTjZPWG11?=
 =?utf-8?B?NVJ1eWVPSkNxUjlJanM5cktKTmkrZ1pha3RlUHdKOGRQVGZTMEVkVy9QUXlV?=
 =?utf-8?B?bjFCRlBHa2QrZnc3S0VIc3V4TGFkUVR5VE1SV3BKRFBndW5zSndJdXBCdSs4?=
 =?utf-8?B?V0tnNzZJYXZwaGRlZEtRWktGMXgvbUxVUWE5N0FnY2hnYzExcG9yYlE3VStN?=
 =?utf-8?B?cnJDbTBpL2tjejhiYXN2TWdOZ21hVlJIUXZYbGtZV3hGSW81K0lnNHNXbnhN?=
 =?utf-8?B?YTU4SE5hb2NUTnZXSllRSlFWYjFZV0hoUHROTjlyWkVWUm5BcndEZW55UzYr?=
 =?utf-8?B?Sm9JNWwrVU9meW45UlFQbUZBSElRK29sYkJCMFhWdFFsSDI4aWZtRGdIaG5F?=
 =?utf-8?B?WjJaRm9FQmxHKzNKV1RnSk1oK01UU1R3WlNHQi8vY3pDSHo2Smc0eGRuRC9B?=
 =?utf-8?B?emNnV1A0K2luVDN0VXlPUDNNUTlBTDBCNHRucHFVL25zZ2ZEdUdSbEJMaUFy?=
 =?utf-8?B?NGYzdnE5cE5HSHdMWTUrbkRGNHU5YWtJS0UzUEVkTVQ1VVFnRzAzU3g0dGFQ?=
 =?utf-8?B?VVg1ZktNYnN5M2NORmJoM1JyL2N6YjFlbVo2UnIreWVaMWcrclRpb3VBRmFr?=
 =?utf-8?B?Y2RHM2ZTekN5ODRlb296QzVNbnpGcXpVSk9JTHRjTHZYMWk5Sjg1YXg5UnRF?=
 =?utf-8?B?TWk1ZmRscmdKR1VlOHFQbVFiVVdXRkVxNkJKNGdrbUJIa1ZCNm1BcUhJdTBx?=
 =?utf-8?B?ZFV5U3hTQ00vUnV6Y1Y5U04wQzR4NHA3QldKanFrQ1J6N1lhaTNzYmNBeDJX?=
 =?utf-8?B?SnoweDAvTGZ2ZXlhU1pBYm9oRVNUOWJZWFdZa1VYdnIwczgrUmlmNEZzOXgy?=
 =?utf-8?B?NkZRRWwraGNGVkptbDVRamZUK1BmcGo0d2FmNVNIKzlFU0RtVnFMb3VNQWpH?=
 =?utf-8?B?MWF6QUtac1FyalRCODZHQmJ5SmRIcW8wNktRMEpNLzJqTFM1OHJxS3ZLZFZY?=
 =?utf-8?B?UGlacTZuRFhWd3RBa3R0a0t2a2RoTXFKVnhPMkptYm9FWkdJZHhxTkdGNTdI?=
 =?utf-8?B?OTIvVkZoT25TS1NYQUFWMU9RZTN0M2xQOGJFRExNMHFRUVpNKzBndmVwcXNk?=
 =?utf-8?B?bGZkdlV2Skt1U2o5dXZyeDN0MHhFNEZ4US9MS3FLK0VIRDBGM1NlVkhJTC9h?=
 =?utf-8?B?SzlKa0d3b2Q0aWViL3lOLysyV0d6SGNGKzVyaEtKOVVMeXZnUEFKelJCWnZB?=
 =?utf-8?B?MnhuSUdZZENyN0lubEdJZEJvQkxGWTJoQUI4Y1VPWEJzTHhjam1nMnFGcCtN?=
 =?utf-8?B?aCsreFk3R0pENUdVYUNLano1cnhBVlNuSWpvQ0lUMXFjdW5uNWNxaGpMNlp1?=
 =?utf-8?B?TzBTWFNyWnNhV1RiT0dWVnF5ZUVMRk5NcnFjdVBocWFVSTZpQW9FN2hrUk40?=
 =?utf-8?Q?dkM5IOQ6I8lHdIBx6YU469XBQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <146D0D673F2EF645BD986E5BE73898BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10d3842-47be-409d-d6a0-08dcdb939d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 05:50:22.8972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzSgSn6IXe6MVvqPDD5b2hi8OCmqP5NeMWgDxNHvZFLeTvyKQl8EmJb8FU22bLGJQSzDP3GeahZQlMSURo/h1rG1Yr33CkBcR2iKnpOb9Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
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

T24gMjAvMDkvMjQgOToxMyBwbSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUaHUsIFNlcCAxOSwgMjAyNCBhdCAw
Mjo0NTo0OFBNIEdNVCwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+PiBBZGQgc3Vw
cG9ydCBmb3IgTWljcm9jaGlwIEFDNjlUODhBIDUgaW5jaCBURlQgTENEIDgwMHg0ODANCj4+IERp
c3BsYXkgbW9kdWxlIHdpdGggTFZEUyBpbnRlcmZhY2UuVGhlIHBhbmVsIHVzZXMgdGhlIFNpdHJv
bml4DQo+PiBTVDcyNjIgODAweDQ4MCBEaXNwbGF5IGRyaXZlcg0KPiANCj4gQUM2OVQ4OEEgc2Vl
bXMgdG8gYmUgYSBtb2R1bGUgbmFtZSwgcmF0aGVyIHRoYW4gYSBwYW5lbCBuYW1lLiBXaGF0IGlz
DQo+IHRoZSBhY3R1YWwgcGFuZWwgbmFtZSBwcmVzZW50IG9uIHRoaXMgbW9kdWxlPw0KQm90aCBu
YW1lcywgIk1pY3JvY2hpcCBBQzY5VDg4QSIgYW5kICJNUFUzMi1MVkRTLURJU1BMQVktV1ZHQSIg
YXJlIA0KcHJlc2VudCBvbiB0aGUgZGlzcGxheSBtb2R1bGUNCj4gDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFybWEuYkBtaWNy
b2NoaXAuY29tPg0KPj4gLS0tDQo+PiBjaGFuZ2VzIGluIHYyOg0KPj4gLSByZXBsYWNlIG1pY3Jv
Y2hpcCxhYzY5dDg4YS1sdmRzLXBhbmVsIHdpdGgNCj4+IG1pY3JvY2hpcCxhYzY5dDg4YQ0KPj4g
LS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKykNCj4+DQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KDQotLSAN
ClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
