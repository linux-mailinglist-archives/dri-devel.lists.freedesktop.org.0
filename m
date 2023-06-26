Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7CD73E097
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B770110E200;
	Mon, 26 Jun 2023 13:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F2D10E200
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:25:49 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35Q9Ku9v025544; Mon, 26 Jun 2023 14:25:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=UjB1BWmBFRSftBwsZe25fouIIXNLYF3zRVJkWbgsbwI=; b=
 iw59/otteQdR1ClnGD42XlbIU+h8LEEoXod+TXX0T+TMxhZo+62uKL0OPdpGpiSH
 sOIUSAj5SDaDww53Bi/tW2C8mXUX2uYq0eSoVgDHApmXPcN5LJwMA8cd8rPx30z8
 apI8s0cGJtKDrbZCqEcEhb5RE7nFtbeOFgSgPlidhNs/KAvs0e4OL1tbt/K9RGH7
 Rs3puvbKFeaUrkj+04pQR6cLpez20Uii53ajO8NnqxkzUOL6Bb62YWOZm4qi77ki
 YAa8WAESDZnw3M/vrLqR2OrT8YxcEOOsV1CcMjBA9bqcCtDg2BtXKZeAKlVMYUMg
 rJEhJTxr09RUF7+icmh6Jg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rdqngsj5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jun 2023 14:25:38 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 26 Jun 2023 14:25:37 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 14:25:37 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdQUmK+1VtOhEbg25ge5dMjyfFsic7r3Lnp8ReaojWlNHkGTaUd8AOa5YWtylxrJZO/QwnqXVUDJniimsj2rhyIx7lyVFjpGzoTnBkgd0k22KDZ/n3ADbFN6nHHvPnK5SuiDpqkjHiiv6lHy9dt2VffIZQ86ca6jzJGad22BXX4Mpj3VWKf+OCbdPO72wAJlb3NEGsvGt8vmnDTV0IWRhXkGbziURaI0ecll+fC08QDckynxelbu9TzblxspGr0xW2/vU+wvg5h1DNn9JC48yUyvj5/6VYtTr2HB91zpmo9UvNwSghZhb/FC5IVyhThp0KvDvzzxbz9/CZV7gm/W5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjB1BWmBFRSftBwsZe25fouIIXNLYF3zRVJkWbgsbwI=;
 b=N1moUnt02j8f7db4Kp7rLf5TKxQ4UaEjwNmNgQXvDaOjvcoq/ONmCIqdhqRDxAPDLRKqee1TZX4X6It+YJDk+d6CAOvN4U1xRx59U9/RFtGoVByGB0r0v0CdmuY4wp6NthGcmMAZzACs0CeKecc8Uu4adoFZQHDnSuq77tn7fJjj6eWhn2l11Jqy1tdrqBi/a93HgTlUGeUig6RSYNKdzX/l7X+q5tRiA+74LHKzpRFXqflteRFHxuDowJB1qPBxLTyJpz0Mx2MkLJo4L6HZIgMHVd8LfmXKrqXwBKo4bvbmpxiy2RrA1YQDwURTFLlqZq8EZ66LxhVBclTWZXL5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjB1BWmBFRSftBwsZe25fouIIXNLYF3zRVJkWbgsbwI=;
 b=ar3yeXXUdMGmSM8IpYIBqjBNs/LZSit4H3DfvDCuSKB55Ae3kqAugJbKCWg7V7lrgEXux+uvI5Y+9RumNlCrxedksbkTS7Cc4R6BySVNvOzNPFi9iH+xtPjlrViM717wMg4ABz+MHghCTwL0efeLtVXavaxmy/WCWJOc5iOTCEc=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB2210.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 13:25:36 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 13:25:36 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: Sarah Walker <Sarah.Walker@imgtec.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 01/17] sizes.h: Add entries between 32G and 64T
Thread-Topic: [PATCH v3 01/17] sizes.h: Add entries between 32G and 64T
Thread-Index: AQHZngYUblpdNXsAH0asudz7MAoJI6+NWwuAgA/MSgA=
Date: Mon, 26 Jun 2023 13:25:36 +0000
Message-ID: <22c75370c7a7a85b870c20bf080b08525e356252.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-2-sarah.walker@imgtec.com>
 <CACRpkdZV1d29qCkS=RFQAAeGckz=kp56mKauBW8grqaXGX2o6g@mail.gmail.com>
In-Reply-To: <CACRpkdZV1d29qCkS=RFQAAeGckz=kp56mKauBW8grqaXGX2o6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB2210:EE_
x-ms-office365-filtering-correlation-id: ca40acd8-70be-48ba-051e-08db7648d3da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5kc/RZHFyrDpwoGfI1WFmqavDxR5s+0egYdkFy2tZ0X+oWQ0TKlYbprV8wM2D3o18Gc3857pk9FRCYMIA+Pzvxet9DpgWxfdDxPQjokYfCA0cCnwFzUhbCeighDwJ6p9Ho3YCNmnoq2dcCShxfpgra5xQgLDVKqabdvOWWw1ZqQXp58icGS930Ur52e3SJzUOkRvPUNiFiT3lYFXbntYM70CwhmU20nMlZpXTwp/fZ0P3LNZXsFqXCcspOIOVllpjKNJLXzSAB6dp3cRvvCQDJxRJjklilESzV8mJ/Vd3gfQ8Gx32BT2B5vixiRLGeozDY9Q8W0vvrYY34yzGcjSXyCnhrJ5YwqvYRhjLtjje5Lhtu8G4pnrlmOi21esiEb2L+R3t2iq7T3/3segEOJvbXm6xHK8RxJcEM9LMiNWlOxiZceZeCKFl5OpdUas0UE80DawUafRYAprJ7tbpdOqrM21frJtFjdm4YyW5PSJENFJbGZUExvz+NK973D3bP846TboeggAnrXLrfN/YF2XHRG3YCb6tf3ugdI8N5fNN2+QZY7otGG8onaqVFQ5L/jLmwq0DbXzdwzhOgxkvDKYPqHroDgsXsQ1p+BcqvS2/NQ0UoD+keoAjS2+ArYFQDsW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39850400004)(366004)(396003)(136003)(451199021)(66446008)(2906002)(6486002)(478600001)(71200400001)(110136005)(54906003)(2616005)(26005)(6512007)(53546011)(6506007)(186003)(5660300002)(36756003)(558084003)(38100700002)(122000001)(76116006)(316002)(4326008)(66946007)(8936002)(8676002)(41300700001)(86362001)(64756008)(38070700005)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGo3bG5ROWY1bEF2RVVDcDlRaFlQWXB3Umh6Mnl5YjJRUzQzaGFaaGU4aHkw?=
 =?utf-8?B?UVhHbVNncjlLZ09IT3BkalRXUmIvRkNwd3U4UWU3YlVEckJQb0lmcXdhOHEv?=
 =?utf-8?B?TkdLVGtlT2dYUXJOaVFHbGRXeFdJZURjMEZ1MEpmbVlvMmZYd3RxQittUmFj?=
 =?utf-8?B?TVltL1h1V0RyaVlRajFvb3ZyREtrZzRINngyVVVjTHJYVEdlQjZrR3QzVUxO?=
 =?utf-8?B?eFNZdUZJNzIwbnV5KzhkQzIydm9JYUpydDRKbWZJbjJjSXVJVDZUQ1RxMDZh?=
 =?utf-8?B?QldYS1FHQXJFbUErQzg2SkI3V2dYM0VVVW9qWDNuOFhCNHRuWUZzWVdMdzU4?=
 =?utf-8?B?VGpSS29HNkdmdVJUdkhkUkFtS25KV09tNmtodGZwL0k4V2VpMlgxMnJGL2Jy?=
 =?utf-8?B?UkxUSWVGZ01RaEM2WmUxRVRzOGhjNDI5TWZsai9Edk1IMkxtaDlhK0ZLVm1P?=
 =?utf-8?B?cnAzY0dNRk5BeVY1QmM3RW13ZnovK2dDUUFPUVY3a3kvUlplblRSV3BXYUl3?=
 =?utf-8?B?VXVQSUNOYm0xbFR0L1hwem8xOW5wRmJHdCtJZmNIdzJiV1VSdE9RcHZEN3Ey?=
 =?utf-8?B?RXNiRmlWWTc0TFAvSGRDMFJwOEczNHpqOEtGdDNOOVJpY0VUSkZGWWlhcjRi?=
 =?utf-8?B?N3NYNEFvb3RZTnNqWHc0ZUY1RWR6SkIwTC9yNnF0LzIrem9pTnZoZEhNY1JN?=
 =?utf-8?B?UEY5c0lOM0Y1bGtXUE13ZFFHVjJGK3pYZTFOcXJLaVJGRXlVRlhiVjRqYi9J?=
 =?utf-8?B?OXlIdFJsMGxHRnE0TGtxbE05ay92NXVZUzJ5dGdsRVU3dTQyZDRmMCtlRy9V?=
 =?utf-8?B?K2pQRUMyUVBpVkswWHI5dUJ2RnhhcU05RXlsMkhBRENqem5DeG9tUlU3UG5k?=
 =?utf-8?B?eVE1aWtkQ01UUzhCR1lnNkFBUkVKMDMvU0FUOW5wRFVBOVlwT0FGbnZqK2Fo?=
 =?utf-8?B?REM4bitybHBmcHhJdDA2NTQ3OGxuQkFETHcvQ2N2RGw0ZmZOVnQxSExoYThv?=
 =?utf-8?B?c0dOQnloN2Q3Ni83QnM1bmEyT0FBclhVbENkY1RjVFUwSkIycG85SE9hOUIv?=
 =?utf-8?B?MU5yaCs1Y3ZKeWVyaVl1MHhXY08xYTZRZmpnVjBqWWNPSFVBY0dRejJ4eGMy?=
 =?utf-8?B?MGxBeTdjb2M2Mlp4bklCOFRJYjNnU2o0bkxOVGQ0NElKRWtKYml2Rlhld05j?=
 =?utf-8?B?eS9IYWdoczBkVDRDZkdWN0NIUklOUElYREdWVW55UVl3Nm10N3NaWkFmMXpi?=
 =?utf-8?B?YkpUaXVIR3gvbzZ6a1drWDF5eGxxVjYvVDY4Ti9EUTlhdHlZdjFxcTBXSWZR?=
 =?utf-8?B?SjF5dWNTWDNqWGlYRWZIYVVxUmVTdFJwTjRGWlVJRFNZR0s0U0VoaWhDNzVV?=
 =?utf-8?B?ZnE4QUM3am5uMEJzdUlrMTRWOTZ5UktUU0hOOW14MjJiOE1pczFzYzMySWRo?=
 =?utf-8?B?Y3VadjJoN21zTWpXNWRCVGRSeFlLWk9COGNvUVhWM3ZKcTVRNHZKSTVaU0dD?=
 =?utf-8?B?YnpzUndxTmVhSi9IZzBDWWRUQURHL1ZYU3JCNElEWklKRENoSEVuY3JueVFB?=
 =?utf-8?B?cGxGWFg5RkhyUkxBdTBXdmFReFd6LzZqUVJFTWR4SnVKT1dGaUpWdncyblI0?=
 =?utf-8?B?RFMxenUxVnpacElnNm45M2hhWTRhWlFDZXNsSXhVV01NN0VGYUJyeEtvVmJC?=
 =?utf-8?B?Z2ZabzZWdlYvaXJpQ0VRUDFheVNZYytVN2xabjlaakIvNW9GSEZ3VHpxMlFo?=
 =?utf-8?B?S0NGaHZONnpZR3NZTW0yeFdGbTlSd0cwdXB4eFF5SHdUMW9teGl5TzkyM1dX?=
 =?utf-8?B?alJYYkEvVURSc1BTSHlyQXJ1Z1ZUT3Nhc2p1cmRNQVJQTFl5dFBjbDRSRkY0?=
 =?utf-8?B?RHVoejM4aENvbk1Scy9rR0RYWGlGUG1DMlFBa3lSRnRIQkNsZGZIai9icHRV?=
 =?utf-8?B?ZytnVk52R0FmTGduY3ptL011TnRxRUNxeFF5bTRsVzFoMlRJVVN1L3RGMWdk?=
 =?utf-8?B?UllrSjNrVlZ6ZFExb3M5MWtPU2dtR1EzV3Z6TWFMY01vU1lJclhwbk1wcjhQ?=
 =?utf-8?B?SjlaUFgwaFNLNFVkemFVQXcrNEJ3emJVdU5WNGU4OTVVanBDZDRGR3JnWmRV?=
 =?utf-8?B?TjUwWGxEb3dNamVFM0w5Y2VuK2x2K3RaWXBJRk9Oc1grUi9CakZubk9lSWpa?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B59D15995A24CB42ACC31B70DD073C7A@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca40acd8-70be-48ba-051e-08db7648d3da
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 13:25:36.7032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjeUEqmsOD9LxyHlNwe6326xy8ZVDrPzwrSvdhLxk1GcbJrqsnfEQsxL9/xxGU3UIZ5rSyWCZQNj5h5Nst5t9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2210
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: RsNIH5lBIbFlbs7PadQgsvEMCQYnGWQC
X-Proofpoint-ORIG-GUID: RsNIH5lBIbFlbs7PadQgsvEMCQYnGWQC
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsDQoNCk9uIEZyaSwgMjAyMy0wNi0xNiBhdCAxNDoxMCArMDIwMCwgTGludXMgV2Fs
bGVpaiB3cm90ZToNCj4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgNToyMOKAr1BNIFNhcmFoIFdh
bGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+IHdyb3RlOg0KPiANCj4gPiBGcm9tOiBNYXR0
IENvc3RlciA8bWF0dC5jb3N0ZXJAaW1ndGVjLmNvbT4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0IENvc3RlciA8bWF0dC5jb3N0ZXJAaW1ndGVjLmNvbT4NCj4gDQo+IExvb2tzIHVzZWZ1
bC4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4NCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQ0KDQpGcmFuaw0KDQo+IA0KPiBZb3VycywN
Cj4gTGludXMgV2FsbGVpag0K
