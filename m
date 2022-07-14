Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB255757A5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 00:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116810E815;
	Thu, 14 Jul 2022 22:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8639D10E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657837108; x=1689373108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cQy0ghgM78Rgb05H6AnZElNppxCjfvWjsRiiqlkOpKE=;
 b=ji1dblV05VNpCS+cxIJF0r0E27/sr0IL9QT1biucipyE9vnMrlJ3x7QZ
 EVBP9Ts/NYpK0a5Bq3VBwYqSq3j4N/8Ojztv/cK30mkwI0QSe5OwjT80b
 Mp0n/IS4YfFa70ZUw8qxDc7I9eR0HBPPP6kGdUB0Tds4vmkDEK6UhPnFR
 EiNfQIsYFzBdWKZa/vTp8s0bx68QB0R97m1XVwoNhLgiD8CZIptMTxAwc
 ixW+VqReqq4PPuk30b4uDITkFg2CbyBf3QIXmBp5lsfxKZEsKskZWdFBI
 0NPXTVN01fZ+o2+/AFjizGP+xYshm1d0t5eJv03lq1solYNTkHrwX9T2I w==;
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="172387101"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jul 2022 15:11:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 15:11:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 14 Jul 2022 15:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkJSbZf/ggAt0fV9Oa6U4HYlkzavvu9dPLLwm0MWBOxA3e2mRJpC7CZSjp0TKpzvpvjZ43HqQ/DAbQXSkdkYvjfBwPNygG9HT+FhrbkHKE4j6OA3jPj2DcJZwCBLVK5MnBpCjpsCs3DgBhyYQtqlQLPu1R+d/5t05TDRGyZhDURzcfxwoHz4709w4DgSGr6YB7n5xyzIRzvIyQTCiqaQH5tlVMV6lJ/+GlmJmNcvCkVzqyRlKr7UMCeRgGqpIbVJmuVH0hocZQkIGUHS6jIoLs8EGLwD6u+eZiXGRKZZhYMRzTksc85GHqy3UWoTtfVi7FxdMYl0vWh30vPxGJ1apQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQy0ghgM78Rgb05H6AnZElNppxCjfvWjsRiiqlkOpKE=;
 b=GHDvfQfm/GGz2Nj3GRq4dWRd8gs77c+9CgrBRsVeWCHSuL3L/B+qHXzOcGH9FnebepX+n6YPDJrGhjyrE4uOtvdOO4yBFefZ+uyPjXSA4V9X2abUVZHovILKgb3MXK3lfi8iKndAh4eBYgho6pKvq2x2/6+uiMLRICwAelvmTVh/BiKC/x0gDy9HKXgpbj9eVMi8x9Xul/VX8aV47qKfxxo/vuau1jQyFQ1HDoFdUl9b6e+q8SueemkR8GWEHaKkhB/EAW963PMNGhBi8BB0M1bkmuMrv6Rp2b8GymTFWWOhPp8T8V7XOo/dNw+C9qLiHid+7J6ncFICSSV89z68wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQy0ghgM78Rgb05H6AnZElNppxCjfvWjsRiiqlkOpKE=;
 b=d1zadmW3+bSqsJl0uk5LoJd5mtqvPVGDwTCvk0YdTwWC3W9pjnbKzICa/yMnBQ6Z86JU5OKzca6x6erSoBsf2k4OcNyy5TilkkmtabSsgjjDteidHJzYFfZYUHp0iTAklu+LHuIPEDXmnVmRJuSxRljRtiGNS6OdgiMTPVfi7G8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1885.namprd11.prod.outlook.com (2603:10b6:300:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 22:11:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 22:11:13 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <vkoul@kernel.org>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Topic: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Index: AQHYkLmL7CYc+NRsR0eTQHc1KpCiaq1+edOAgAAB/IA=
Date: Thu, 14 Jul 2022 22:11:13 +0000
Message-ID: <e8d235f3-fdf0-891e-1f9f-387c6e6af7da@microchip.com>
References: <mhng-85044754-c361-40bc-a6a2-7082f35930bb@palmer-ri-x1c9>
In-Reply-To: <mhng-85044754-c361-40bc-a6a2-7082f35930bb@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c60ce46f-fd84-4f38-07ca-08da65e5c3f3
x-ms-traffictypediagnostic: MWHPR11MB1885:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cvtS3UJdFisOyswxiflHMROEONeCR+I2T7ESmTQi0K632t83VUfI7sXyihMQfIzhIKmrIAWvi8ElHDu4MzKoJbp8nUZEttwH8TNLOjNUXhO1rXWx9eQh8/7e4vr6So5dyr7DcP3V1KElH4MJK4KWmL18804qANeV6bW0wHSMoGMudaFmZUoWOsa3YR3jGAgIzOAMV+Ephx0W4XCV835Qf3iJ27R9xmU0OAqsx6SxnFST0BBx9psa+v3qBhXpsZ55l8LHfF1iaKtCx/N6GtHlBeNvniW+U8z3IHeWNdLQpRgH3HliiohiQOdbOX5b6whJuLxnul+mM3ypS/OzrFd/2dnxn9Yemxqpgr6CJgxlu0AVUaKCtCxh23U1vHf2z3q9rXtVBiku97tTrD75kBL9LjkkwyC4AChFaKSj+UsAIIPYV3FdnDeiWskmDlnvmumkXJ3Q8GEnLwNDnDNAInn/YLUkafRKoWQ3hR5w8JPi0mT7F2Mkp25WbM5NN3zKjPuiv81Mc+qTP0FkpntaW6zC/PMonW77YPkJAyJJor/3VKtbsIM1Prh6B0fmoIGZmvpvN2MjkK6RsNPxQ56xqTfC+gkABXg3gqjIE7rrewVyvCA5jGEj688+fBv4xv251aWXtdvAZc9YEcag+cY3RrNPehhXTp2Jje9DOAxY/e0MDHgU/YURyJtRMC7lfy79Ic2SY3HEDhAFxNC4BB7NQdsgQj56OV6L5V5U2i22UL3D0lVlmgZt/f0ilDMMdbjJbAbyP6xfh4vC7BSNOQWa0sHHfk7jDwTMA4EVYk7KDuooQCjmHANaEvEQsRPa5hmPQOr3KnM+x/WGbq97MfBIJX1xRwNI9b48GG9+LsVr8ECA29dFPU6P+aKxgObuWQD1pRr7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(366004)(396003)(39860400002)(136003)(91956017)(64756008)(8676002)(71200400001)(66946007)(66556008)(66476007)(66446008)(76116006)(83380400001)(4326008)(186003)(8936002)(478600001)(7416002)(2616005)(5660300002)(6486002)(86362001)(122000001)(36756003)(2906002)(110136005)(316002)(38100700002)(31696002)(31686004)(54906003)(53546011)(41300700001)(26005)(38070700005)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlV4UXNFdUErRXE5anZhbkRoUUF6encyZnM2QUl5NDlzUHpWREQ4SWVjT0Va?=
 =?utf-8?B?Zk9udEZOM2lxUVphclduQnNVSkk3QUdmS3ZDck9PUnloeDJ1bzExcE9GTnRw?=
 =?utf-8?B?SzRYVkthc05KM0RrV1VzODY1VHhKT2RWVTlBZ3BoMXMzNnBWVDdGMS9na2VP?=
 =?utf-8?B?WUllcEcyR0JjY2cyN012NUZpR2RtSXpGMUFyQ3ZMaVNidjdlVmFVS00yOWcr?=
 =?utf-8?B?M1ZhcTN6MExiQllaVlNUblRmMWtYK2p6ZDk0KzQ0WG9FK1NDYmpCTDB0ejls?=
 =?utf-8?B?WkxRbUloM2VrOU5LNDVYOFd5a09SWDZidGxuRU13MkhORGFYSXZRNk94WlBR?=
 =?utf-8?B?RUJPdkJ1MXNQUkp2L0RxQTNOeXp6UzZOc2tyczZGWjAzRkdYaVZXSUhlRkV0?=
 =?utf-8?B?Vzk4dWxaZUpIYThRQXhnK21ReTFTWms5MVUrNHo0Y3I5dEZaY2JKa2RUTkdT?=
 =?utf-8?B?Zmd4cHlxNVpaeGRsUVdQbldwRk1BbmloRlpaU29iRmhRNHp2dzNrTGFCWmtV?=
 =?utf-8?B?b1NXY3J0cE5UYzBISHAyUnpvazZPVytlUlB1dEFuck5nQ0N0TU9idnViQSs1?=
 =?utf-8?B?VDRONWRNOExIZW53Q2hzd0U3TmdSYlhZdmQxRDFCWUFNMkp3OGxac1lyZFBD?=
 =?utf-8?B?ZmpUeVZTUk5xMFhsSDJXN0pnbDh0Vzg4MHRJNFhoVjhBKzVPb3k4THRnM0h2?=
 =?utf-8?B?SHhZa3c2bXcvRnZaaC9Kd093S2NUOVJMMG16RytpYk96SjZRN24reWVOQW5Z?=
 =?utf-8?B?ZGx1cEdMSmxsYTBkVDFlNDVKMGE2cmpnTWgrQUhBOEcrZVBQaUN6b3ZvenJR?=
 =?utf-8?B?cFowdkRnclQwY2dLTUplZE9PbXB6VVdmOGo0anhmckU1SHQyRk5WQUxnZnVu?=
 =?utf-8?B?dllrUzEyUzNmZkpvMTVUVmtzdllmSFZPQllqV2pXUEluOWNDUkNtUUg0S3Ry?=
 =?utf-8?B?eXJ6aU0xTUlsU29tdWFjazV0RDI5NjlnTmZMUXZ1N3FhQlJHRUVtS1h2WWpI?=
 =?utf-8?B?U3cyRzVaTE9kZWRrQWF5NGNrU0xESUZkdHVjZWc1aXpqWk1tMEpoZGh6TjR3?=
 =?utf-8?B?UnI0OG9WSGlqSXZDYkV5N0N2K3dqUEs2anlXMGFQeWFNWlI0OU5KYnkyQWVT?=
 =?utf-8?B?a29sRmZ1Yyt2L0JWT1RLSkRxZ0hKamNuZGU1SUdyQWM0M2JjeFNIZEtEQlo1?=
 =?utf-8?B?MGRmcTVQcmtqNUozTnRRbWlsYkMzTGZyRXpiNGswaGt3NWcveVBzdU00MDJz?=
 =?utf-8?B?OHphZjBFZ2lWcTFxVys0a3NxWmtLM1h2bzR4Nm1ZazBVZEtwbmRJOHZNOTcw?=
 =?utf-8?B?K2QvWi9tVk15ekY5eFpGa0Nmb3BlcTVoNE8weDVtYkVuRVhxVFFmSFdITndB?=
 =?utf-8?B?NExreTR4bHJKQWtTZDQxMkQxMUJmQlRRM1FjeXFITHNOWTdXY2dvYnJlTXFH?=
 =?utf-8?B?eHRQVTdkZGFNWU55Q3NoVDMwZm1haDFNY0ZqZTJNdW9QQ3V3aGRMMGVqSlc4?=
 =?utf-8?B?cFFRcjVHa1kyblNWZzBwSWJKYzZiRDg4cTRiblJ6dC8yRnlJOENZL2tkd0pq?=
 =?utf-8?B?a2dHa1lWUThLb0dlWEpOWmFoY1NhemFRR21VNUZMZnlDRkR3ZytmR0UzS3Iw?=
 =?utf-8?B?YnhPb3JsQnd4Z0NzbDNKWE5KSStqSWF6Wmh0YjRidDhYRCtQVVVObE9Ld3Fh?=
 =?utf-8?B?YUZ3WWx2SjVFZWlOeEMxZ1VBaTJQNUdPcEo5Nlp1K2dWcEwzeXBsWTlwV0Zr?=
 =?utf-8?B?dFlqZFdmOGt1a09KeERncU1DQUJDanFqY3Z2eXV2NWU4WjBHTHNPZEFtNjl3?=
 =?utf-8?B?SVpQU1huV0dtdWJDTUp1YmJLWm1yRldJRXZnSEVZRHBQdnpkZjZ3M0FtOVRZ?=
 =?utf-8?B?UHRXenorYlNEZDRObkI4c2FlYWlGSDJ6Z1drb1FCMks0UjJYS3ZIZnNoV3NP?=
 =?utf-8?B?bE52c2g3dkxuU0VGT0p2bXdWSmdNN2xnSkhyZWxYL1BCRmZYdjNManpqYWxV?=
 =?utf-8?B?R25RSkM0enBhRjNOTFJCS0grbVZRK2tMQ0Y5cUZJbzdUUFdGaDd2eDF0azlT?=
 =?utf-8?B?eEEvMVgyWWlZTUdLVkp3Q0gxNVd6VkFZQlR1T1ZUTVRsRDVMeU1nVEQ1THJY?=
 =?utf-8?B?MGtxK1FCMDk2Qm1IZmVlUHdhN0VCS2hJUWZyU25NZ21sdXhUOEFXNW1ZSm9r?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69157D8767F61B488D414F307E7D8861@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60ce46f-fd84-4f38-07ca-08da65e5c3f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 22:11:13.5278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQSdiKh6fNqd0Q8ivWC7TjscDCPZICmk+aszQZitrgEM5NLlkswLgDhS6qhooGM03DC/Fs7zmUw07vo+8lioHuWAwEk/uAPEApehvBhDjRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1885
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
Cc: niklas.cassel@wdc.com, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 airlied@linux.ie, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 Conor.Dooley@microchip.com, thierry.reding@gmail.com, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com,
 dmaengine@vger.kernel.org, linux-riscv@lists.infradead.org,
 Eugeniy.Paltsev@synopsys.com, damien.lemoal@opensource.wdc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDE0LzA3LzIwMjIgMjM6MDQsIFBhbG1lciBEYWJiZWx0IHdyb3RlOg0KPiBPbiBUdWUs
IDA1IEp1bCAyMDIyIDE0OjUyOjAxIFBEVCAoLTA3MDApLCBtYWlsQGNvbmNodW9kLmllIHdyb3Rl
Og0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+
DQo+PiBIZXkgYWxsLA0KPj4gVGhpcyBzZXJpZXMgc2hvdWxkIHJpZCB1cyBvZiBkdGJzX2NoZWNr
IGVycm9ycyBmb3IgdGhlIFJJU0MtViBDYW5hYW4gazIxMA0KPj4gYmFzZWQgYm9hcmRzLiBUbyBt
YWtlIGtlZXBpbmcgaXQgdGhhdCB3YXkgYSBsaXR0bGUgZWFzaWVyLCBJIGNoYW5nZWQgdGhlDQo+
PiBDYW5hYW4gZGV2aWNldHJlZSBNYWtlZmlsZSBzbyB0aGF0IGl0IHdvdWxkIGJ1aWxkIGFsbCBv
ZiB0aGUgZGV2aWNldHJlZXMNCj4+IGluIHRoZSBkaXJlY3RvcnkgaWYgU09DX0NBTkFBTi4NCj4+
DQo+PiBJICpETyBOT1QqIGhhdmUgYW55IENhbmFhbiBoYXJkd2FyZSBzbyBJIGhhdmUgbm90IHRl
c3RlZCBhbnkgb2YgdGhpcyBpbg0KPj4gYWN0aW9uLiBTaW5jZSBJIHNlbnQgdjEsIEkgdHJpZWQg
dG8gYnV5IHNvbWUgc2luY2UgaXQncyBjaGVhcCAtIGJ1dCBjb3VsZA0KPj4gb3V0IG9mIHRoZSBs
aW1pdGVkIHN0b2NraXN0cyBub25lIHNlZW1lZCB0byB3YW50IHRvIGRlbGl2ZXIgdG8gSXJlbGFu
ZCA6KA0KPj4gSSBiYXNlZCB0aGUgc2VyaWVzIG9uIG5leHQtMjAyMjA2MTcuDQo+Pg0KPj4gVGhh
bmtzLA0KPj4gQ29ub3IuDQo+Pg0KPj4gQ2hhbmdlcyBzaW5jZSB2NDoNCj4+IC0gYWRkIFJvYidz
IHRhZ3MgZnJvbSB2Mw0KPj4gLSBzcmFtOiByZXBocmFzZSB0aGUgYmluZGluZyBkZXNjcmlwdGlv
bg0KPj4gLSBBU29DOiBkcm9wcGVkIHRoZSBhcHBsaWVkIGJpbmRpbmcNCj4+DQo+PiBDaGFuZ2Vz
IHNpbmNlIHYzOg0KPj4gLSBkdHM6IGRyb3AgdGhlIGJvZ3VzICJyZWdzIiBwcm9wZXJ0eSBwb2lu
dGVkIG91dCBieSBOaWtsYXMNCj4+IC0gZG1hL3RpbWVyOiBhZGQgU2VyZ2UncyByZXZpZXdzIChh
bmQgZXhwYW5kIG9uIHRoZSBkbWEgaW50ZXJydXB0DQo+PiDCoCBkZXNjcmlwdGlvbikNCj4+IC0g
ZHRzOiBhZGQgTmlrbGFzJyBULWIgd2hlcmUgSSBmZWx0IGl0IHdhcyBzdWl0YWJsZS4gbG1rIGlm
IHlvdSB0aGluayBpdA0KPj4gwqAgYXBwbGllcyBtb3JlIGJyb2FkbHkNCj4+IC0gc3BpOiBkcm9w
IHRoZSBhcHBsaWVkIHNwaSBkdC1iaW5kaW5nIGNoYW5nZS4gVGhhbmtzIE1hcmsuDQo+Pg0KPj4g
Q2hhbmdlcyBzaW5jZSB2MjoNCj4+IC0gaTJzOiBhZGRlZCBjbG9ja3MgbWF4SXRlbXMNCj4+IC0g
ZG1hOiB1bmNvbmRpdGlvbmFsbHkgZXh0ZW5kZWQgdGhlIGludGVycnVwdHMgJiBkcm9wcGVkIGNh
bmFhbg0KPj4gwqAgY29tcGF0aWJsZQ0KPj4gLSB0aW1lcjogYXMgcGVyIFNlcmdleSwgc3BsaXQg
dGhlIHRpbWVyIGR0cyBub2RlcyBpbiAyICYgZHJvcCB0aGUNCj4+IMKgIGJpbmRpbmcgcGF0Y2gN
Cj4+IC0gaWxpOTM0MTogYWRkIGEgY2FuYWFuIHNwZWNpZmljIGNvbXBhdGlibGUgdG8gdGhlIGJp
bmRpbmcgYW5kIGR0cw0KPj4NCj4+IENoYW5nZXMgc2luY2UgdjE6DQo+PiAtIEkgYWRkZWQgYSBu
ZXcgZHQgbm9kZSAmIGNvbXBhdGlibGUgZm9yIHRoZSBTUkFNIG1lbW9yeSBjb250cm9sbGVyIGR1
ZQ0KPj4gwqAgRGFtaWVuJ3Mgd2lzaCB0byBwcmVzZXJ2ZSB0aGUgaW50ZXItb3Agd2l0aCBVLUJv
b3QuDQo+PiAtIFRoZSBkdy1hcGItc3NpIGJpbmRpbmcgbm93IHVzZXMgdGhlIGRlZmF1bHQgcngv
dHggd2lkdGhzDQo+PiAtIEEgbmV3IHBhdGNoIGZpeGVzIGJ1cyB7cmFuZ2VzLHJlZ30gd2Fybmlu
Z3MNCj4+IC0gUmVhcnJhbmdlZCB0aGUgcGF0Y2hlcyBpbiBhIHNsaWdodGx5IG1vcmUgbG9naWNh
bCBvcmRlcg0KPj4NCj4+IENvbm9yIERvb2xleSAoMTMpOg0KPj4gwqAgZHQtYmluZGluZ3M6IGRp
c3BsYXk6IGNvbnZlcnQgaWxpdGVrLGlsaTkzNDEudHh0IHRvIGR0LXNjaGVtYQ0KPj4gwqAgZHQt
YmluZGluZ3M6IGRpc3BsYXk6IGlsaTkzNDE6IGRvY3VtZW50IGNhbmFhbiBrZDIzMydzIGxjZA0K
Pj4gwqAgZHQtYmluZGluZ3M6IGRtYTogZHctYXhpLWRtYWM6IGV4dGVuZCB0aGUgbnVtYmVyIG9m
IGludGVycnVwdHMNCj4+IMKgIGR0LWJpbmRpbmdzOiBtZW1vcnktY29udHJvbGxlcnM6IGFkZCBj
YW5hYW4gazIxMCBzcmFtIGNvbnRyb2xsZXINCj4+IMKgIHJpc2N2OiBkdHM6IGNhbmFhbjogZml4
IHRoZSBrMjEwJ3MgbWVtb3J5IG5vZGUNCj4+IMKgIHJpc2N2OiBkdHM6IGNhbmFhbjogZml4IHRo
ZSBrMjEwJ3MgdGltZXIgbm9kZXMNCj4+IMKgIHJpc2N2OiBkdHM6IGNhbmFhbjogZml4IG1tYyBu
b2RlIG5hbWVzDQo+PiDCoCByaXNjdjogZHRzOiBjYW5hYW46IGZpeCBrZDIzMyBkaXNwbGF5IHNw
aSBmcmVxdWVuY3kNCj4+IMKgIHJpc2N2OiBkdHM6IGNhbmFhbjogdXNlIGN1c3RvbSBjb21wYXRp
YmxlIGZvciBrMjEwIGkycw0KPj4gwqAgcmlzY3Y6IGR0czogY2FuYWFuOiByZW1vdmUgc3BpLW1h
eC1mcmVxdWVuY3kgZnJvbSBjb250cm9sbGVycw0KPj4gwqAgcmlzY3Y6IGR0czogY2FuYWFuOiBm
aXggYnVzIHtyYW5nZXMscmVnfSB3YXJuaW5ncw0KPj4gwqAgcmlzY3Y6IGR0czogY2FuYWFuOiBh
ZGQgc3BlY2lmaWMgY29tcGF0aWJsZSBmb3Iga2QyMzMncyBMQ0QNCj4+IMKgIHJpc2N2OiBkdHM6
IGNhbmFhbjogYnVpbGQgYWxsIGRldmljZXRyZXNzIGlmIFNPQ19DQU5BQU4NCj4+DQo+PiDCoC4u
Li9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5MzQxLnR4dMKgwqDCoMKgwqDCoCB8IDI3IC0t
LS0tLS0NCj4+IMKgLi4uL2Rpc3BsYXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEueWFtbMKgwqDCoMKg
wqDCoMKgwqAgfCA0OSArKysrKysrKystLS0tDQo+PiDCoC4uLi9iaW5kaW5ncy9kbWEvc25wcyxk
dy1heGktZG1hYy55YW1swqDCoMKgwqDCoMKgwqAgfMKgIDcgKy0NCj4+IMKgLi4uL21lbW9yeS1j
b250cm9sbGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWzCoCB8IDUyICsrKysrKysrKysrKysNCj4+
IMKgYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDEwICsrLQ0KPj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9jYW5hYW5fa2QyMzMu
ZHRzwqDCoCB8wqAgNiArLQ0KPj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0
c2nCoMKgwqDCoMKgwqDCoMKgwqAgfCA3MyArKysrKysrKysrKysrLS0tLS0tDQo+PiDCoC4uLi9y
aXNjdi9ib290L2R0cy9jYW5hYW4vc2lwZWVkX21haXhfYml0LmR0cyB8wqAgMiArLQ0KPj4gwqAu
Li4vYm9vdC9kdHMvY2FuYWFuL3NpcGVlZF9tYWl4X2RvY2suZHRzwqDCoMKgwqDCoCB8wqAgMiAr
LQ0KPj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9zaXBlZWRfbWFpeF9nby5kdHMgfMKg
IDIgKy0NCj4+IMKgLi4uL2Jvb3QvZHRzL2NhbmFhbi9zaXBlZWRfbWFpeGR1aW5vLmR0c8KgwqDC
oMKgwqAgfMKgIDIgKy0NCj4+IMKgMTEgZmlsZXMgY2hhbmdlZCwgMTU5IGluc2VydGlvbnMoKyks
IDczIGRlbGV0aW9ucygtKQ0KPj4gwqBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaWxpdGVrLGlsaTkzNDEudHh0DQo+PiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzL2NhbmFhbixrMjEwLXNyYW0ueWFtbA0KPiANCj4gSSdtIHRyeWluZyB0byBzb3J0
IG91dCBob3cgdG8gbWVyZ2UgdGhpcyBvbmUuwqAgSSdtIG5vdCBvcHBvc2VkIHRvIHRha2luZyBp
dCB0aHJvdWdoIHRoZSBSSVNDLVYgdHJlZSBhcyBSb2IncyByZXZpZXdlZC9hY2tlZCB0aGUgYmlu
ZGluZ3MsIGJ1dCBqdXN0IGZpZ3VyZWQgSSdkIHNheSBzb21ldGhpbmcgYmVmb3JlIHB1dHRpbmcg
YW55dGhpbmcgb24gZm9yLW5leHQgdG8gdHJ5IGFuZCBtaW5pbWl6ZSBjb25mdXNpb24uDQo+IA0K
PiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGl0J3MganVzdCBwYXRjaCAzIHRoYXQncyBi
ZWVuIHRha2VuIHNvIGZhciwgdmlhIFZpbm9kJ3MgdHJlZS7CoCBJJ3ZlIGRyb3BwZWQgdGhhdCBv
bmUgYW5kIHB1dCB0aGUgcmVzdCBvbiBwYWxtZXIvcmlzY3YtY2FuYWFuX2R0X3NjaGVtYSwgaWYg
dGhhdCBsb29rcyBnb29kIHRoZW4gSSdsbCB0YWtlIGl0IGludG8gcmlzY3YvZm9yLW5leHQgd2hl
biB0aGlzIGxvb3BzIGJhY2sgdG8gdGhlIHRvcCBvZiBteSBxdWV1ZS4NCj4gDQo+IFRoYW5rcyEN
Cg0KUGF0Y2hlcyAxICYgMiBuZXZlciBnb3QgcmV2aWV3IGZyb20gdGhlIERSTSBzaWRlIGFuZCBw
YXRjaCAxMg0KZGVwZW5kcyBvbiB0aG9zZS4gSWYgaXQgY29tZXMgdG8gaXQsIHlvdSBjb3VsZCBk
cm9wIHRob3NlIHRocmVlDQooYW5kIHBhdGNoIDMgdGhhdCBWaW5vZCB0b29rKS4gVGhlIG9ubHkg
b3RoZXIgb25lIGlzIHBhdGNoIDQsDQp3aGljaCBoYXMgS3J6eXN6dG9mJ3MgYWNrIGFzIG1lbW9y
eS1jb250cm9sbGVyIG1haW50YWluZXIsIHNvDQp0aGF0IG9uZSBzaG91bGQgYmUgb2theS4NClRo
YW5rcywNCkNvbm9yLg0KDQo=
