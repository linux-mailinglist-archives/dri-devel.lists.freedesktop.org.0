Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A5F76FAEE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C7510E695;
	Fri,  4 Aug 2023 07:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEA310E241
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691126283; x=1722662283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XkNvm1FzTwOiBMgFaaEWaB81u2Aiju2Wt06Q32E10co=;
 b=OVyp2p7OrQjmbXU8F2AY8arvxDuD06Uhgj7eoj5MZCkOdgc6HU/NobVB
 FkYyZ10q+kJjI5AamqE+Ex1ygk2R1ihoxKd6FY4HoLKW9280x7bw7Imi8
 TRMuudzAAMZH6lQrSkHtIj7FAk0QdpYiUZHm+4T0+gziMu6fB11JkCCbs
 e1ngbWnjIn33q+CXCotAD0XgptpBeJzJ3XxaRW4k5aeoK5dAgh0wcj0Hf
 gibtfzNxqbh8sBpQ7K6lmQU48rYt1IpaGs/6ilR196I/OP3yV3hGHKH7y
 1wnQ15yhy8klDz06mmolh9/KVuCwf/Tm9u5dQ17o+4yx1Z4E0bfw28SnG Q==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="239751057"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Aug 2023 22:18:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 22:18:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 3 Aug 2023 22:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbnh57AxDhnmdCuLPztOQhVomuzVUD72fYeqfm4SKVIDB6m7gQsfA5o2jL3hT8LM79AMXb9TKkr4riGrvWTsMCQvIaPzf8MqTkbrpmtBXRO+iottg1nGa84A89UcMDuZYXAYbg3WmPEZiCdPAOTpU2botSwOk5cLMU24wSBVkolzxWab18lGp9GyLY+tNm5NmjgpCV1huW7VrS0t1+MzZffm8pDA+KDfxEsTInqILRWrC0IQP5Nd0p0dNorqUABEoTYeLLmi/BVbTCBQyO5nnODBQtJgKHO1FqKTX0l7dccFvpKHz+YD9rMIsi3phDpGRr52KAIjR2SnRqjK9xI9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkNvm1FzTwOiBMgFaaEWaB81u2Aiju2Wt06Q32E10co=;
 b=Qs/Kj5ZAFZgTvC9enfURMKFns12gbzUaZmX1H3IcBjtLFD21lQY6UpHerdEirZY9fz0ekASt32Gh8lV6yU2fAN7XE9pC/9OVjq0HGcsER290LoKw2ozzMDiX0B2/kUHurYxQrDmcR/3sQN01/pvxBBu+S/PzICxIhUVfBR04uJBcCUiLkPeZtPje/nZwUVScaHS2+8BerFnvSRNBJRs43/ndQYk5mW+K0yKiyAR7Mw77OYvzE9pZnzPxxQBISmXFWAW9BQmW4jK/IcW05kvZXpv0PLw83nahzK2smOXfYhVH0yAndqDO+RjG2Vmy4yQ7lYP0KK1Z3eHXTjxc2XU9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkNvm1FzTwOiBMgFaaEWaB81u2Aiju2Wt06Q32E10co=;
 b=YLCVoq/SUuB5g2gBoy4wasRpYuRM1bElMkHX5HlAJtZEgKMK3lNRVRvziW8n7rC9ltdg2bSetLgfnMwTbNOC5n/F/0r5TXhrQLs0CIOYQCuy12FqymsSRn6hP85Va/QQEMRRHqBeyGFIu2ANwvtr+e6cOHL6GhNqsI7WxO6Autk=
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 05:17:58 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::591f:32f4:3319:e1f8]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::591f:32f4:3319:e1f8%7]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 05:17:57 +0000
From: <Hari.PrasathGE@microchip.com>
To: <Nancy.Lin@mediatek.com>, <p.zabel@pengutronix.de>,
 <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] drm/mediatek: fix uninitialized symbol
Thread-Topic: [PATCH v3] drm/mediatek: fix uninitialized symbol
Thread-Index: AQHZxe/qsUNZO9lcFUqDY0Q9whl9Va/YWxsAgAEJFoCAADX9gA==
Date: Fri, 4 Aug 2023 05:17:57 +0000
Message-ID: <4e36abcf-8cb3-4d3c-5ec4-52e1a011b66e@microchip.com>
References: <20230803094843.4439-1-nancy.lin@mediatek.com>
 <688a97b5-ce0c-cf6b-c78b-aa7410347d1d@microchip.com>
 <a9a0425a5aa25228a8cd4a2c27fa7ce8d327c702.camel@mediatek.com>
In-Reply-To: <a9a0425a5aa25228a8cd4a2c27fa7ce8d327c702.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|CH3PR11MB7914:EE_
x-ms-office365-filtering-correlation-id: 6239c80c-de21-4230-91c9-08db94aa2a43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vIMWeEZX0lUGLXwCQhxvWRcpgC2G5TwXseRdkAtrZ1YSmQriuRx47oLNv8qJhw4f6C//YSDaAGfc73cx8+EWZ9OS+MFTDhezK6PPZElgeXKjoc/xN+RWWAajooaV03Y0oIn8dVDSoxLT3e1CGfp2GFfvYk6V+y2lEE0xvMKxVx6Ad6HrSpnvDK2TCuktmGUxJQWnq9IXy+y/KmbkHmRMoT7OasHygk8uDduc+tRqDSfKWRlsJUR17G203oBM9qQ8LdQ4p/o2WJgevONKV2B34wqcXajpZv1sv4R+7ex4RuGLwJtF3BZ8xQQb3x92IVSb3ZAFpblKc2kkF0LvxwUW9gqetnULdRRyD4g5la3GDc3rehX6dACWJ5heky3iFVMOSgpKU0Uj4GAmarz2TK7IKhNJtvu/ALDHy9ftPfP7dtry7HStNNR81Rxq9R0Uyf1qTNCnoICeJPrIwa+WbUxCYRtEnEpU4G2ZrubcDf4Jjilxu5ZYjwaONmFY1B0VCAFRz3ZhBK2MR8WdH/H5XSou4Gsi17ZAnLQ2Zx8T2vH/P7ljQ1nznOUMMpSi0qXD9ZJ9CWz1CtW03mZ4J9sWKASdhAk3SmhM/iaa9GfEeVCXMRGDDWz5ERL9iFPQPB2QR6Bc4+Zq172a743RjWLNDsey4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199021)(1800799003)(186006)(41300700001)(8936002)(8676002)(83380400001)(53546011)(26005)(6506007)(31696002)(86362001)(122000001)(2616005)(38100700002)(38070700005)(316002)(4326008)(71200400001)(6486002)(478600001)(54906003)(6512007)(66556008)(110136005)(966005)(91956017)(36756003)(64756008)(66446008)(66476007)(66946007)(76116006)(31686004)(2906002)(7416002)(66899021)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVh0TVVuSnZSOVZpdjVLQlJiR2ltdWd3cUQxVk9CWkJYcitLR21QRTlaVDBm?=
 =?utf-8?B?ZmZqdEhrTWhEL2tqUG92endiYVRqYTB6dngwd2ttZHlCY0NEK01EQ0NCL1No?=
 =?utf-8?B?dmUzSkE2Y3FoZUErUEQ0SUE2VHU5U0FVbnhBL3k5d0Q3Wmh2YlRtMzEza2sw?=
 =?utf-8?B?WlFsTDdHOWJiZm5ENzJDRXc3UGtHQ3JKd2QzMGN2Wm9ud2dYOThwdVord1hY?=
 =?utf-8?B?QWNTbGpvbzBGTUdJbDluVURib295VFZwUy96ZG92bW5nazF3WEF2MGpKK0xD?=
 =?utf-8?B?S0dHcjNmOTU5b1hzU0NqcFpJT211NEI2QkxNdFNoQUlBNnhnRTFCczBTTEYw?=
 =?utf-8?B?V2ZwME8yNmFkN3YvM2hzc01tVTMxMWpaMjNkYjVRUHpJbXRpdjBaUWlCc29L?=
 =?utf-8?B?amE2VmhQRHV0MkI0K051bUZFQ3Q4YjVtQTVPOVlDOFM0cy9DeDhOU3NLS3hX?=
 =?utf-8?B?UFk0TDZWRmRRY05ZVGQvS0FwWDdXemZZazhpcHI5akdXK29TVkZRV01uK2ht?=
 =?utf-8?B?ZE1Kczdic3RZNGdaaE8wK0N1NkprTWt1aVd5WWRzdHpPT1lDT2NoQTJXek5k?=
 =?utf-8?B?MzBhY0U4N1JwbFFxUTU1M3Fxb3JqMlFxbFU1QjNjMUpqbmcrZzFwdXJVRWsv?=
 =?utf-8?B?VmhhbFlYWmUvQ2ZsOXJhN2U0cnUwZ29lcmhwbiszVU5zUDg2dWRTRkVDK2Nq?=
 =?utf-8?B?YjRmVndBa2FiVUpaQ0ZXU3VxZVh4ekpETlVSM1dTWXR1dGVaZ1BQN01DNkxI?=
 =?utf-8?B?c082Q05WQmpDZlQ2UWpBdXNwdGYyNTVhTGdGVTBxZkdQbFIvQXg5SS9HdDNj?=
 =?utf-8?B?WXlYcDA4eVE2VWdmYnNTYUM2M2FMY3lxay8zeHdKU1B6VTk5QWpkUnpndjBv?=
 =?utf-8?B?TGtGSk9uazhqczBYKzk2a3AxU0szaDl4YWxlb1IzcGFtcEoySkJkeG1sY0o0?=
 =?utf-8?B?SVVnUHJ0cmFUZWduWXkvSWhieEs4UGRPWE53dGRLYmVrMDVFMEZ1c2ltR0Fk?=
 =?utf-8?B?OGRoZmh6TkRzWkU1YzgvVHlydHlRVFJxNkVubVNDdTBKMEdFVi9wOGZ2aUxQ?=
 =?utf-8?B?dmZwYzRXQW8ycEgyL1phS05uL2dSRkRmWUY5QlgzUi8vY3NBbDZ1eWZCSmdq?=
 =?utf-8?B?K09SenJpQ0s4UnJEZlhPeXR4YTdxc0lYK1J4VjBlVXBWNDB2UHgrc1lUVWtM?=
 =?utf-8?B?emhYRThpd3Y3RHIwNU5QcmJNbldyWjFybHJ1cmYxQ082UG1nUGgwUnFENjBF?=
 =?utf-8?B?R3JPMUM3WTJmUDViNEFNUUM2QnlrM1A3YTZQaTZDd1F6NE1iWjdHNkZQcnpK?=
 =?utf-8?B?eWh3MEE4dFM3dFIySEQzSmpxNWUvRjhBaTFzNHh6Ri9wL2h6SlpPRVVZUXA0?=
 =?utf-8?B?cUZXQmh5Z3RWSnZQRUdqSUJVVEZGK05Nb2VQUnAyeVlxU2kzZFBrbTBicGdi?=
 =?utf-8?B?eHhVQVJYTE5TS095aXR4YXQyNk9hVEFiVk9pRTIyRGZESmFhaGxEMCtYR0kv?=
 =?utf-8?B?azVjNXI3RXBvcmNhRlVDajU0ZGRnUjQwU2dVQ1JlNTFVQ1lyOUhQa0ZNWHo1?=
 =?utf-8?B?Z1dBK1ppQ1lTTUt4S21WZGRCWGlLQ01yL1hBTUdRQytzU3R3VVlKVWZDSjNa?=
 =?utf-8?B?M3BiYnZwb3V0WFdkb1dBUmZXL3FPT1o2cTR6WFJ6dlVaR2VKc2NRMlFOc1BD?=
 =?utf-8?B?bHV5QlZsY2JUZHdXMFlkZ0Z6cE12ajh0MjBITkhpd0RlM29nWTVLWlJMNVNS?=
 =?utf-8?B?RmF6czFaYU9ZalRuKzhCZ1o5QWZiZkZleTFwVmdUdnJscUNGcWhaKzNyVG55?=
 =?utf-8?B?cWxCV0ZvK2FYekRvelgybVRidVIvbm5DdDR3TXU5Vk1XMk5uT0QreU4zalNt?=
 =?utf-8?B?U0tGMnBNbkh5S2M1K24vbjladUw4Unl4UVJjUFlRWUpWY1BmNFU2UkgxcFds?=
 =?utf-8?B?cFJnb21RTUJ5Qk1rUkhITVZoM09PTGZRclYzZWJEa2FVQld3QjNBVjYrTFVZ?=
 =?utf-8?B?UVF5ZHdmMThiNVZtT1RlRjNqb0FyMDJwWkhvdHlMcUFLSjRVcHFDdFhJV2lw?=
 =?utf-8?B?aXFNRFhOeTRJVzAzUkVCaFZFb0VRTldHejF2R3NIOEJzSnp1YUpnYTRWT21k?=
 =?utf-8?B?bVJXUDlielBQSVdHZG1lRER1U0tSZVlLM2t0c2p1SlZJZDNISnBDUmd3Wm1P?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AA557B9B564704A8FFB420B245ED370@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6239c80c-de21-4230-91c9-08db94aa2a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 05:17:57.7412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uT4MjLKB7CjAioDvc6yWDJELL2luYtbjQMpyEuLsYzTSRLrYZ7UV+VCIpasIbaRvrr6AyYZd6cCD4LmQTnKPWcW6dzGq+x5bScg1n3ghDfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:39 +0000
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
Cc: Singo.Chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQvMDgvMjMgNzozNCBhbSwgTmFuY3kgTGluICjmnpfmrKPonqIpIHdyb3RlOg0KPiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIG5hbmN5LmxpbkBtZWRpYXRlay5jb20uIExlYXJu
IHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVy
SWRlbnRpZmljYXRpb24gXQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZl
DQo+IA0KPiBIaSBIYXJpLA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiANCg0KeW91
J3JlIHdlbGNvbWUgOikNCg0KPiBPbiBUaHUsIDIwMjMtMDgtMDMgYXQgMTA6MTUgKzAwMDAsIEhh
cmkuUHJhc2F0aEdFQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pg0KPj4gRXh0ZXJuYWwgZW1haWwg
OiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4+
IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+PiAgIE9uIDAz
LzA4LzIzIDM6MTggcG0sIE5hbmN5LkxpbiB3cm90ZToNCj4+PiBbWW91IGRvbid0IG9mdGVuIGdl
dCBlbWFpbCBmcm9tIG5hbmN5LmxpbkBtZWRpYXRlay5jb20uIExlYXJuIHdoeQ0KPj4gdGhpcyBp
cyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0
aW9uIF0NCj4+Pg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+PiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+
Pg0KPj4+IGZpeCBTbWF0Y2ggc3RhdGljIGNoZWNrZXIgd2FybmluZw0KPj4+ICAgICAtRml4IHVu
aW5pdGlhbGl6ZWQgc3ltYm9sIGNvbXBfcGRldiBpbiBtdGtfZGRwX2NvbXBfaW5pdC4NCj4+Pg0K
Pj4+IEZpeGVzOiAwZDllZWU5MTE4YjcgKCJkcm0vbWVkaWF0ZWs6IEFkZCBkcm0gb3ZsX2FkYXB0
b3Igc3ViIGRyaXZlcg0KPj4gZm9yIE1UODE5NSIpDQo+Pj4gU2lnbmVkLW9mZi1ieTogTmFuY3ku
TGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPj4+IC0tLQ0KPj4+IHYzOiBmaXggcmV2aWV3
ZXIgY29tbWVudCBpbiB2Mg0KPj4+IHYyOiBhZGQgRml4ZXMgdGFnDQo+Pj4gLS0tDQo+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDE2ICsrKysrKysr
LS0tLS0tLS0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYw0KPj4+IGluZGV4IGYxMTRkYTRkMzZhOS4uNzcxZjRlMTczMzUzIDEwMDY0NA0K
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQo+Pj4g
QEAgLTU2MywxNCArNTYzLDE1IEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNl
X25vZGUNCj4+ICpub2RlLCBzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLA0KPj4+ICAgICAgICAg
ICAvKiBOb3QgYWxsIGRybSBjb21wb25lbnRzIGhhdmUgYSBEVFMgZGV2aWNlIG5vZGUsIHN1Y2gg
YXMNCj4+IG92bF9hZGFwdG9yLA0KPj4+ICAgICAgICAgICAgKiB3aGljaCBpcyB0aGUgZHJtIGJy
aW5nIHVwIHN1YiBkcml2ZXINCj4+PiAgICAgICAgICAgICovDQo+Pj4gLSAgICAgICBpZiAobm9k
ZSkgew0KPj4+IC0gICAgICAgICAgICAgICBjb21wX3BkZXYgPSBvZl9maW5kX2RldmljZV9ieV9u
b2RlKG5vZGUpOw0KPj4+IC0gICAgICAgICAgICAgICBpZiAoIWNvbXBfcGRldikgew0KPj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgIERSTV9JTkZPKCJXYWl0aW5nIGZvciBkZXZpY2UgJXNcbiIs
IG5vZGUtDQo+Pj4gZnVsbF9uYW1lKTsNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVQUk9CRV9ERUZFUjsNCj4+PiAtICAgICAgICAgICAgICAgfQ0KPj4+IC0gICAgICAgICAg
ICAgICBjb21wLT5kZXYgPSAmY29tcF9wZGV2LT5kZXY7DQo+Pj4gKyAgICAgICBpZiAoIW5vZGUp
DQo+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPj4+ICsNCj4+PiArICAgICAgIGNvbXBf
cGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUobm9kZSk7DQo+Pj4gKyAgICAgICBpZiAoIWNv
bXBfcGRldikgew0KPj4+ICsgICAgICAgICAgICAgICBEUk1fSU5GTygiV2FpdGluZyBmb3IgZGV2
aWNlICVzXG4iLCBub2RlLQ0KPj4+IGZ1bGxfbmFtZSk7DQo+Pj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAtRVBST0JFX0RFRkVSOw0KPj4+ICAgICAgICAgICB9DQo+Pj4gKyAgICAgICBjb21wLT5k
ZXYgPSAmY29tcF9wZGV2LT5kZXY7DQo+Pj4NCj4+PiAgICAgICAgICAgaWYgKHR5cGUgPT0gTVRL
X0RJU1BfQUFMIHx8DQo+Pj4gICAgICAgICAgICAgICB0eXBlID09IE1US19ESVNQX0JMUyB8fA0K
Pj4+IEBAIC01ODAsNyArNTgxLDYgQEAgaW50IG10a19kZHBfY29tcF9pbml0KHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSwNCj4+IHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsDQo+Pj4gICAgICAg
ICAgICAgICB0eXBlID09IE1US19ESVNQX01FUkdFIHx8DQo+Pj4gICAgICAgICAgICAgICB0eXBl
ID09IE1US19ESVNQX09WTCB8fA0KPj4+ICAgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRElTUF9P
VkxfMkwgfHwNCj4+PiAtICAgICAgICAgICB0eXBlID09IE1US19ESVNQX09WTF9BREFQVE9SIHx8
DQo+Pg0KPj4gSXMgdGhpcyBhbHNvIGEgcmVsYXRlZCBjaGFuZ2UgPw0KPj4NCj4gDQo+IFRoZXNl
IGFyZSB0aGUgcmVsZXZhbnQgbW9kaWZpY2F0aW9ucy4gTVRLX0RJU1BfT1ZMX0FEQVBUT1IgdHlw
ZQ0KPiBjb21wb25lbnQgaXMgYSBzdWItZHJpdmVyIG9mIERSTSB0aGF0IGRvZXMgbm90IGhhdmUg
YSBEVFMgbm9kZS4gVGhpcw0KPiBtb2RpZmljYXRpb24gd2lsbCByZXR1cm4gd2hlbiBjaGVja2lu
ZyBpZiBub2RlIGlzIE5VTEwsIHdoaWNoIG1lYW5zIHRoZQ0KPiBjb21wIHdpdGggTVRLX0RJU1Bf
T1ZMX0FEQVBUT1IgdHlwZSB3aWxsIGFsc28gcmV0dXJuIGFib3ZlLiBUaGVyZWZvcmUsDQo+IHRo
ZSBjb25kaXRpb24gInR5cGUgPT0gTVRLX0RJU1BfT1ZMX0FEQVBUT1IiIGlzIHVubmVjZXNzYXJ5
IGhlcmUuDQo+IA0KPiBSZWdhcmRzLA0KPiBOYW5jeQ0KPiANCg0KT2ggSSBkaWRuJ3Qgbm90aWNl
IHRoYXQgaXQgZml4ZXMgYSBkaWZmZXJlbnQgY29tbWl0KDBkOWVlZTkxMThiNykgdGhhdCANCnlv
dSBtZW50aW9uZWQgaW4geW91ciBjb21taXQgbWVzc2FnZS4gVGhhbmtzIGZvciB0aGUgY2xhcmlm
aWNhdGlvbi4NCg0KPj4+ICAgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRElTUF9QV00gfHwNCj4+
PiAgICAgICAgICAgICAgIHR5cGUgPT0gTVRLX0RJU1BfUkRNQSB8fA0KPj4+ICAgICAgICAgICAg
ICAgdHlwZSA9PSBNVEtfRFBJIHx8DQo+Pj4gLS0NCj4+PiAyLjE4LjANCj4+Pg0KPj4+DQo+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+PiBsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdA0KPj4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZw0KPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbA0KPj4NCj4+DQoNCg==
