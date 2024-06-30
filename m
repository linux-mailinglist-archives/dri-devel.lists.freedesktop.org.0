Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF6691D040
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C89210E1C2;
	Sun, 30 Jun 2024 07:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Hc+HfPoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303710E155
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 07:12:52 +0000 (UTC)
Received: from rly09b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly09b.srv.mailcontrol.com (MailControl) with ESMTP id 45U7Ca6i251287;
 Sun, 30 Jun 2024 08:12:36 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09b.srv.mailcontrol.com (MailControl) id 45U7CFwc248487;
 Sun, 30 Jun 2024 08:12:15 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by rly09b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45U7CDWR247791
 (TLS bits=256 verify=OK); Sun, 30 Jun 2024 08:12:15 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZckfX6nJTadjYo3F5YU95iO/n80Maee3c3octz0M5OBCf4BXNbmxwEjK/6rR2ba2/vnr2KOqWSIxEuefw+oNcBa4EUcGmycv75YlT6i/C9KzgJaepWsBam7UilUieR4P7ciGIu5BE1J8ICBmXxvm49xSVpLqEwed9DUHxLL+L8IQZ7wv92YCg4wrzgakqz7qCsvzILY95FBqYNfICdalHWxmy5qsGXTg6zXUwrciF1LkSODXJ0+G2VuNRXWRL4CGAx7u3UpxCOrtsL1+tIv9oBnWeuZcZ1xTo8I+KB3XrxiHVatT1U1vU12bf5ZkMwaTJ9slDOatD/77mZgc+YigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpcldgp0YO7UHhWa9O9t63c++iPemo2rM5JA6RmkdWI=;
 b=Uviwqz7X03zV4eHPEk4U4xoG5shyc5mF71FE1MSm+DLlM3h25/PeCAphqei8FBNG58f0nWbQRqq+f4TVQ0LgSli5qtUkutNYolxP7qTbTga32G/X54j+thGEBWy11RZyWU5fbc3UMBh7uzaLyTMYUH6l4JBrKcAS0wRQRZ9rLIKMHcyCJzAF3cawRCn/uLVu7gS66v13AINQPyaPVwKqf8xE4dRHEqmi9ZTR0+wdSztdNUj1o8SiriD2kc3z7FEfS4g09BDLh0kGxVtVXjB67A3tfHzpS7FTJP35kr+642rwMMrIj2ru/c+iNcwpyW7HCmkMuQbBBq+ueZhhP1ljXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpcldgp0YO7UHhWa9O9t63c++iPemo2rM5JA6RmkdWI=;
 b=Hc+HfPoK9Nw1MSQw6jfSiNRx+kq4UwRB3mMijSdDnFmaxfFTeTSzZrWFAH4s4qC4aL2wMm/Koxw1XOXwO2E8wdshTnzX1TVl6Jvs49LbgRlxv0hJKPsAnf33GrTw7QMfNZUY2DzAKLZrRnxgSqWC3YUMmNOUQoq0uMM3Nf33lnLOamVBFgMvZ8gWeuMaFPvhcF6Y1hZ9O8ioQLE/a0GZEQK9nbbLSjxqm7in5KnIiI4wFVT6BCuXN5EwCxqWg+zdsAfAtzS+3ujFqD5xF44vIecHs4k0zeu1lltGvGouhcK5lTxQDMod9FOWmxIGlGTQ9BhAfOmspQOPgvpTzFckqg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DB9PR02MB9730.eurprd02.prod.outlook.com (2603:10a6:10:45b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 07:12:00 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7719.022; Sun, 30 Jun 2024
 07:12:00 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHGPFGAgAbik4CAAHs1AIABHDsAgACWKwCABaQfgIAAjKwAgARq4QCAAEMngIAF03CA
Date: Sun, 30 Jun 2024 07:11:59 +0000
Message-ID: <f6d8e9b8-1438-40c3-82f4-ec905ce2a862@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <2c66dc75-b321-4980-955f-7fdcd902b578@lunn.ch>
 <8a534044-ab84-4722-b4e9-4390c2cc6471@habana.ai>
 <f45a71f9-640e-473a-9b80-90a50b087474@lunn.ch>
 <96677540-c288-43f6-9a47-1db79a0880eb@habana.ai>
 <1baf52ff-d3ce-4d3f-9655-46a1a919119b@lunn.ch>
In-Reply-To: <1baf52ff-d3ce-4d3f-9655-46a1a919119b@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DB9PR02MB9730:EE_
x-ms-office365-filtering-correlation-id: 86006d8e-e5e9-494f-09ac-08dc98d3ef48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QXRZOUZUYjFWSWxHcnQxUWtnVXJvdXFoY3VaL1RZOFNwRGp5OXArajYxcFpm?=
 =?utf-8?B?djFodm9TaWtlbVdQbit0dWRLQzJyQmNPWUJORFZPbnZWS244d25BVEd0bmpo?=
 =?utf-8?B?YzhyVnB6OGhVZFFUMSsvQlllN0pZTmlIN2N0MkhGOFN3RThyeW9mQ282RC9L?=
 =?utf-8?B?VFlOdDFZVGg1R2wwUkszcGxjRjQrL3ZZVGVnbnBXRWVTRzRFN2w1S3piMkFp?=
 =?utf-8?B?elo4UjhWSTVWdW1vdGJpU0VHdGZna0Y5cnpJdVhqQ1RmYWxqMzBmK2JuWXd6?=
 =?utf-8?B?ejRTbmViRjA1bXRxTXloUFIyWEJRRzFya2lSeFNXcG95WUx3NDdNM0doaFRF?=
 =?utf-8?B?QUpGa1dSS1h6L2RjU2VJQU8vY0xwTzZaS0x1R1p6OCtiTEgxL3BKN0R2ZGlC?=
 =?utf-8?B?T1gyYTM2Y3VDVGVXOVFLSkN5cDRsdTJuUEtnY0R6cUt3VVl6ay9seDkxTWxO?=
 =?utf-8?B?UGVkcnhXUmdqUTR4TllIbnZieXNlVjFEU1dobVhCSGpBcjVZaUdpSmppS1dt?=
 =?utf-8?B?TFozdUd6Z08xLzR6TWR6N1NPY2ZZUkI2elFyckY4K05lRVY3b0hUT2orV2Nz?=
 =?utf-8?B?amRYL05Ka0lhWVRnNzVCUnltYjA4Q21qL05QYVkydWFXUmtTbGxxTk0razFJ?=
 =?utf-8?B?T3gzVFdKZmsyODlhK1BMWUdVL1dCNURWUUtvM2pBcEExRU5VZmZUU2xCbVVV?=
 =?utf-8?B?S09uQ1QyeFRYODBQdWIyQ0RoYVJ0cWFBblJ0QkpVWU9mTG1Zc09XQ1BGaTFs?=
 =?utf-8?B?TVZsQWIrMjdGRVdGODFWMEVGYjl3eGhENHIyanYzNHAyZWVsZkhsZWtjMjN3?=
 =?utf-8?B?ZVlHVVl0UWNUcmF6NWR2cUQ1M0FtanR0cHpTRll1L0F4S2xWWWgwN0hnQ1F2?=
 =?utf-8?B?OU54anEzenZQQVFUeHAzSzd3V1c2THRuNWx6ajFOYy8xYUlkOHFqRVZ2My9s?=
 =?utf-8?B?MnRGQ3NUK1U4cE1xOHI1UXpoM21DWE5xN2tjZWhuS0Irb0kyd1FOOUxpYklk?=
 =?utf-8?B?RFQ5SHpuMjVFU3I3ZFlUdVNqMnZ1L05SQnVIaHJnd01hbEthWDViV3VrMk1r?=
 =?utf-8?B?ZEY3N0JlNi95UzhRSFVqTGlUT1lMWktEcWxmNEtvRk5CYjVTeHJvNHdRelps?=
 =?utf-8?B?QXI0d3dsWnI0clRsVTQ1ZVZoMEtDMDVwSFZOdUYzR2NJRGVRSDNMZTFIemRY?=
 =?utf-8?B?WHB2WS9WMkxtUWlkUGhKaElHS3JQQmdpYjJOdS9GMWpsYjRJQ0ZhUFI0OGhB?=
 =?utf-8?B?MVppMW9wWnNmU1lIVHpZRGJBZnEyaVJVQ3NuYkFmellGVUJ5MFNiUW4rNVFY?=
 =?utf-8?B?SlozOGM2eUpnU0c2QS9ObGJ1L0lJbTdRV0pqem43WWg1b2NHUUJBaG4zeFBu?=
 =?utf-8?B?enUra0NGaXpydVhhRXlHdmJlZVY0UUpVTm9tOVJ2Q3RQL3FhUVNDYjFDVDhs?=
 =?utf-8?B?elFPYW5uUEphVjNEQXFwTHNvbW56SWQwdjFoNEYxbTdmUk1kdWJtWEV0dGV6?=
 =?utf-8?B?QjMxZ1pEdFY0VGY4NXJSaG85ajM1S0o1NVZKb1hEc000RDJpcDJ1OFJxOFlM?=
 =?utf-8?B?YndObkVxUlVxMHVmTkE5SEtYK2E2ZGpING03M2JCeWJxZ1BVUElLZjBBWTRX?=
 =?utf-8?B?NkQ2cGMrTzhQb2M2THB3Wm9KWnFFbi8wYm9jNEZqU2pEdEllcEZZeUludGp6?=
 =?utf-8?B?elZycEovOG5RbkhCb1FwV0lkSWRTNHNSdll6STlXaHlpNXZGTXhvNnhUd2tS?=
 =?utf-8?B?TWhOVjV2UXdWTFN0MkdQS0tEQStFdmZiajZCVGR4TjU0a05xL2RSZU5lMSt5?=
 =?utf-8?Q?zR2elKvEV4N/d+gbyXlTh6+XjNjEGHmk7wZTg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2owVVFKK1psTEwyMENGQU1zQmlnNWlod3R3REM3UkNmL252dEhMd3hqWWdG?=
 =?utf-8?B?aVI3NmJ4WndhMnhzM3VSWFVMdVN3RHU0K3ZVYlRTOXZNc2YvRVVkVVJNMWpv?=
 =?utf-8?B?a2I0R0hURHN0WUZUYktrV0tVUkFHR3IyRTlZdHFDRTh0a2tTQ200d1czWkRQ?=
 =?utf-8?B?bE1oNkhaYUNHa281elVSSXo0LzJmcVFFcmpmZGdzOUphOSs3b2MrSGRIMTJY?=
 =?utf-8?B?SGxVYmc1Z2JhUFVZZHN2UTA0Y3dVc3lEMDFiekVVZlBkZE5zRitLcVo1UUhJ?=
 =?utf-8?B?Q2hpTTFpM1VscnhZeVhQSXR0M1hqL3M3MUVKcWo0eW1GOXFmUVJhTUlheFJY?=
 =?utf-8?B?aUpRVXI2NitxYlFPbThGTjdrcmJyamZFOTRRd3dpaXJkakIrY0hKY2ZPcXd2?=
 =?utf-8?B?aERVVGE0NGQ3OWpQOWU2cm94SlltV1hKS3kyRjlTaGNLVlI5SzhnSXYvSlhv?=
 =?utf-8?B?S0dxbnA0UHJNRzVoQkhSNzFrQVRqV3I4aUZPejdmQzRLWGRQQ2dLRlJBM2x2?=
 =?utf-8?B?VlNPT2tSc0FEWU1SaEk0L3orS3NJUzJDbWZCUTBuTE1sRVBXQkhlNm0yRUVQ?=
 =?utf-8?B?Wkt3ZGxCVHVnSm5jZDVUQnN1N3puUGIvaFVYaFA1ZEE3aHJxOWJyWCtBeHBP?=
 =?utf-8?B?OXdWS2lPR1hnc0d4Mm51ODhzVlQrMUhzRTZDdkRsaHBnNjU5WTIwSmV5WDZy?=
 =?utf-8?B?YTRJZ003eTlkci90bGhrQjFabVE5dkdibFE1QXFEVkxQaEcycDdjeDEyZ1RZ?=
 =?utf-8?B?VnVWREhBUFluM1R3eUhhbUErQWNrU0Mzd1BQUm5uMzRBTGpEN1JwMVBxZ2Zi?=
 =?utf-8?B?RUVqRjhNS3BZdERPWWwyeHpuSWtST1NwN0NVbnVnUVRQQnhHa21XSi90UW91?=
 =?utf-8?B?eFdqeGxCZlpBcWZqWFVUVmZhejd1TnBxZG5DVHhiQnF5Z0M2Yng3QXB0NWdy?=
 =?utf-8?B?NTZpZGQ3UUZhRUJFUlpUWlh5Q0E3VSt4VHVOcHR0Si9JVHcyV0E3QUF3SXRI?=
 =?utf-8?B?dGxPZjY3LzNiVERNWkRlYiszTVFzcTNnZnJrWmF2M0toU0NBOTEycmp6d3M0?=
 =?utf-8?B?ZENOVllIYUdlRkJXTUhDd0w5M1dBd3QrV0JTZDdWbjh2N0hGOGRiYlRtMW5R?=
 =?utf-8?B?KzZQeVN5ejJwVHNaSzJxYzdwdkswSGtmR1lPUjRFZk9KeTZYTForWE0zSzZi?=
 =?utf-8?B?ZXFBNDc2bjZ3andJQzZINkZSTGFmci96eFdzR3V1ZmNLajJ5RzR4U0JUT05m?=
 =?utf-8?B?UTQyRnF0cjN6NHE4RkFQNlp5TjhRNGcrMmdnckQ0N1JyZjFCUk5JMWQ3eGVx?=
 =?utf-8?B?SGxoTitXTGhUa2d0NTErQndXSHlWMlR6NTFRQVNEZU96RjgyL2UxdDZGUSt5?=
 =?utf-8?B?bjYva3BoR2RnWkxiNnhZVzM3aVBENGlMSUF5ZVZpblpSUUxTVUhPTnhlVEYx?=
 =?utf-8?B?bkc4WHpOVGtTcVBsSzdoL0tNaDlVODczWFhLbFcyNlYyN2l0czdQbjF3UTJo?=
 =?utf-8?B?WjIvZ2NCd0g5QjZUNlN0M1BJZkQySFBMNEV4M2c5WVNHWmF2czZmTjRyUHYw?=
 =?utf-8?B?S1BaTWRScU1ha1RNdWtNdmtYVWFBbStlUktueEtadDN5MFVmM3RXK1lIR0JH?=
 =?utf-8?B?cjBtYjJLdENaZ3IxV1RUcWRyUGVxaXpKZlFVZDhNeVkvSXBmdTE2TnpjYVZl?=
 =?utf-8?B?eFBkWDhpbmk2WFJmSTJuemw3K3ZpRCttWTV6Z1R0Smw4WmJxZTJxMnBFNzE3?=
 =?utf-8?B?TzlQZTlDWVBFR3ZQOXJzNDNIcDVEL3ZiSCsyNmhzK0FieGZ6K29QUmRIdHpx?=
 =?utf-8?B?WE94ZEdQS2FmM3l0c3lDeUw2TlBPWkdqOHE3SXlMTXV3c1FxOEdNQkU1dWVS?=
 =?utf-8?B?UWJhbjY2b3dHaFQ1eDZzL0ZGNS84SzZ1TmJuN1d4RVlFU1o5MFJYazUzVldy?=
 =?utf-8?B?QmhyQk5EV3JQR3NDVVhvZ2tPZ2F4cDdFUUczbXRNdG11a2tERWd1bU9EQys3?=
 =?utf-8?B?OGRDLzFBVGdVY3RxcHBuUzUvMkQ1eWlON3FaMUNqZEcxaGpnN1o2L09CZjI2?=
 =?utf-8?B?dDNGaFJaNkhFdU5CNlNSUXhiQTlOMDArdmErWlZ2Mjg1a3dHMHJ0UU5VZmtE?=
 =?utf-8?Q?bZnsJB18TQ+hByMNnFu/p/BOl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC7B42338DAF0B4E98CE291658E05EDB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LbtU5UElVL8qEi0zkYGRGoIwOUQlm4bJ3mylApMwq4otxL0Hzcqpdv/N61Cy3ylmvlmT4PWCethV4a5kT3/b9NZYzHhBj/tllKqevm997v3Wra6wE2VQXRFf5gHobjC5eAun1+BBqRo2WsQGhmc8gxJCDMYjsDC1D+idOlC49rGHC+GrVkQ2V5ezcpkVfeCvKxny62638mBEbzBH1svnIRCL+q9rb7bMBq4MkmgPewne4IP+TDmB06AoOQxVw50kjadtBN8X4aRKqLi9iaKPJUzMJqJP2brixJcBeu8Fuo3In14lctQq0TxUjurKtTzG6Ngvq8iiKo9E7s7H/8k3b2fwpwoL7NXMu3kMfs6lcdQ0dfJetYe3Ibxpfmcyv6XVDxpy2Pxj2yXvmOgGeX8BEOuQ4w12pCDoFgWFL5EWmDPEqBskgphMaQHbuOKPWtFWt/ZIgUvJtBSBrgM9vYOMJFqC4WzPHSW5aORhyG2ScND+vulkMo4jSqYTPbeLNcRvCVdrt2Hakn0bTkz1dccqNhktHZOVBnKkZwGBpMqFeo1fQhQV91jxcml0TTvdfnFCZ6qy40lxKwBaJfBB6y3sQSq4LEOxTct2msDBK+9F6ZVfSh60rHtTE+0epeRDcDe3
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86006d8e-e5e9-494f-09ac-08dc98d3ef48
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2024 07:11:59.9736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJ+bWcHaOIOxztPc2ldVb4/baBiECtMRKpjkKZiNZ9qG7RXYp48SDVRWLzLPzkByzV1xJFJWjja6y+QV5hAHtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9730
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTczMTU1OTpGUEtleTEucHJpdjpYwEQnT/pVy3M/isz/3EwL6gQDTq3yQ/QQ5Gi8KNRdQKMMVFFDTcdh/DxgZ+b2xNTpv+NMM8ggg3w1o7YrvaLiBMOoE5+MRMrYEbbwRxO6BSQnWH2s50Vp8WEorUbwhQScjWWTwcnJfuyyS4g+NBXNeF9UOMYoPx/RTvwH79xTkIMuU35dekQ5DDzOTIfWid63jdtoW9D4i0OD6ZfpLPN1NAAnDYAWOQSLpcgJxxQBo9XEPrTaPd8UOgcyMLKEPcu2NcwzvOTVSbQGKPGd/WUMODwImsdhgi8i08Oo2s88Sk7DMNqybpYRBxd5G1lPLz+jwZjFm/JTK3sgM2ubbL8D
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.119
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

T24gNi8yNi8yNCAxNzoxMywgQW5kcmV3IEx1bm4gd3JvdGU6DQo+PiBIZXJlIGlzIHRoZSBvdXRw
dXQ6DQo+PiAkIGV0aHRvb2wgZXRoMA0KPj4gU2V0dGluZ3MgZm9yIGV0aDA6DQo+PiAJU3VwcG9y
dGVkIHBvcnRzOiBbIEZJQlJFCSBCYWNrcGxhbmUgXQ0KPj4gCVN1cHBvcnRlZCBsaW5rIG1vZGVz
OiAgIDEwMDAwMGJhc2VLUjQvRnVsbA0KPj4gCSAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAw
MGJhc2VTUjQvRnVsbA0KPj4gCSAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAwMGJhc2VDUjQv
RnVsbA0KPj4gCSAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAwMGJhc2VMUjRfRVI0L0Z1bGwN
Cj4+IAlTdXBwb3J0ZWQgcGF1c2UgZnJhbWUgdXNlOiBTeW1tZXRyaWMNCj4+IAlTdXBwb3J0cyBh
dXRvLW5lZ290aWF0aW9uOiBZZXMNCj4+IAlTdXBwb3J0ZWQgRkVDIG1vZGVzOiBOb3QgcmVwb3J0
ZWQNCj4+IAlBZHZlcnRpc2VkIGxpbmsgbW9kZXM6ICAxMDAwMDBiYXNlS1I0L0Z1bGwNCj4+IAkg
ICAgICAgICAgICAgICAgICAgICAgICAxMDAwMDBiYXNlU1I0L0Z1bGwNCj4+IAkgICAgICAgICAg
ICAgICAgICAgICAgICAxMDAwMDBiYXNlQ1I0L0Z1bGwNCj4+IAkgICAgICAgICAgICAgICAgICAg
ICAgICAxMDAwMDBiYXNlTFI0X0VSNC9GdWxsDQo+PiAJQWR2ZXJ0aXNlZCBwYXVzZSBmcmFtZSB1
c2U6IFN5bW1ldHJpYw0KPj4gCUFkdmVydGlzZWQgYXV0by1uZWdvdGlhdGlvbjogWWVzDQo+PiAJ
QWR2ZXJ0aXNlZCBGRUMgbW9kZXM6IE5vdCByZXBvcnRlZA0KPj4gCUxpbmsgcGFydG5lciBhZHZl
cnRpc2VkIGxpbmsgbW9kZXM6ICBOb3QgcmVwb3J0ZWQNCj4+IAlMaW5rIHBhcnRuZXIgYWR2ZXJ0
aXNlZCBwYXVzZSBmcmFtZSB1c2U6IE5vDQo+PiAJTGluayBwYXJ0bmVyIGFkdmVydGlzZWQgYXV0
by1uZWdvdGlhdGlvbjogWWVzDQo+PiAJTGluayBwYXJ0bmVyIGFkdmVydGlzZWQgRkVDIG1vZGVz
OiBOb3QgcmVwb3J0ZWQNCj4+IAlTcGVlZDogMTAwMDAwTWIvcw0KPj4gCUR1cGxleDogRnVsbA0K
Pj4gCUF1dG8tbmVnb3RpYXRpb246IG9uDQo+Pg0KPj4gVGhlcmUgYXJlIGZldyBwb2ludHMgdG8g
bWVudGlvbjoNCj4+IDEuIFdlIGRvbid0IGFsbG93IHRvIG1vZGlmeSB0aGUgYWR2ZXJ0aXNlZCBs
aW5rIG1vZGVzIHNvIGJ5IGRlZmluaXRpb24gdGhlDQo+PiAgICBhZHZlcnRpc2VkIG9uZXMgYXJl
IGEgY29weSBvZiB0aGUgc3VwcG9ydGVkIG9uZXMuDQo+IA0KPiBTbyB0aGVyZSBpcyBubyB3YXkg
dG8gYXNrIGl0IHVzZSB0byB1c2UgMTAwMDAwYmFzZUNSNC9GdWxsLCBmb3INCj4gZXhhbXBsZT8g
WW91IHdvdWxkIG5vcm1hbGx5IGNoYW5nZSB0aGUgYWR2ZXJ0aXNlZCBtb2RlcyB0byBqdXN0IHRo
YXQNCj4gb25lIGxpbmsgbW9kZSwgYW5kIHRoZW4gaXQgaGFzIG5vIGNob2ljZS4gSXQgZWl0aGVy
IHVzZXMNCj4gMTAwMDAwYmFzZUNSNC9GdWxsLCBvciBpdCBkb2VzIG5vdCBlc3RhYmxpc2ggYSBs
aW5rLg0KPiANCg0KTm8sIG91ciBGVyBkb2Vzbid0IHN1cHBvcnQgaXQgYXMgd2UgaGF2ZSBubyB1
c2UgY2FzZSBmb3IgdGhhdC4NCg0KPiBBbHNvLCBteSBleHBlcmllbmNlIHdpdGggc2xvd2VyIG1v
ZHVsZXMgaXMgdGhhdCBvbmUgc3VwcG9ydGluZw0KPiAyNTAwQmFzZVggY2FuIGFsc28gc3VwcG9y
dCAxMDAwQmFzZVguIEhvd2V2ZXIsIHRoZXJlIGlzIG5vIGF1dG8tbmVnDQo+IGRlZmluZWQgZm9y
IHNwZWVkcywganVzdCBwYXVzZS4gU28gaWYgdGhlIGxpbmsgcGVlciBvbmx5IHN1cHBvcnRzDQo+
IDEwMDBCYXNlWCwgeW91IGRvbid0IGdldCBsaW5rLiBXaGF0IHlvdSB0eXBpY2FsbHkgc2VlIGlz
Og0KPiANCj4gJCBldGh0b29sIGV0aDANCj4gU2V0dGluZ3MgZm9yIGV0aDA6DQo+ICAJU3VwcG9y
dGVkIHBvcnRzOiBbIEZJQlJFCSBCYWNrcGxhbmUgXQ0KPiAgCVN1cHBvcnRlZCBsaW5rIG1vZGVz
OiAgIDEwMDBiYXNlWA0KPiAgCSAgICAgICAgICAgICAgICAgICAgICAgIDI1MDBiYXNlWA0KPiAg
CVN1cHBvcnRlZCBwYXVzZSBmcmFtZSB1c2U6IFN5bW1ldHJpYw0KPiAgCVN1cHBvcnRzIGF1dG8t
bmVnb3RpYXRpb246IFllcw0KPiAgCVN1cHBvcnRlZCBGRUMgbW9kZXM6IE5vdCByZXBvcnRlZA0K
PiAgCUFkdmVydGlzZWQgbGluayBtb2RlczogIDI1MDBiYXNlWA0KPiAgCUFkdmVydGlzZWQgcGF1
c2UgZnJhbWUgdXNlOiBTeW1tZXRyaWMNCj4gDQo+IGFuZCB0aGVuIHlvdSB1c2UgZXRodG9vbCB0
byBjaGFuZ2UgYWR2ZXJ0aXNpbmcgdG8gMTAwMGJhc2VYIGFuZCB0aGVuDQo+IHlvdSBnZXQgbGlu
ay4gQ2FuIHRoZXNlIG1vZHVsZXMgc3VwcG9ydCBzbG93ZXIgc3BlZWRzPw0KPiANCg0KTm8sIHdl
IHN1cHBvcnQgYSBzaW5nbGUgc3BlZWQuDQoNCj4+IDIuIFJlYWRpbmcgdGhlIHBlZXIgYWR2ZXJ0
aXNlZCBsaW5rIG1vZGVzIGlzIG5vdCBzdXBwb3J0ZWQgc28gd2UgZG9uJ3QNCj4+ICAgIHJlcG9y
dCB0aGVtIChzaW1pbGFybHkgdG8gc29tZSBvdGhlciB2ZW5kb3JzKS4NCj4gDQo+IE5vdCBzdXBw
b3J0ZWQgYnkgeW91ciBmaXJtd2FyZT8gT3Igbm90IHN1cHBvcnRlZCBieSB0aGUgbW9kdWxlcz8N
Cj4gDQoNCkxldCBtZSBleHBsYWluIGl0IGJldHRlciAtIEdhdWRpMiBpcyBub3QgYSBnZW5lcmFs
IHB1cnBvc2UgRXRoZXJuZXQgTklDLg0KSXRzIGdvYWwgaXMgdG8gc3VwcG9ydCBhbnkgRXRoZXJu
ZXQgdHJhZmZpYyB0aGF0IGlzIG5lZWRlZCBmb3IgZW5hYmxpbmcNCnRoZSBzY2FsaW5nIG9mIEFJ
IG5ldXJhbCBuZXR3b3JrcyB0cmFpbmluZyBhcyBwYXJ0IG9mIEhMUzIgc2VydmVyOg0KaHR0cHM6
Ly93d3cuaW50ZWwuY29tL2NvbnRlbnQvd3d3L3VzL2VuL2NvbnRlbnQtZGV0YWlscy83ODQ3Nzgv
aGxzLWdhdWRpLTItZGVlcC1sZWFybmluZy1zZXJ2ZXItZGF0YXNoZWV0Lmh0bWwNCg0KSGVuY2Us
IGluIGNvbnRyYXJ5IHRvIGEgZ2VuZXJhbCBwdXJwb3NlIEV0aGVybmV0IE5JQywgaXQgaXMgd2Vs
bCBrbm93biB3aG8NCmlzIG91ciBwZWVyIGFuZCB3aGF0IGFyZSBpdHMgY2FwYWJpbGl0aWVzIC0g
aXQgaXMgYSBHYXVkaTIgTklDIG9yIGENCnN3aXRjaC4NClRlY2huaWNhbGx5IHdlIGNhbiByZWFk
IHRoZSBhZHZlcnRpc2VkIGxpbmsgcGFydG5lciBtb2RlcyBidXQgd2UgaGFkIG5vDQpkZW1hbmQg
Zm9yIHRoYXQgYmVjYXVzZSB0aGUgZHJpdmVyIGFuZCB0aGUgdXNlciBhcmUgd2VsbCBhd2FyZSBv
ZiB3aG8gaXMNCm9uIHRoZSBvdGhlciBzaWRlLg0KUmVhZGluZyBpdCBmcm9tIHRoZSBGVyB3aWxs
IGJlIHRoZSBzYW1lIGFzIGhhdmluZyBpdCBoYXJkIGNvZGVkIGJlY2F1c2UNCnRoZSB2YWx1ZSBp
cyBhbHJlYWR5IGtub3duIChvdGhlcndpc2Ugd2Ugd29uJ3QgaGF2ZSBhIGxpbmspLiBJIGNhbiBh
ZGQgaXQNCnRvIGxwX2FkdmVydGlzaW5nIGlmIG5lY2Vzc2FyeSBhbHRob3VnaCBwZXIgbXkgY2hl
Y2sgbW9zdCB2ZW5kb3JzIGRvbid0DQpyZXBvcnQgaXQgZWl0aGVyLg0KDQo+ICAgICBBbmRyZXcN
Cg==
