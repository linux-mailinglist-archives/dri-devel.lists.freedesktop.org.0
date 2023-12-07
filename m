Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D055808669
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 12:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416410E875;
	Thu,  7 Dec 2023 11:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3310A10E86C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 11:11:33 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B77l1UM012166; Thu, 7 Dec 2023 11:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=OpMq5afrOTyi8+p/JFGEzwoNiNAx0JJMEHZZYmB8riA=; b=
 Tvia1fx7rn6LjcLKtEShXjj4loCdZ/0g3eTnOwxlnaGQEKMmRLP7pJl+lAmaBgPG
 wGl98WNhSlkyzlDEmaPdNKGsKCrAYArOChVl3ptBaABEdg20eBOW14e1n7nAS7RI
 s3sB7vsxWrHPLs5ShkzkYbMVUTo34NaH903usfrkGyYrO5RiF1q+fubHUajgo8FP
 k/InqS8vDrPS2HZDIMS0HvOVoZ5kulnspM60PZrIKGowf9IZU48MGoTW1ZDdui8U
 JxIq1pB4abV8loRpvCxn1s7/GRlLlzLIgRtWdpZ5x1mZHwKGT2fF6dFYHRY+etc7
 f9ufc3ECsGBFephGsoYskg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3utd35919f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Dec 2023 11:11:18 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:11:17 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 11:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTps+5PjpLvZpDSINdm6TENvCP0SAceGit5HfuzampEqRmxVYxJCKTdrPKsBdE4jyku1oEMWbI7UzeHKzG7D1tHMyBkONSq2Ov1EoXVMy6D9zKrUk4o29WxcKZ6gjy5NkbZJbd2sVj5En14FwnsoVw9M31ymO2EHdgSip7itYO63d7TpmkJXDoeeR5pcXDMZw8proYVKapBlASCbP39ibjuRpUZsbDmCbf2NNaA9zjM4sp+0Wo2IpjkBo+QmplBLYMX4G22NDuSelMP4TYb/3KczfIMoxl/ygNoHWlh6H7Ix3L6ZdwZPcrgHkTVVbf30YXzKsu2+pQvtzAjqcI22Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpMq5afrOTyi8+p/JFGEzwoNiNAx0JJMEHZZYmB8riA=;
 b=kgfpxJ/vSvTKUPLh43wgK82RCMeMY88HSSVASgA7feuztmVNeEUlMdQMAbGwSlc9weS4FZJ83LtsnqRrnd3OYsIJeKi09Lf/V9xSZL6OWKynTQLJQNhBD1JA1VBIEhSTJhrST4BODBCcE0NQuFahFsWqIoZn3zxul+kWVT9q+GdTYCWqj7Dd/sFHUjFW7mJTmR5Wae68L2wsNeppnljLRDq5hc5N41/oLoEDW/LbaYc5AaLAWUfVhgJ+9rUjJva4n38fXs3djxIw19S7wA4pkhHgzDZeOj9MNdgfhOelzSRkRdvxDP2NBLMRHDYnQU/CGb2l3rMek2QIiHB+Zf96GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpMq5afrOTyi8+p/JFGEzwoNiNAx0JJMEHZZYmB8riA=;
 b=NSWuxufZPLOH9d1WZRzmEJ0u3h7LDv2bpl8CRmhR8s/tFPxUAwXe9mYpFmnHOwNyfPF0HjhyLPSI3R/TY/e00le2/sWPlo5EJYlZ6cuJMlElOQrvZN1JM0yo2hJgijQN0n9HyAi9MNbnxwQcuWPW5bXl3+IBQE54h1UlmqWXtNM=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by LO4P265MB6745.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 11:11:15 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 11:11:15 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "steven.price@arm.com" <steven.price@arm.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3 03/14] drm/panthor: Add the device
 logical block
Thread-Topic: [EXTERNAL] Re: [PATCH v3 03/14] drm/panthor: Add the device
 logical block
Thread-Index: AQHaJtgIDo1g6b2feEyrz7ZawETu0bCcfGgAgAEANoCAAAxBgIAAGGeAgAANOAA=
Date: Thu, 7 Dec 2023 11:11:15 +0000
Message-ID: <c3816b4f74108ad7effbf0c9e92b440e34400b87.camel@imgtec.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-4-boris.brezillon@collabora.com>
 <4d813208-39fe-4387-8415-4b0c17df42a4@arm.com>
 <20231207091243.7ce56a6e@collabora.com>
 <20231207095635.435d3e77@collabora.com>
 <1b957ca4-71cf-42fd-ac81-1920592b952d@arm.com>
In-Reply-To: <1b957ca4-71cf-42fd-ac81-1920592b952d@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO2P265MB4600:EE_|LO4P265MB6745:EE_
x-ms-office365-filtering-correlation-id: 9590fddc-5fcf-4026-4134-08dbf7153adc
x-ld-processed: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gd3Z3jYlK+ZujAA79P9pyHWqFCUMl5qn5w5ndxt7ZN/XCjqigGSiLILXpbRGh4VCseHjtjG9Sf5oOyXLLjse0O1ugrk6PaucCZ2xvi1CMQNO6a6oXKpvJdBpkJyOmgnMvFx58+j23CAvB/F88ahUTUb95o2w1mJDXZbm0rrGsSEtOAQBuQ6ndLkD0zBhAuhh1SrQry1gB3pmTOMXveBnjUI50NGPWBlx5As9cQWnifiSSzUnBan9Agz0rj5HFzODWBgQ8UrXF9xO0pfqRAc30FCT/Wh4rG+VvzES5lFZ9jKOTXqjl6IuY08KbBfe7IB5YN2x23k54ht87eId7CXfCBOUKsc9e3ELzXOng3Jhfu/Le/WRJZchCKYowe1e81/rqtGOB69zfn2rR3MFyImqEgh+PfdOU963kSmB/FRhWOVXNsRDwskSOzuPaMuxIuR0wQKvN0r0K0cwEf6wGYCr8N1TDv4q3TqS248TS29GsJErj4StfT2yMa/xBU9KzzJ0Ewr+eDYNLQDORrDXkgL4qwBLS9ZbAR6GlM5yeR70q40T5nMCL307CiVGYQtVb6Lw3eNZJnMcoGS7Xve1n68L7ohAtayl8annD/UGAi998YmJ/HgvihTgql+sFLsH6V7/WBYACIXtVKt6QGtmhObLvD2VKR+zI8Z32E5gSm4Mal0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(136003)(366004)(396003)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(66946007)(86362001)(54906003)(64756008)(66476007)(66446008)(66556008)(76116006)(66899024)(110136005)(26005)(2616005)(38070700009)(83380400001)(53546011)(6512007)(6506007)(36756003)(41300700001)(71200400001)(478600001)(122000001)(6486002)(316002)(4326008)(8676002)(8936002)(7416002)(2906002)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enJyVDdiV1lFZk5BZEp5RWpmdTZjVnV6eTY5Smg2K0IwbFhiK0t3bzdKVEdU?=
 =?utf-8?B?bTh4YTNDclp5cXdFWlhIZ1p0MVdPanZnbHErMmRXbEwvaFEzUFg0aFhwcFNa?=
 =?utf-8?B?bllNVm9aaURiM2VqOWRpV0VuT1padENpdGVjWWw4ZFUyVC9rekRTSjJQc2Zk?=
 =?utf-8?B?WHU5WEJKVnBTK0Jsb2JOc2ZqYUpYT1lUVjdvQjlRb2taUkw2aWxXNldOekli?=
 =?utf-8?B?ZWVXVGhON3V0ZFY0a2tVQm1BUHpFZnFuRHhLZlQzQVJMRkpCVFlweTdOdU40?=
 =?utf-8?B?VlovbDdsazQxcTB2eTFReC9vaUtTU1JJUmNLdXR3R2hJSFpZSXUwQjUxTUJK?=
 =?utf-8?B?Y0M5cHBMaDM5dVkwazFPT21QZHJvQTBteVBZYVBScWxyelJ6NDJhNmFpMFlN?=
 =?utf-8?B?d0FTRnh1bHJuclcwajYyVWRnWmRCaG5aWm5kZE9SQkZySGlPSkFTTFE1Ym1u?=
 =?utf-8?B?WDVmNGFEdXJ6enRnTlNrQUdlQnlTOHpJZUt6YWdSRnFBUGtoUjNoTFdZOGlM?=
 =?utf-8?B?N3FZK05nV2VKWHhvVzNqbjcxVDVtSVJGaUd5dE5USWhrSTcrbmtUM0Izc1BY?=
 =?utf-8?B?clVJeWx2djB4ZlgrV3lZZlc3YzBmTVMvanRpeTlRNEJaQlJ4ZE9MZ01ZUTBG?=
 =?utf-8?B?U3JWNVN2L0NSOE84djRPeU1jaU1iSFN0dUVBaWJBS0ozYmNHcE9PTnBTbEhQ?=
 =?utf-8?B?bm1zZU9UOWpZbk5PQ3IwcU16UTB4Q2krdzRyZG9hR0dkQ24yUHZGUXZGUWsy?=
 =?utf-8?B?cmNsOXVIUUM3R2R4LzV1bFNGcWZXRm1zb0YybkVISzlHcWdwaWNVdGZNOHN1?=
 =?utf-8?B?VTZYMWIzZDkwNE9YK0Fndis1TU4xWW9MSVByLzlLOGlsYkkxWktHS1JoTTkz?=
 =?utf-8?B?SXRkS0d5QzQ2d0VyMVEramZPUFM5R24rMk56dzQvTVVSaHNqMHZqVEZ2MGpG?=
 =?utf-8?B?NkxncFpScjFXdjZmUWFyVVNaa215NHkwakR0MmJ2MEViVWRHT2E4R1cwODdE?=
 =?utf-8?B?TVE3WC9uT1JBR1JRcVJLRXhFOGhQaEJxcnp0RXhnNndpdDNtRDQweWhxczNC?=
 =?utf-8?B?a0JZZzRHYVAwSVR5Q0I2T2NDd296T055QWZWSXVSWTZSNDZ2WlhYd0hFWWwr?=
 =?utf-8?B?K1lNaS8zZ0pYelpja2hTSEI0bkowdVpDdjFYc3U4KzQ0aCtMVnBVS1NUNGNa?=
 =?utf-8?B?TDVrcjMrT1llc3B6bXNtTVV2OGhKRlBDTmZ5MTdjY0JhbDluOElHYjlqZnl5?=
 =?utf-8?B?aUxibzZ1Q1JURHNrek9oWGkvRkRjS3diTmV0RE9aRE5iZGZGaTZsMlRpZ3hH?=
 =?utf-8?B?eGt0amRMOUp5OHBTV1d4a1FmQ3NaU0VoUHhTYm1mMEFzQlNINCtYY1JlVmZz?=
 =?utf-8?B?WVlzajdYMGxwbmNCVmhjbzBNazBQSzBNZjVHUllhZWlUUGo2V24zM2dLem1l?=
 =?utf-8?B?L3V3OVpFS0VEckdDbEFNZVpqaXRUUEZTMUdaWnJwRUJvQkpoNUJNQkdpRWVa?=
 =?utf-8?B?SG92MWtBNDVtbzVrWGYwUXovdmNkYm5ab3AzeHU3a3JEZnlJczh5SUI1R091?=
 =?utf-8?B?VmdqYkZjekhSRjBvSEYxZnhZeTlPdG12dENqdjFKSWdlV1JHRUYrcFl0U1VG?=
 =?utf-8?B?L2djelplcGRybkRSK2hwODRjOTJ3cGhib055R3FuMzlJTFVFeW9kUXpITnd2?=
 =?utf-8?B?cGQ5Tm5nYVMxQVdQUXFQdTRlYmFJYlp2TEFBMnBDYm9HRVA1ZzJ3cGMvbDNO?=
 =?utf-8?B?NE04djBpQ0RCRU5zQkFLd0RwMGxqeUlzTkMva1J5WWRhSWNlT29NNHFzTzJu?=
 =?utf-8?B?dW9MaDhXaVRjZUFmZDRDS1hCangzUFd4SSsxV0xhR25uOEo2OGZkNTBLbTFT?=
 =?utf-8?B?azFPTi9VUVo0TnRISk16ckdUbWczSTk5MFZnLzAwdXVsazJCQlMvOEJhWmlB?=
 =?utf-8?B?a25VeVlCVEVFTS9FQlV1ZG5GVkRkdm9Za21yeERINmpPU2VsMnpBNVpyRmZG?=
 =?utf-8?B?cnpGQ2ZvZHpKRHMrWHROcTNrVm91RFlJNHNaNEpnQWRaR1laVGgxQWhpd0xK?=
 =?utf-8?B?NGhLTE9Rd0NoajBabVVYeG5MZUV1TlZJemlYajl4SWE2OVNmU3g2K3U4OXJa?=
 =?utf-8?B?dWR6dmIyNEI0bzRYZ0dmdkdUYWhLQzBjQURQTzVBRWRTSG12M0hZUWhYbE8r?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F418F3E4FEC1264D95687CB6D3A1516C@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9590fddc-5fcf-4026-4134-08dbf7153adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 11:11:15.6751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMKBBClPHtR82ifjpJbDmPJRqUiAOkxCBwbLfzJxZx45/UVbuWN/Lgf8SH9WGwpaRJMK4rHJGxzvsMGd/T7jcpVEvOHJT8TOMgO4Angduhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6745
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: tWYAk__VTiC-jCD6AqAHyn_pihxRbgGr
X-Proofpoint-GUID: tWYAk__VTiC-jCD6AqAHyn_pihxRbgGr
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "kernel@collabora.com" <kernel@collabora.com>, daniels <daniels@collabora.com>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "peron.clem@gmail.com" <peron.clem@gmail.com>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "hanetzer@startmail.com" <hanetzer@startmail.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydCENCkRvbmFsZA0KDQpPbiBUaHUsIDIwMjMtMTItMDcg
YXQgMTA6MjMgKzAwMDAsIFN0ZXZlbiBQcmljZSB3cm90ZToNCj4gKioqIENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlcyBmcm9tIGEgc291cmNlIG5vdCBrbm93biB0byBJbWFnaW5hdGlvbiBU
ZWNobm9sb2dpZXMuIFRoaW5rIGJlZm9yZSB5b3UgY2xpY2sgYSBsaW5rIG9yIG9wZW4gYW4gYXR0
YWNobWVudCAqKioNCj4gDQo+IE9uIDA3LzEyLzIwMjMgMDg6NTYsIEJvcmlzIEJyZXppbGxvbiB3
cm90ZToNCj4gPiBPbiBUaHUsIDcgRGVjIDIwMjMgMDk6MTI6NDMgKzAxMDANCj4gPiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToNCj4gPiANCj4g
PiA+IE9uIFdlZCwgNiBEZWMgMjAyMyAxNjo1NTo0MiArMDAwMA0KPiA+ID4gU3RldmVuIFByaWNl
IDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4gPiA+ID4gT24gMDQvMTIv
MjAyMyAxNzozMiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOiAgDQo+ID4gPiA+ID4gVGhlIHBhbnRo
b3IgZHJpdmVyIGlzIGRlc2lnbmVkIGluIGEgbW9kdWxhciB3YXksIHdoZXJlIGVhY2ggbG9naWNh
bA0KPiA+ID4gPiA+IGJsb2NrIGlzIGRlYWxpbmcgd2l0aCBhIHNwZWNpZmljIEhXLWJsb2NrIG9y
IHNvZnR3YXJlIGZlYXR1cmUuIEluIG9yZGVyDQo+ID4gPiA+ID4gZm9yIHRob3NlIGJsb2NrcyB0
byBjb21tdW5pY2F0ZSB3aXRoIGVhY2ggb3RoZXIsIHdlIG5lZWQgYSBjZW50cmFsDQo+ID4gPiA+
ID4gcGFudGhvcl9kZXZpY2UgY29sbGVjdGluZyBhbGwgdGhlIGJsb2NrcywgYW5kIGV4cG9zaW5n
IHNvbWUgY29tbW9uDQo+ID4gPiA+ID4gZmVhdHVyZXMsIGxpa2UgaW50ZXJydXB0IGhhbmRsaW5n
LCBwb3dlciBtYW5hZ2VtZW50LCByZXNldCwgLi4uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhp
cyB3aGF0IHRoaXMgcGFudGhvcl9kZXZpY2UgbG9naWNhbCBibG9jayBpcyBhYm91dC4NCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiB2MzoNCj4gPiA+ID4gPiAtIEFkZCBhY2tzIGZvciB0aGUgTUlUK0dQ
TDIgcmVsaWNlbnNpbmcNCj4gPiA+ID4gPiAtIEZpeCAzMi1iaXQgc3VwcG9ydA0KPiA+ID4gPiA+
IC0gU2hvcnRlbiB0aGUgc2VjdGlvbnMgcHJvdGVjdGVkIGJ5IHBhbnRob3JfZGV2aWNlOjpwbTo6
bW1pb19sb2NrIHRvIGZpeA0KPiA+ID4gPiA+ICAgbG9jayBvcmRlcmluZyBpc3N1ZXMuDQo+ID4g
PiA+ID4gLSBSZW5hbWUgcGFudGhvcl9kZXZpY2U6OnBtOjpsb2NrIGludG8gcGFudGhvcl9kZXZp
Y2U6OnBtOjptbWlvX2xvY2sgdG8NCj4gPiA+ID4gPiAgIGJldHRlciByZWZsZWN0IHdoYXQgdGhp
cyBsb2NrIGlzIHByb3RlY3RpbmcNCj4gPiA+ID4gPiAtIFVzZSBkZXZfZXJyX3Byb2JlKCkNCj4g
PiA+ID4gPiAtIE1ha2Ugc3VyZSB3ZSBjYWxsIGRybV9kZXZfZXhpdCgpIHdoZW4gc29tZXRoaW5n
IGZhaWxzIGhhbGYtd2F5IGluDQo+ID4gPiA+ID4gICBwYW50aG9yX2RldmljZV9yZXNldF93b3Jr
KCkNCj4gPiA+ID4gPiAtIFJlcGxhY2UgQ1NGX0dQVV9MQVRFU1RfRkxVU0hfSURfREVGQVVMVCB3
aXRoIGEgY29uc3RhbnQgJzEnIGFuZCBhDQo+ID4gPiA+ID4gICBjb21tZW50IHRvIGV4cGxhaW4u
IEFsc28gcmVtb3ZlIHNldHRpbmcgdGhlIGR1bW15IGZsdXNoIElEIG9uIHN1c3BlbmQuDQo+ID4g
PiA+ID4gLSBSZW1vdmUgZHJtX1dBUk5fT04oKSBpbiBwYW50aG9yX2V4Y2VwdGlvbl9uYW1lKCkN
Cj4gPiA+ID4gPiAtIENoZWNrIHBpcnEtPnN1c3BlbmRlZCBpbiBwYW50aG9yX3h4eF9pcnFfcmF3
X2hhbmRsZXIoKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCj4gPiA+ID4gPiBB
Y2tlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gIyBNSVQrR1BMMiBy
ZWxpY2Vuc2luZyxBcm0NCj4gPiA+ID4gPiBBY2tlZC1ieTogR3JhbnQgTGlrZWx5IDxncmFudC5s
aWtlbHlAbGluYXJvLm9yZz4gIyBNSVQrR1BMMiByZWxpY2Vuc2luZyxMaW5hcm8NCj4gPiA+ID4g
PiBBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4gIyBNSVQrR1BMMiByZWxpY2Vuc2luZyxDb2xsYWJvcmEgICAgDQo+ID4gPiA+IA0KPiA+ID4g
PiBXZSBzdGlsbCBoYXZlIHRoZSAiRklYTUU6IHRoaXMgaXMgcmFjeSIgIA0KPiA+ID4gDQo+ID4g
PiBZZWFoLCBJIHN0aWxsIGRpZG4ndCBmaW5kIGEgcHJvcGVyIHNvbHV0aW9uIGZvciB0aGF0Lg0K
PiA+IA0KPiA+IFRoaXMgWzFdIHNob3VsZCBmaXggdGhlIHJhY2UgY29uZGl0aW9uIGluIHRoZSB1
bnBsdWcgcGF0aC4NCj4gPiANCj4gPiBbMV1odHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BhbmZyb3N0L2xpbnV4Ly0vY29tbWl0L2I3OWIy
ODA2OWU1MjRhZTdmZWEyMmE5YTE1OGI4NzBlYWIyZDVmOWFfXzshIUtDd2pjREkhMXg5bXFQeDlL
MlNwcldkZ3pCQlJFeExEdTh1VmFqVmVKY21sTWtNdWZtSXFKaTVUWUxxaURoaEJyMWhsbkJRUVVW
Z0huSktuV0luam43cldxMEhfaUxnJCANCj4gDQo+IExvb2tzIGxpa2UgaXQgc2hvdWxkIGRvIHRo
ZSBqb2IuIEknbSBzdXJwcmlzZWQgdGhhdCB3ZSdyZSB0aGUgb25seSBvbmVzDQo+IHRvIGZhY2Ug
dGhpcyB0aG91Z2guDQo+IA0KPiBMb29raW5nIGF0IHRoZSBuZXcgaW1hZ2luYXRpb24gZHJpdmVy
IGl0IGFwcGVhcnMgdGhlcmUncyBhIHNpbWlsYXIgcHJvYmxlbToNCj4gDQo+IHB2cl9kZXZpY2Vf
bG9zdCgpIHVzZXMgYSBib29sZWFuICdsb3N0JyB0byB0cmFjayBtdWx0aXBsZSBjYWxscyBidXQg
dGhhdA0KPiBib29sZWFuIGlzbid0IHByb3RlY3RlZCBieSBhbnkgc3BlY2lmaWMgbG9jayAoQUZB
SUNUKS4gSW5kZWVkDQo+IHB2cl9kZXZpY2VfbG9zdCgpIGNhbGxzIGRybV9kZXZfdW5wbHVnKCkg
d2hpbGUgaW4gYSBkcm1fZGV2X2VudGVyKCkNCj4gY3JpdGljYWwgc2VjdGlvbiAoc2VlIHB2cl9t
bXVfZmx1c2hfZXhlYygpKS4gSWYgSSdtIG5vdCBtaXN0YWtlbiB0aGF0J3MNCj4gdGhlIHNhbWUg
cHJvYmxlbSB3ZSBkaXNjdXNzZWQgYW5kIGlzbid0IGFsbG93ZWQ/IGRybV9kZXZfdW5wbHVnKCkg
d2lsbA0KPiBzeW5jaHJvbmlzZSBvbiB0aGUgU1JDVSB0aGF0IGRybV9kZXZfZW50ZXIoKSBpcyBo
b2xkaW5nLg0KPiANCj4gK0NDOiBGcmFuaywgRG9uYWxkLCBNYXR0IGZyb20gSW1hZ2luYXRpb24u
DQo+IA0KPiBTdGV2ZQ0KPiANCg==
