Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98187FD6A1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E1110E53E;
	Wed, 29 Nov 2023 12:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BD910E53F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:21:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT8X16N031795; Wed, 29 Nov 2023 12:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=0zqK8/dKgiSLgD4wd+Rbi71MgDPj7rsQOm5shY/y0Q4=; b=
 hZNarFh7zrtBM7JtA+pYJ8f/2ObiuUvEuNFV3JT0FBy7toUiNV9IvZI3zomCrSHg
 WOZGXiJ2e1Cuj3qEBIAF23wfr84oOodC0TukuV9nVdKlorfV28wV7Exj0XnpMz+8
 nt2PbAlo5zCB4CnXmyNl03ip4/9oZhfYY3kCsqk0q+7jPwNxTIbQoY5Or+fFd43z
 EZZMPPG5jEskUKwdOMDg4xdqVZElTCjpamVIK9bcegrB3KiLQ2SygjPhvcR0/cj3
 J045DuChoARN7abHMUKIQai1AkgQdsnJYcnWJpCZZpA2wQkVjU4TwmiTVAER05dI
 ayln9FLfb3ewMngbOGdc3g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3unvcq8bcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 12:21:25 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 12:21:24 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 29 Nov 2023 12:21:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWF+7XF1VpqdGHztejDYnhJCMcLvJ/yxACGyT0wPk6yt6Jgda2PE0oynj+80QNY9pbzGWUAwvlR4eVGcupb98JEIkwKvdIt7A1Z1jMDxQqtDzQyXrWBnA4+3UWWorvJRwROjUicgPA/9ZnSyIDEbvdHnneMVd8QUNN6adorANQ2C+og8WeTKVeWTBL/26AdNjVAvfVsB5V72sAba9voJaGceudVp/VQ8JnqyZ5coZ1VhZ80jofdxAb5l4XeyXRIk62e7mtdMLuP1Ls+B57TlPPgnryEhYfpumd+3L7JxjoZz5KZ8K1CAca34hkELyjT800ROTQk29rtGgbzOwBix9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zqK8/dKgiSLgD4wd+Rbi71MgDPj7rsQOm5shY/y0Q4=;
 b=gMKVGOEU8S1Uf0a9aEiMAJqaP9FZdzKIHNbwNk2RAyTrD5AkeWpzQXulYCNcH/GkynfjFOLQ48U6z1Thzhr4nGh+LqqfuKoJbjUt2xKhqa+kk4X+PH/gdKOCLkZ9ByW5kRc7IqO5DT6jMABEYL3e2NQTv92Jopi05zwYk800YSsfvgO48bI7rVIEXuZJohfGHJotP/1W7+qstj9ffibuEV+0HVuAUvtmKdDH8TkI9SGAHmIPAtUAtLPC1dTCyLq4c54hECC2aXdYOg12k8AOqiIDCw4B2rMHraQd2RSAwhSHfyv2rNWeHGk3R3e3eiRIB+V3dw5spCRYYzfsszDprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zqK8/dKgiSLgD4wd+Rbi71MgDPj7rsQOm5shY/y0Q4=;
 b=Drny0sdbRTx1yDi33OE8JJ8XGn0RdtDsSGuQhOw8ZuZNKJtpp8ojpX0e2bINJaNb0YI1wRH4eWm5KhubmYhtyx+wYLB+Mn4tRj1pMgEp2gccr7JCBB7izx99E/dXpUV9mmSJJu3ghCl2qLcxs2KXb0R/7wP/sQZOl3QYBoawYhE=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB1996.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 12:21:23 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 12:21:23 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: Frank Binns <Frank.Binns@imgtec.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "arnd@kernel.org" <arnd@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [EXTERNAL] Re: [PATCH 1/2] drm/imagination: avoid
 -Wmissing-prototype warnings
Thread-Topic: [EXTERNAL] Re: [PATCH 1/2] drm/imagination: avoid
 -Wmissing-prototype warnings
Thread-Index: AQHaIriYtZwRtwf+h0e+JwKOlPpznbCRM9eAgAACWACAAAGAAA==
Date: Wed, 29 Nov 2023 12:21:23 +0000
Message-ID: <44f17773ada2be3a08ef2fa5b915f985895989af.camel@imgtec.com>
References: <20231129113825.2961913-1-arnd@kernel.org>
 <f541c6e55705ffb76e51dd906164c1a92bb87af2.camel@imgtec.com>
 <9b9a3ab9-03f6-4c71-b9f3-5349887f3a45@app.fastmail.com>
In-Reply-To: <9b9a3ab9-03f6-4c71-b9f3-5349887f3a45@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LO3P265MB1996:EE_
x-ms-office365-filtering-correlation-id: b1aba11f-8c86-4660-ede6-08dbf0d5b383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B+qIN6UnL1/kOv5c6DdunJyWzZuhHfLQ+jepHfH/8AmlofgsGiFiaFCclBGchEDq0qo0QxinmSBBwR0lpwW4iHvh3UyWOlVASWV8a8pUcOQZBWKRJUb48Mr5NxSlYoymD3u8FESkBOsQl70T6bT2cubkCv9sAL35IVo3qK45Iu/cjmPXhw+/X8RmwE+sXe0AYWFeT4sFDxJRJdRDUPRBauMI0fIvJt5gRjOGeVTXbL2G1rsa2Q5bVrCOx/4TGo26OxYxGw8A+4HWoEuCvgOFeq3qtTHG9CgLiGu6KAYSYTO93ZHtC3K2PLWYiEUhIHBzKHPihg78VId2V77wOLKCzbZo6K7bm5FoM8QnbpJoxcYk1d8UN3YodmcvuihySg32T7kYnZ/jIzX77mMtDVnTmt2X2MW0fM3wcQoR7i/4j5pqzzptbTfCUS7jKYqVf+lUKR2JS/BSDlrFnQea66N5+tJdYiIOHV2vrMmiuVYMyfDJoq3Yjz5NAxtOwAHlPnMydGuX3m2haaCkn9tEUjguYeMnSfkq+6EJCp/BEuqK41eblkA6IyN3mrTBlcSJGF0Na2F9UdPPNBdJI5feDRRghw7BEDq4oa+BRIdt6pDYtozfzXhuR6VAnh2XgunmqKJbi/fXZ5W0KgQooEqg5mXN/2Z2nhUxDMyAeLrWL5lFyWQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39850400004)(346002)(136003)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(86362001)(38100700002)(122000001)(38070700009)(36756003)(6486002)(478600001)(54906003)(66556008)(66446008)(110136005)(66476007)(316002)(64756008)(66946007)(76116006)(91956017)(26005)(71200400001)(2616005)(6506007)(5660300002)(6512007)(4326008)(4001150100001)(7416002)(2906002)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ry9pOHNCeExRSHhJb0pRZFJac3g2SllDUXlpTXAxeDVwU1Z1MXVrR0NqdEM1?=
 =?utf-8?B?bFByaHN4SWxlcEtxZjhJcGExMVR1OVlGOXBRV3VIanVBdmlzd0JDK2JYUFVy?=
 =?utf-8?B?cm1oanNpR3Y3TDdoQUg4RDBxQmJSbkNCTUdPZUhNTmdoTzEzUHM2eFBxQlBp?=
 =?utf-8?B?SU9mcHFtNDZhU09vVTNydHFuZ2UyUEozaTd5cXVmYzZjaXNIVUVzWU9qTzM3?=
 =?utf-8?B?N01yUXptLzhxZVBwYWxRZXd4SC9SSTBwMnVhT3FxbnVRSFRQNXFYTlJtSlNZ?=
 =?utf-8?B?NWI1bUd4K0JwUlZZbHJjTnNUeDRHYUM4dnF1bmk1VXNqenBYMyt3aHgyRDlH?=
 =?utf-8?B?bGJ2QUs5TUMvc1JjWGhlYldJc3NRVWxQaXM0SndmZWJpS0Z5ZW1ibFVRNlFp?=
 =?utf-8?B?Q3prYi9Xa01CU3owOG41dGMwb0dPRTNRcFEwd3FkODdwcVd6RDF2WFhaYlpE?=
 =?utf-8?B?TlhtYnBxS0JFL1ozZjVOMWErY1dNcWhCOUZuQ1J4Z21ZbnBCMExBUlhZQkJr?=
 =?utf-8?B?WTJOTXE1Sk1zS1Z1UnR5d1VNNGZ0TWN4UmxDaS80aGlCeWpsVXFXOS84TnZ1?=
 =?utf-8?B?NHVZam9zazRJVk5Sc0JuREo5d1BPVERQczNNMWV4Ti95SzNDL1ZtaVFqbmxD?=
 =?utf-8?B?MXI1N1g5NWJvMjlUWGk4Yy9PUnJLR3A0TWFpbGJGRWlwTTgvcWJpZXIzUE45?=
 =?utf-8?B?WmZwRjMzUER1bkJGaWp2VHJyL3ZTZXV2NExnYU1VcTJhLzVYZUxvdUpvdytF?=
 =?utf-8?B?MEpDWldYNHRUc3U1Y052U3NTbmczNjE0WGgxWThSRGhhT0JCUGpoWWVwaXBv?=
 =?utf-8?B?eHZkQVYwUTJnUmVzZi9pMGlRMmo0OTJmYkJ2REdPcVJ6dTZOUmdGeDg3NWFo?=
 =?utf-8?B?RUZsb1BqTVFKSjh5dkVseGhmU1FZMjJtdWpIamVwMDZmdEl6UEhIYitJMEVj?=
 =?utf-8?B?ZWQweE0rU01jRnlON080MXZRTWdzQkRzbFlnYU9nYVFOWjhQS0ZkcTdUR1l1?=
 =?utf-8?B?cUhFTXlEcytOLzhYQVpua1NnVC8ycjdxZkFBOHd2Q3lqdzl2T1E5RlhnQzFp?=
 =?utf-8?B?VmFEQys3YnZKcTJDME9ZdzEvVldMbzFFL1BJU1BOZVFFN2FpLzFNMStDdUxD?=
 =?utf-8?B?UDVCdWFDMmNpSGpJanFJTENCSjZpWnQwbzQzYUEzenpQVmR4NFpkdDIvRnJL?=
 =?utf-8?B?ZVgzaGxTZHFpOTRadzZDTGRpMmtUTzZTNTRmMm1vOTk1cWtobW5Fb3c1dWhB?=
 =?utf-8?B?RjhETUlvZ0FRaWhvOHN0V0c2MDYyeGZTYzl0NG5WNHl5eENLLzJ0K0l0aXRr?=
 =?utf-8?B?WjdPdzhqT1pJY21mOC9CU3lwV0JJcitzK0w1NzZkclN6Sk5Bc2ljbzFhTVhq?=
 =?utf-8?B?elJYVHdYdHN2YjAyR0lNY25SVjdWbWZpS3E1eGFKQlVkcno1bW8xNlc2M1Zx?=
 =?utf-8?B?aXZTcUtzNXJEcW5EMG56QjNXbllsa2VTcGR1RzlUQWc4dU01NHRjQ1o3OG93?=
 =?utf-8?B?T05HZ0RteE40MVdGVmlYeTFJWjJvUFoyQlFzTzUvdGJ0UFRyZklYV2wzd3RQ?=
 =?utf-8?B?SnpUYVhXRnRDVUcxTzJFT2JiL0xZUnF3aFlYaC92YlJlMkg5NXZ2aWMwSlBj?=
 =?utf-8?B?WkhET0U5UDR4T05XOXRUYXNEODlnUkduU0JEL0tqcDNuQndIeWlRQWZoTzNr?=
 =?utf-8?B?Rk03OWlhbVRNNG51THZ4WStWa0JEMmdkQ2ZzK0VRbWdYOGR6STgwYTczN1Bs?=
 =?utf-8?B?UDRpd2NYbFNFSnk2UkZEekpRRWYyUS9sdnRMR2Q0QnNIV2RLaTRJRnZvOWJQ?=
 =?utf-8?B?Tk1TdjBKb0Vhc1M0SWhQeUFKSnRkcEZ3Sk9oVnNRUjRXOUc1WHRmbXF6Wllz?=
 =?utf-8?B?a0hCWUlEUXpoTTRYSm5yNWpwZ21IZERtNUxlWlJNS1ZjSDdYVERxWlVIcFZw?=
 =?utf-8?B?eVNnMkFSdWVWNEJ3cnByRExnVW9sc2Y3L2xJclhTNkVsa1hoR1BFVG9UNEZJ?=
 =?utf-8?B?aDhUbUhMMlVHREN0aGdPSkxzY1prblR4SS9KUDh3UEFYM3MrYkRxNlpvam5I?=
 =?utf-8?B?NDBBb25FOFcxT0hJSGQxMjk1K3lHbXkzNkdWWDdVeUtpY0d2aDhFMlg3aFJB?=
 =?utf-8?B?aTJib1p2b2VUS2QyNE02YUhuRjRCYy85UnFjbDIrK2pwNGlyZnVRdThRTnly?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B7A195A47CE634C85B019825B9FE616@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aba11f-8c86-4660-ede6-08dbf0d5b383
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 12:21:23.3232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWR7eyU2iHtG3zhLe9c3K0ELBlJSfZQvoKEfqre0vorOclwIXzndpor1Ko0CqBfIuFv7TDb897wyvYUMKIvbtqLkpl+/eaZXK6jWNHj+U7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1996
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: oTxXtB60sq0Jmtqi8srZ1pzJm0eBqP9N
X-Proofpoint-ORIG-GUID: oTxXtB60sq0Jmtqi8srZ1pzJm0eBqP9N
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTI5IGF0IDEzOjE2ICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiAqKiogQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVzIGZyb20gYSBzb3VyY2Ugbm90IGtu
b3duIHRvIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcy4gVGhpbmsgYmVmb3JlIHlvdSBjbGljayBh
IGxpbmsgb3Igb3BlbiBhbiBhdHRhY2htZW50ICoqKg0KPiANCj4gT24gV2VkLCBOb3YgMjksIDIw
MjMsIGF0IDEzOjA3LCBEb25hbGQgUm9ic29uIHdyb3RlOg0KPiA+IEhlbGxvIEFybmQsDQo+ID4g
DQo+ID4gVGhhbmtzIGZvciB0aGlzLiAgSG93ZXZlciwgSSBmaXhlZCB0aGVzZSBpbiBhIHBhdGNo
IGEgZmV3IG1pbnV0ZXMgDQo+ID4gYmVmb3JlIHlvdSBzZW50DQo+ID4geW91cnMuICBJJ20gbm90
IHN1cmUgd2hhdCBub3JtYWxseSBoYXBwZW5zIGluIHRoZXNlIGNpcmN1bXN0YW5jZXMsIGJ1dCAN
Cj4gPiBhcyBteSBwYXRjaCBoYXMNCj4gPiB0aGUga2VybmVsIHJvYm90IHRhZ3MgYW5kIGEgZmV3
IGFkZGl0aW9uYWwgZml4ZXMsIEkgdGhpbmsgd2Ugc2hvdWxkIA0KPiA+IHByb2JhYmx5IHVzZSB0
aGF0DQo+ID4gb25lLg0KPiANCj4gU3VyZSwgdGhhdCdzIGZpbmUuIElmIHlvdSBkb24ndCBtaW5k
IHJlYmFzaW5nLCBqdXN0IGFkZCBhDQo+ICJSZXBvcnRlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4iIGxpbmUgYXMgd2VsbC4NCj4gDQo+IEkgdGVuZCB0byBjcmVhdGUgYSBidWcg
Zml4IGZvciBhbnkgYnVpbGQgcmVncmVzc2lvbnMgSSBzZWUgYXMNCj4gcGFydCBvZiBidWlsZGlu
ZyByYW5kY29uZmlnIGtlcm5lbHMsIGJ1dCBpdCdzIG5vcm1hbCB0aGF0IHRoZQ0KPiBtYWluYWlu
ZXJzIGhhdmUgYWxyZWFkeSBmaXhlZCB0aGUgc2FtZSBidWcgYmVmb3JlIEkgc2VuZCBteQ0KPiBw
YXRjaCwgb3IgdGhhdCB0aGVyZSBpcyBhIGJldHRlciBzb2x1dGlvbiB0aGFuIHdoYXQgSSBjb21l
IHVwDQo+IHdpdGguDQo+IA0KPiAgICAgIEFybmQNCg0KV2lsbCBkbyEgSW4gZmFjdCBNYXhpbWUg
anVzdCB0b2xkIG1lIHRvIHJlc3VibWl0IGFzIGEgc2VyaWVzIGFueXdheS4NCg0KRG9uYWxkDQo=
