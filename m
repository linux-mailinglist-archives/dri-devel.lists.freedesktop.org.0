Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98348057F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6222010E53C;
	Tue,  5 Dec 2023 14:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5010E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:54:54 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B5Cw7Y5024386; Tue, 5 Dec 2023 14:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=IU7YQlgTU1cG6x28rSrxUqouXlnnYEvTYfcwu+D5jQM=; b=
 hiPtoCtWuYobjlWrdUS9hll1UYexgKS5hBbGDpTfGKP7S3OWktRYD7BqSEeyPCmz
 lBSHgUczFva6YxwDbiChT197cIxhvPp3obiAxaXsp+uoQASCyc6IOJ17Lwg/yPJ1
 XD/IztflnTiav25VAOyNRjoCuK1O/B7t3KwD4sPbfzEkKsFilkuoOkHh0K9WuDqX
 4NKIgrpE9DBhV8LKZLIuSRGpga1/YLIo11RQTPfuuUctxjCGqs1AzMI6oNBefvtp
 LpmHJMPiUR4YHNWdHOsUFGu3+Ck9WNJYfj1Wyt7FOk7KWFZWCYpACH//8csgfviJ
 fi8VFPiKbkrAKyhXUOKokw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uqwhwac4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Dec 2023 14:54:43 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:54:41 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 5 Dec 2023 14:54:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enmoUjFnzdl6ly0/CkDHYcyhQh7w7qNbG5ecHWoMFKfpj3V9/h4VLm5BTdP1s5LbD+Lzr2XWIi4FGvJTop0lm3VZm6EBJV/TjqReAhB+3oFKZMkqtxuRygCzFfreVYvqq4E5UcL+H+wOKAeHVbsoDkoBQSzNXLUWqbLToizn8BSMfYlpHJLoj6Wcbj9/gfyvipPT7qlFhHz3hI5nOjtiu3BQgSpaYvsAqxJ71i7iDj22A+V6ovzz3qLf+P3aZ6rQmkRIeUumg/WxMBrucG/oUh37z3Onf/yQvFuVO4x5vmnSSNS0rY1lxzaSjUZ4XB1EUlJdQZGcKDr7fbAJbwC0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU7YQlgTU1cG6x28rSrxUqouXlnnYEvTYfcwu+D5jQM=;
 b=mGg8+EIfpVeGdgQbfLII+oRT9N7uOIqDDqSFQ/o8iwrezq2emcXTOkJgo3erkWL4mHxkhNpjJudMQZjSSbZcZtnvc876vYuA2CF4h71fjjYzJMGaHuK148guPakTFER3NXrXn+UpcmKqgKR70KWhegpi8O/T/8N0/mBri17RWN35E7fYPo0Tp48T8Hmnt9GUj4VjZTT17hYCCLzIEx/jUeArxcdWTHOgwEr3Xbu9/087FhXR+I3bjLxMcvXn8mWuPfx+9dmZpcFF+FROs8k0eWQKCDVGSKUx4BymvltIKqS8FsayMuXk3I4+eWAKbCsjuDmV40b8TfdXlCT4PCns3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU7YQlgTU1cG6x28rSrxUqouXlnnYEvTYfcwu+D5jQM=;
 b=hmLInepLfR9OxY9CmboFpYnrs/O3eIFgJ2H65L8TJRMoDyQ+oo9zzJ7WJEadGSwmje09nqIHOHejUqXj2JW8d9auZ+vnQmkq2Ak7f/lGcyrZX6VQM4p3uPjyTgqE5lWSWX/Essv9X8Ld6r0JVvTfoMg3wsbVraYZVXeB1tha6z0=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB5737.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 14:54:38 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 14:54:38 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Frank Binns <Frank.Binns@imgtec.com>, 
 Matt Coster <Matt.Coster@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [EXTERNAL] [PATCH drm-misc-next v2 0/2] PowerVR VM fixes
Thread-Topic: [EXTERNAL] [PATCH drm-misc-next v2 0/2] PowerVR VM fixes
Thread-Index: AQHaIxCgOcbJC4ddfkinuzPofyso7bCaz84A
Date: Tue, 5 Dec 2023 14:54:38 +0000
Message-ID: <1964b1a41e170c7eb85cfe4b5a54eb04e96d4c71.camel@imgtec.com>
References: <20231129220835.297885-1-dakr@redhat.com>
In-Reply-To: <20231129220835.297885-1-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB5737:EE_
x-ms-office365-filtering-correlation-id: 53ed577e-4608-450b-8c0f-08dbf5a21ade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q32EaAEdx8+KICFpitonruuTgS2QyREHDs9y89mgog1iW93kYeSzSGZfzV+o6FqohjYCii0Noe+xMh+EvH2kXTdC2AHFz2ViOVijFud0HtQweuHozTUwvECLwP7TOPi0K/SHQqY0bqOyU1945ZyZrz/TWw7r+WHsN1DImFu5OsH0I6VktG3SuVsptFIZ3W7pg285aQT7mVI1dowl4w9eaOcHqy4+FTdK7FxdTkgvtYciUQ9v5B+89WNUhFQ/W7sfldMhRyTicEWyryE5CxjAmBDX8t/OhRnV5Ey+sTX/hhxu50PBRfnoGFezpzkwhF9CGXXU/ffTn+p9BWBHOmPuu4Wci1I1h4iPEnIUppQfkDSXI8VvbZubIWFzekLFaJNAdxyBL0XAYbArOlJcnQLzyJfIMloNsXBb5DWCXGdRXbHaUbHZPU9x6XUUnRyiAg1t5F6dXmbmAxgSISMXEiiFqu88FeSl29GwKRHMZ/m74VVvmCYOmV2bZgq/QtpfbtgJXow7dR6F+/ATyWKz06HKRDmEuACKZEwpCcNLFffOlekiOJYI2oaw+mjwhozi3ZRYdJIAjPzO86pycZ6CHupQcEEOl4W8G2oxKFilMNjUzd+7AZUc78Ocp+YJMBnHV50EYB2+ye4/2O6GGg/49GJ0RKXfqFyDeC1vrJdVd7LSlNY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(39850400004)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(4001150100001)(2906002)(5660300002)(36756003)(38070700009)(86362001)(41300700001)(6506007)(71200400001)(6486002)(478600001)(6512007)(38100700002)(122000001)(83380400001)(26005)(8676002)(4326008)(8936002)(2616005)(66946007)(76116006)(6636002)(66476007)(66446008)(66556008)(110136005)(64756008)(91956017)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2owM0hGejRiWTdjZWNtSWw2R3dmbGw4eDBrUE1zMFBVQ3ROSzVTRGI1dmxB?=
 =?utf-8?B?WjNZWCsxSVZYbXQrQk91dFVLRUdudUlRclVOYVZOdGRsYzNVQlIySi9HQXVo?=
 =?utf-8?B?cDBaTkVnZTFLQWtzdjFLRWxOdHNZYVBLWDAvTmlFOEhScU9ORWVyWjhFY0dB?=
 =?utf-8?B?Zkx6aGEvUEhIdEh4VHV3b2x2aXZmNjhDNGMyc2JtZlk0d0tGRzIxRmxBbFE5?=
 =?utf-8?B?RVcwU2NQb3l2THZQdDFVRzFUVEZJeGxLTDl0QzN3RzljYU1mTGR1L2NFV0FW?=
 =?utf-8?B?WldNVitWVUk3NmhnTEZKUXRZV1dyMTN0MFJTVlVyaC9UK0dxWkpKMFYxYWtY?=
 =?utf-8?B?TnJMNFNsTFVtSmZPT204SEQwWGdGdXFLTGh4Y04zVDR4N2Z3R0RFOElqVkl2?=
 =?utf-8?B?cEorN1ppY0dsL1l6VVhERU4wdWN2dTdndXozK09VR3BIR2kxNjJGWDVvMFc5?=
 =?utf-8?B?bWhLSGJmWDgxQUZ4eXpwQ1NYQ2ROS2pSUENTczQzVkdjYVN2UWJPVDBWdTVL?=
 =?utf-8?B?enhoWXZpcVk4T1lkdWhXMUxYcUxLR2F2Y0R6aVJrMmUzVndRblVDb09HKzBC?=
 =?utf-8?B?NjVMaWQrNEt5NlBEUDl4OFFjRkdLWGNoOUtXVEJaSStSR2w2ZUdGY1RXV1JG?=
 =?utf-8?B?aEUwb0xOaXJIdzZYakdkbkFKVDJmUzMxUkIzWnd6YXFMNEEwZU9vM3EvOTBh?=
 =?utf-8?B?bUZhY3ZlY3NxMVFRY1N4cStMa0J3WVJWZG5WOHdjNURNS2trOTJYRVRSbWNT?=
 =?utf-8?B?dGtMdlRJQTVTcWxieFFqRVZ3STFoN1RBL2MxZmxUdU1EcStJWHJyeEp5M3c0?=
 =?utf-8?B?ZDhIZWlsaXVCSnVpdE5HVXBUZ2E4clUrSFh6VjJnVG1FUWxKU3praStuUXR2?=
 =?utf-8?B?S1dyS3BBQndTa3lHSy9BVHVzK0pzZFYzUHZnME1SV1JyTXhIZUw4emRKTXJa?=
 =?utf-8?B?Ym8xeUY2TWNNOWhnMUJRZzJYN3ZLNmF4dWh5SVJvK2dhS1R1SjF2SXgzeDZl?=
 =?utf-8?B?OTBuTTY1dWdvSmpIWlVKdE5mZEFvWUFaT3BJL2hjZzNHNlVvdzdFSmtRVk9a?=
 =?utf-8?B?czZKL3ZzNE11UDFiemZmWWFRTTlKK1pyT0lZR3VEVTVnU0dKbFJ4Uks1OVVD?=
 =?utf-8?B?bUJvZUZ1cXlYTHVPSVYzQ205OERtT1d4ZzlGQzZjK3BxQXFsZnBVazBNV2Nq?=
 =?utf-8?B?YXpCeWpuMTFsNDNzK1FkQTdJOWIzWFNwNnU0QnlzZnlDajdvcnlQbHVVa2Jq?=
 =?utf-8?B?dUJqbjFYWDNlQ2taR3dEYWpwUzNid1hBTFlMVjg2cVFvd0xoUkRyVmtkbVdG?=
 =?utf-8?B?VmRQVXAwaGFTSmxmMXhXQnhCeXZ3UjUweDZPczBDWTBoRlJKU0pDcjNmNVcw?=
 =?utf-8?B?Y1RlcStTVm1mMlNoNy9xRWtOdmNkMyt5RmJnN25YWGFMcWI4QVBsVEJHSTFY?=
 =?utf-8?B?Q0M0WE5nMlYwanJZNGpQVS8xbUdrS1VrRmNrNVdLcGlCQ213bWoxRTBKQ1g5?=
 =?utf-8?B?TzJaU3NSL1dCKytzQUFRRGY3YWJIejI1TjZ4UENyZ0h3a1RZL2k4MnFHL0xw?=
 =?utf-8?B?elpyUEFIVW5rbkp1cFl3bDNUbDBZbzJ3TlRvdFlvb2UveWU0YW8yMTNzeFdZ?=
 =?utf-8?B?VGtjb2VYODMwTXo3UUFMc2xuenRGWmdmU2ExRkZuODZRYU5mRFp4c2xYcC8v?=
 =?utf-8?B?Q3BaeXJDaWVXT2JCWEw0elFocStrMTFtOHRybStBSng2cnhXQmhGMENJSlp2?=
 =?utf-8?B?Y2RORnUzVjBFaGVzOGZ1VVpnNjNRemkvTVdxSXpXL1NjbDBFWTBJTUEzUmhz?=
 =?utf-8?B?cHNNUjVaT1NRUGhiUUU0WHV1RHF2eTNzK1pKWG9Ob1o5cHpZUDVrQ3c0NjMr?=
 =?utf-8?B?TWRiNm5GVGl5cEd2elhqL2w5cjNjL29NdUh0WVRnTHdOQ1ZvcUNXOUh6bXEr?=
 =?utf-8?B?dXFaV0NlbHQyNEZJRVR6T0ZGRTZONWwrQWM3L1FiUWNBNWJZeTRHa0xITGdi?=
 =?utf-8?B?ZytFcmlXdDFGTjRxZDlmN3F2LzJrWGtzVm5PdXJrSjJlMWtaNXdLSDZmbzVV?=
 =?utf-8?B?TDVVNFZzY3R5YWtWQVZpZ3ZxdmRyakRlYThKM3JUVGdQdzJvbjBheEVKRzJp?=
 =?utf-8?B?SENOTTZuZkRQVmRnTThMWVlYUEJTM01yNUM3czNrTDBReE5VYldNL2Z1UHQ1?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DE3F21CE50CAD49B8C4A28B9759559B@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ed577e-4608-450b-8c0f-08dbf5a21ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 14:54:38.7099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94+NjMQ1k90lr6EN+Jblj2vd0ENDRh+Spds//rU1fGU4ToXGFAGnKBH1fHQL12OQch3dTejCfEBiIXNBfUA03iWTzDXofn2CUNnsQfKEVog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5737
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: KISHjFsIpXUvG1dy5BEDuk5q0VcEYJMW
X-Proofpoint-ORIG-GUID: KISHjFsIpXUvG1dy5BEDuk5q0VcEYJMW
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBvbG9naWVzLCBJIGRpZG4ndCByZXBseSBhbGwgbGFzdCB0aW1lLg0KDQpUaGFua3MgRGFuaWxv
IQ0KDQpSZXZpZXdlZC1ieTogRG9uYWxkIFJvYnNvbiA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMuY29t
Pg0KDQpPbiBXZWQsIDIwMjMtMTEtMjkgYXQgMjM6MDcgKzAxMDAsIERhbmlsbyBLcnVtbXJpY2gg
d3JvdGU6DQo+ICoqKiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNvdXJj
ZSBub3Qga25vd24gdG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUgeW91
IGNsaWNrIGEgbGluayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBIaSwNCj4gDQo+
IFNvbWUgbWFqb3IgR1BVVk0gY2hhbmdlcyBsYW5kZWQganVzdCBiZWZvcmUgdjggb2YgdGhlIFBv
d2VyVlIgc2VyaWVzLiBTaW5jZSB2OA0KPiB3ZW50IGluIHJhdGhlciBxdWlja2x5IChyZXZpZXcg
cHJvY2VzcyB3YXMgZmluaXNoZWQgb3RoZXJ3aXNlKSBJIGhhdmVuJ3QgaGFkIHRoZQ0KPiBjaGFu
Y2UgdG8gcmV2aWV3IHRoZSBzdWJzZXF1ZW50IGNvZGUgY2hhbmdlcy4NCj4gDQo+IEhlbmNlLCB0
aGlzIHNlcmllcyB3aXRoIGEgZmV3IGZpeGVzIGluIHRoaXMgY29udGV4dC4gUGx1cyBhIG1pbm9y
IEdQVVZNIHBhdGNoIHRvDQo+IG1ha2UgdGhlIGRybV9ncHV2bV9wcmVwYXJlXyogaGVscGVycyB1
c2VmdWwgZm9yIFBvd2VyVlIuDQo+IA0KPiAtIERhbmlsbw0KPiANCj4gQ2hhbmdlcyBpbiBWMg0K
PiA9PT09PT09PT09PT09DQo+IC0gR1BVVk06IHVwZGF0ZSBmdW5jdGlvbiBET0MgY29tbWVudCB0
byBpbmRpY2F0ZSB0aGUgcGFzc2luZyB6ZXJvIGZlbmNlcyB0bw0KPiAgIGRybV9ncHV2bV9wcmVw
YXJlXyogZnVuY3Rpb25zIHJlc3VsdHMgaW50byBkcm1fZXhlY19sb2NrX29iaigpIGNhbGxzIHJh
dGhlcg0KPiAgIHRoYW4gZHJtX2V4ZWNfcHJlcGFyZV9vYmooKSBjYWxscy4NCj4gLSBwdnIvdm06
IHVzZSBkcm1fZ3B1dm1fZXhlYyB3cmFwcGVycw0KPiAtIGRyb3AgMyBwYXRjaGVzIHdoaWNoIHdl
cmUgYXBwbGllZCBhbHJlYWR5DQo+IA0KPiBEYW5pbG8gS3J1bW1yaWNoICgyKToNCj4gICBkcm0v
Z3B1dm06IGZhbGwgYmFjayB0byBkcm1fZXhlY19sb2NrX29iaigpDQo+ICAgZHJtL2ltYWdpbmF0
aW9uOiB2bTogbWFrZSB1c2Ugb2YgR1BVVk0ncyBkcm1fZXhlYyBoZWxwZXINCj4gDQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dwdXZtLmMgICAgICAgICAgfCA0MyArKysrKysrKysrKy0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMgfCA5MSArKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tDQo+ICBpbmNsdWRlL2RybS9kcm1fZ3B1dm0uaCAgICAgICAgICAgICAgfCAy
MyArLS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDgwIGRlbGV0
aW9ucygtKQ0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiA4M2RjMTAyOWRjZjUwYjViODQ5YjI2Njc5
YTFiM2Y4NjBiODVkNzljDQo=
