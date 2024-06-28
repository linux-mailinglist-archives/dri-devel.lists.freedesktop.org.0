Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6191BC8F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A98510E22F;
	Fri, 28 Jun 2024 10:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="BmdZMddS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E86110E289
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:25:29 +0000 (UTC)
Received: from rly32b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) with ESMTP id 45SAPBe0432986;
 Fri, 28 Jun 2024 11:25:11 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) id 45SAOckq422559;
 Fri, 28 Jun 2024 11:24:38 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by rly32b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45SAOZgQ422087
 (TLS bits=256 verify=OK); Fri, 28 Jun 2024 11:24:37 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPkCvo8qfAD10efCP5vtxf3saeQ9oRywcj9e9MF3RHlJ8hNz3yZ5TsTWVIQK8m5oP0b5W7SJiXZuNUMfOMT12niaLIWZudVgC2FbEVGI755z7wjP6aG2gB1ivq0QU6O+FUOxdNsNEqbkpu40IHHjdIZF3uxTrD8icfVH5PRuuHn6jt7gs4lWp3OCaxVesHO1ht6Jr632tu7o8oSn4oJ4LaX/jcXK5oUlo2dJTDS2iCceFQZGyfihrUtsiBXkE2WLTRDeaz2qPBV/3zhu9ElspLW1cn52u7AUYr6Q/Zl/N7GiemY9S+/5YD4+heBDRE2J0AufG2b2Km4YOkQydrkkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKx0LTYvZaEFdvzabbFG9hHId21sPv1GCk2sySZMDfA=;
 b=M5WPkREHqt2rJG4o7LczEcRR2Rqg9IT9j4LfsXmj7XMN7DAyep/FOfh251FDgh3/j9sl+epi8DZgExraEULT0Gw3u8iE2Bbc2Sc/UDpTnxINAHhlmaZzJ2jEtKoEJa6WzzU1DeABR9MvamZah5l9NveLmLqzuqM5kAyOGhNwIuHkXLREg904+LrVrA67bl+KjtrmqAiV6mg3KffK0hh4i31g/yjEZCdDvjTgbzJjnTuE1wMnxmqkHD38+GThX+CYDVnufHglpSYrx4ihvtVFBQ2aW7p7HZDv/qdnwy2dcf/fyHJzhyU5hdekoZAhkhqy48MPdMEUhSLtqN0+mUy7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKx0LTYvZaEFdvzabbFG9hHId21sPv1GCk2sySZMDfA=;
 b=BmdZMddS7xYKS6AtqRpVPxF1xERlgvSiIV+nZbWgikd6K6iDQz1H1bn/cnIruTpS6IPMJCkz3aWdQqXayk1aV2HQVOhGIGJfjUyi03t79DUTB1Zhu9MBEZdzlKCgV5mXFyLySUQUePDEXGsxIEHrh/vjptKI9qUNm7WUu0Nch+eqAKlZZnZvB1lzzD0jb3Llc40NJU5JpHEKysNvdQ7KW5x0AY/pN7qgXSmKtCCI/3Qojg5X6mwmnwRF9pqWq4AsF0XQpVZYzWniTrD1g56U4nrlGPwvFRY8fwB6zPWjKrA1luWA92Y7KNCTXzwXKjGqVlNNFkxWCOzmv34ONgev6Q==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DBBPR02MB10769.eurprd02.prod.outlook.com (2603:10a6:10:539::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25; Fri, 28 Jun
 2024 10:24:32 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 10:24:32 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgAAexgCAAVdvAIAAF5aAgA4dOAA=
Date: Fri, 28 Jun 2024 10:24:32 +0000
Message-ID: <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
In-Reply-To: <20240619105219.GO4025@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DBBPR02MB10769:EE_
x-ms-office365-filtering-correlation-id: 6952e521-eb1f-4043-54b5-08dc975c8024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NWpXY0ZjZHJxeXdFaitXV0UwRHh6aEpUemJnNkdRS1ozZjVWSkhrbHUrTXJ4?=
 =?utf-8?B?OUQ0cW1rSnM2bm1Hd3pGbWtXU3pJM0Z5dUcwVFVLQjJpVEZWSXlwektFRWdL?=
 =?utf-8?B?WUZ1TWF6ZS9YbmR5Y0Z3WXFKM1VnT3BnbStsaDI1VDY2UmlXK09wWmplZVVu?=
 =?utf-8?B?T0xIakQ5ZCt3QzRtYzNDZndQSEtJY0ozemlJRHhLcS9jZXc1Z09wOS9udzYx?=
 =?utf-8?B?UTF6NnVRd1gvTHpySzZKVWxsRGMyN0R4STU1K2lBb3U4MVhqZzZISG9DUDdT?=
 =?utf-8?B?eDVsQmtLTC9NKzVBcVBNUmRPY1ZqanpNRFpwSzlVZnV6WllqNTNqb09HNHNJ?=
 =?utf-8?B?YkxONnd0UUx3TGRXenBLbGs5U05pTnpiQ3ZzV2NxNklLNkFQOUJ1a2RoV2dj?=
 =?utf-8?B?QS9Ud0Vxc2FScmZrUWpYV0ZpVkNQYjEvZmJObk1WSitiT0tNTVN5bG1JVDMz?=
 =?utf-8?B?S1RMK0NWc3kzZFJHTVNneFFKS2gzTDlVb01JMytBZSswZit4N1dkcFhHalVr?=
 =?utf-8?B?QzMwbXhhVGRmU3NzRy9XdHZZRFVSbTBmdU84bmlJeklvWXhycU9OTVA0ZFJr?=
 =?utf-8?B?czBJMldyUkJNTnE3OFJDU2J2YVljcmlqYTBDQ2Q5dW93MStlZGdiVWtZVlNm?=
 =?utf-8?B?cG1vYzVoNlVnSmZDckNDUVkzVStOeUtDeDhpWmJTWXVjQU9Qc09FOW9HejY1?=
 =?utf-8?B?UFMvY2NVdmN0KzV6WVJZKzFabzYzSERCWFh0dTJHNWpLaEN3VndHa0ZWWVIy?=
 =?utf-8?B?VnFJazd4RTY0QjhNbGhpUWpsRVdmWDgwMURZbTBwTDZtMGxEVitNRnVlZTRE?=
 =?utf-8?B?ODFLdnJEUFZJWHFwTVNYT3NoYXF4d21vTStDckJEWnJZNlEvVlQ5bDNMUWlK?=
 =?utf-8?B?RjFiQTAzdEJsaVNseHpMZHdEVllVeld2dlphVU40UlQ0UlkzRDZCaUNTbURL?=
 =?utf-8?B?N2FkRXd6TUYrcGJ1WkxRVWFucEZxNFJkMytwbzh5Q3V6VFcvMmZ6VVJyemQ5?=
 =?utf-8?B?Y2J6dHExTWJkcGo0YTJPRWpwck1mY2grTGlHOCsyTEkvekZ4ZVU1NStyZlFy?=
 =?utf-8?B?OGtuVmh0L0h4S3UrNVM5OGNSQ29ONXJEajBzYnk0a1M5VmxjMDZlQ3EyNlVr?=
 =?utf-8?B?U25EaHBuMjllcmtSVmhIVzVmR2o1SElNQTU2UWt5WDdHR1d1M2F3aDRTaG9G?=
 =?utf-8?B?Z1lDa3dWRGUyME1BT0NCT0tsRE5qZXhpZ0VyVVNBd0xCajdnUE1ZZXpIL3Rl?=
 =?utf-8?B?cVlTNjY3cytWbGt3VTB6L2h1SmlRK1Q4MDJsQ0lsTTBZZFBPV01qYTFWTXRj?=
 =?utf-8?B?bGZyVWpLQ3VDNEp0bHVoT29iK3E5RGFCVnhkV0ZPU3pkMHU1RDQ4MG8ybVhm?=
 =?utf-8?B?V3puRFNiK2VWSTZiYkhSUkI5NDUvdUcxZ2p0eFlvUEFITE1rMDBWK25sZ2t5?=
 =?utf-8?B?T0M3QnEyQU1CWGtKWGpHa0Q5S1pvRlFTbDNKSC9qbllUTWxuaTQrVXMwcmxW?=
 =?utf-8?B?RFFseVZkcThxdkpkYXpCei9vY2pjdG5JdzlaTkhsbTYzMWRmUDVSUjFpbGc2?=
 =?utf-8?B?RmhUcXJYTS9MOXhKS3RteExiVkpZNlhna2JwZGp0M0s3ZmlWVmU2NjUvL2hH?=
 =?utf-8?B?S1ZTMDdHeHhFMjdneGJha053Mzd4RkZrc2FnR0krNWRJdHVPd3N4aDZiZWVq?=
 =?utf-8?B?M2NncSthUHZMeDhlSEd0djRwaGdkSWJlMzcxMGVEbm1SMGY3NDJYM0d1S3Zu?=
 =?utf-8?B?SVE4WWl1OVM5YUk3ZmQxQkI0MG1CekhwZUVFSjF4YTZ6VjRWQS84TjNKMVUz?=
 =?utf-8?B?c3ZBaVRsa3R0QmpCQk1zblF5QUtxNzRYUElvWlEyMHhkOGdTWUF1djB6V2R2?=
 =?utf-8?B?RnpKMmc0MG5odTIwQ25vc1ExRXlXNUQ3eHVTanRhYXM3S0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzE3ZHlMbXhsdnpJUDl0WUNIemdWOVhoUHRwR0RycjJ6c2NLSDJaTWM3bHlQ?=
 =?utf-8?B?UzlNODM2eE1PazJmczBnMWpXS1lSbTl1TXNSeW0ySHI4ZkhJajFaRWtGcUJy?=
 =?utf-8?B?UUtGMlpUM1N0U2dCQWJMbTNHSFErZzdyYkxsVXc4by9vZUxQNWFFbFUzLzlv?=
 =?utf-8?B?a29lNXNKT1pMb3RkbW9QZDkrRkZSS1ZpSW5JZTIwdXhnNFlYdHFKR2VMN1Za?=
 =?utf-8?B?UkkzcWQxcWJGUFd2SkQwcy9VTlRPR0Z0WWJmaUo2NWVXNDdqQUdsV04vUXBT?=
 =?utf-8?B?VFlDVmUvUlVNMDU0YXpUdVUwNVFTM0FPM1Rrc3ZoUVBtQzVQUG16NHVKNUQ2?=
 =?utf-8?B?RzBVUmRhd1ZLL1piLzB3S3lWOE8xaUVTZEpBZ3BUcG1yRnF4Wk85dmhFU3Iv?=
 =?utf-8?B?ZEQvOFJuZ2NNWC9HenJVaUplVU5pZnRXUnNEQ1BEMkxNUFJiSSsvUHNHRk5D?=
 =?utf-8?B?WUY4enRYZDhYUXI5Q2d2UDhlRnFRdkM0OTFpLzl4dmVtUVg0NUtZWEdiNWFI?=
 =?utf-8?B?bFJoSUpmeWhkeWFqeGxPbGtLbkFxVUlnZ1BTNzJ2N09sQnIwdnVicEVQeVQ5?=
 =?utf-8?B?U21FTkM3c3lkMXZlWDBvZldDMjIzQlRvQlgwc00yWmJMVFBPVndFT1Rtem0x?=
 =?utf-8?B?Q3UvY3FyYzhqRUhHay9yTzlOMEViMm4rNWgwZnYrZnc3cEJSSGxJV2locnhj?=
 =?utf-8?B?ckczZzBTK2hOQXhuNTRzanBEVXZldGFvV2VHeDVJczh4YXJjNjREWDNoZUdV?=
 =?utf-8?B?dmNBR2NOdGxaS2NtZU9nRHRyaFl0TEI2aWZIVmRPNDMxa2d4dkI0RWJ5blRE?=
 =?utf-8?B?dVh0djl3K3VDOXJLMXFOeVBrQzhPQjZHcWYwc1ZDNUIrTk1iNUtsS3NaOGFS?=
 =?utf-8?B?TXAwWEFFTGhLNFQ5MXFrUVB1MTNkUS80K1M4OXFjK0orellGNmtSTnlrdDdh?=
 =?utf-8?B?d0xNSmwweHdWYjhQYy9Sc2JLWGxCdCttejVaRGhBR3g2NU42a1pIUHp0Z1hq?=
 =?utf-8?B?K2l0RHl2ZkJqemxDaHBrM3FqNzlUVHg2RHhwOU1HR1NkWDRhclJwVzh4U3p5?=
 =?utf-8?B?Snc2N3hNZFo0SUJsUzB6bUZJU28xMXFSeXNoMDdmSzdkOUkzYnVYdTJNRFRp?=
 =?utf-8?B?Q0pNMmZsYXNzYUlqWXpTM2IyM0VNMktwS052cVhneHR6SUg3aEFsclZlTmVs?=
 =?utf-8?B?SkdwaG50aE0zblEvOGZZNURJc3RFZ2hvbWdiNWRJN3c4Nmcva2JiK1pybWpK?=
 =?utf-8?B?VVBOMlZ6WVVrdUphVzAwTlpuRDI3TmxHaFZDajVGRjNLMWxJV3hZRDY1RHRu?=
 =?utf-8?B?SnlsOHMwRC9vaVg3OUxjOStMZTI0NHdZVERXNFo2R21TOXhBMlRXUW1RaHZi?=
 =?utf-8?B?WVFuVWVEUnhaWld3Ri9vQVJpMkcySXB5UVFwZmpQWDN5K3VsSSt6SnpMVitJ?=
 =?utf-8?B?SUJjbXVXS1V1MG9IcFJ4ZEl6bEJXbDZGakdYcFAyKy9JaW1Nb20zUFVVTVJ6?=
 =?utf-8?B?dVlpVWhmRnFvRU1RZEZOY054TWx0TjB4c1BSYTk4YjVwOC83S0IwZUVjbE9O?=
 =?utf-8?B?VGRiZjdhYlQ0NmZ1SnRiUzZDV0dtSG1iWGpHMjZpaUtiNmpkQ0VISzVtc0Zx?=
 =?utf-8?B?SFNVRUNTSHg1cDZMK0NFVzJpV1IyRkd3TWxOU1FpUmM3RTFvQk4wK0l0Mnp4?=
 =?utf-8?B?MU1QQXhwbnNVakJaZGdSTExhWW9FdVloRE11TTM2VVFrclhqQUxoOERLMEp6?=
 =?utf-8?B?QUxWTE95Y1ZabHEwdENXSkMyUThMVDlYRWlheHN4dHpiaXpjTjE1UHdtNElH?=
 =?utf-8?B?RjlnNmc0Q0FCWlhrSkxFNDRzY2JzR2hja1JscnR3RjZ2Vm5LWW43ZXc5eU1S?=
 =?utf-8?B?RWNWV3owSm1lNFY1RzJ6OFZpMDhxcXp5ZGFYODRNdHNkV2dNUCttdXJnNXNJ?=
 =?utf-8?B?bjU1R3huQnl0M2IwdkNXV3ZqYVVJYzd2SVJrcFI3RzFHREZjNENZcEJ3RUQ1?=
 =?utf-8?B?VTc2cXBCbXZlUDcyV0FkWSttcElkSWNzNWE0NE1XQzRZbFIrelF2M20wTUs5?=
 =?utf-8?B?RHlZWUw5bVpDUjBrTW9KeThveWtLVEZxYVlZWDdUenVHVEpXMjlKY2RXR0pm?=
 =?utf-8?Q?C8h0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D58E99D49FFEA648B4DB481A64E913D6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2rmxNu0IZxSUd0XZ9KhcUhqV8UF6toKMlMlu93MdogBpLO5wf8Tjc8x2OpkvtCNeWV02GzwGbrYBjwv9eQyECyrVcS3pz5mizeFo9wQDk5f3ZSUd2FRY+bVJ2ih3/Nx8AEYqZ1jq+/SU/rZxmU/gyflfrilWBQdh2P7+CoBhsBtHd0WF22Or9dcJGeoDH2vybG1e+zxt3QkZJ/AomLxx88qpsSZbNdyK06Ycjdcsn5y4h7NAJdfcUXRCDE+mQ3Kg37fTf15CRL1Rd7Ic4Zv9iKHYNbFj9QL+Sbua+6cjguLYmqLAXOFxhP2gclzC4StIDV15ADqVWVNwCiOzrXrueXRhdp/n5SXDAls7nTqNlQFVCWQrMmio2BPEWTeovrX4JQjwXMAoWXEjAZqFmBSnG5X3PlvQgFqkA0PrsmVSTtQYeQAASCEy5unv4CgoGx0P2e1panN07l3WCzJd3N1yOFFmv+tJdLVUscBjSBE1hgwgDfJqXcYAy/CxJdkqMP+dLD7/uMxcYsiny5mCt4L58wb4lnmMLJw02qkapNSHrR6SUFFRzNYrdPuWzoZa56+5eZR+303DzrssaIlPu30gBGAHlsUaGWQkA+YFQPNiWzKudK2QL1U53mp9AKUp7ckJ
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6952e521-eb1f-4043-54b5-08dc975c8024
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 10:24:32.2370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37Keqfm6CJJQppKrJoDQEQ1nmnti+ZjoE+lkSw1lK3RuJfMvUzI94UF00yWDIDbRAx8NQMZyOIt9PyZOyL1KyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10769
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTU3MDMxNDpGUEtleTEucHJpdjpyjbzenocSaZ9pXNWxX4i2yRNoLhgbGw01q9GGwpl0TBTIm2sAVw2OciTocGehTycRfQGTdwdsLEdWdG7u4x7vQdm0YIcGFRrwFvnLCdlLym8ovPBxbftlX56IKsc+9L8F+8wAp5WiFEle+vvB4F8ultZQg9e85M628Pf/YmHWaXppkdtF2vy+tRIVXcJn0s9cv9fy5k3MiunHsYBDqcx3INrQmUd+YU5oVq3qB6Tg3b5DOIEjLywQgXiir9i0w4sauM4VuaAYZRCXYkKZIX80yBHDeGwqjXOSWlewqukEIeV6OiyVxKGWHoooFuZWnW2McAHTuVRN3ZMPWAue869Z
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.142
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

T24gNi8xOS8yNCAxMzo1MiwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBPbiBXZWQsIEp1biAx
OSwgMjAyNCBhdCAwOToyNzo1NEFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBP
biA2LzE4LzI0IDE1OjU4LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4gT24gVHVlLCBKdW4g
MTgsIDIwMjQgYXQgMTE6MDg6MzRBTSArMDAwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+
PiBPbiA2LzE3LzI0IDIyOjA0LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4+PiBbU29tZSBw
ZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJv
bSBsZW9uQGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPj4+Pj4NCj4+Pj4+IE9u
IE1vbiwgSnVuIDE3LCAyMDI0IGF0IDA1OjQzOjQ5UE0gKzAwMDAsIE9tZXIgU2hwaWdlbG1hbiB3
cm90ZToNCj4+Pj4+PiBPbiA2LzEzLzI0IDIyOjE4LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+
Pj4+Pj4+IFtTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVu
IGdldCBlbWFpbCBmcm9tIGxlb25Aa2VybmVsLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0
YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
Pj4+Pj4+DQo+Pj4+Pj4+IE9uIFRodSwgSnVuIDEzLCAyMDI0IGF0IDExOjIyOjA0QU0gKzAzMDAs
IE9tZXIgU2hwaWdlbG1hbiB3cm90ZToNCj4+Pj4+Pj4+IEFkZCBhbiBSRE1BIGRyaXZlciBvZiBH
YXVkaSBBU0lDcyBmYW1pbHkgZm9yIEFJIHNjYWxpbmcuDQo+Pj4+Pj4+PiBUaGUgZHJpdmVyIGl0
c2VsZiBpcyBhZ25vc3RpYyB0byB0aGUgQVNJQyBpbiBhY3Rpb24sIGl0IG9wZXJhdGVzIGFjY29y
ZGluZw0KPj4+Pj4+Pj4gdG8gdGhlIGNhcGFiaWxpdGllcyB0aGF0IHdlcmUgcGFzc2VkIG9uIGRl
dmljZSBpbml0aWFsaXphdGlvbi4NCj4+Pj4+Pj4+IFRoZSBkZXZpY2UgaXMgaW5pdGlhbGl6ZWQg
YnkgdGhlIGhibF9jbiBkcml2ZXIgdmlhIGF1eGlsaWFyeSBidXMuDQo+Pj4+Pj4+PiBUaGUgZHJp
dmVyIGFsc28gc3VwcG9ydHMgUVAgcmVzb3VyY2UgdHJhY2tpbmcgYW5kIHBvcnQvZGV2aWNlIEhX
IGNvdW50ZXJzLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9tZXIgU2hwaWdl
bG1hbiA8b3NocGlnZWxtYW5AaGFiYW5hLmFpPg0KPj4+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBB
YmhpbGFzaCBLIFYgPGt2YWJoaWxhc2hAaGFiYW5hLmFpPg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQWJoaWxhc2ggSyBWIDxrdmFiaGlsYXNoQGhhYmFuYS5haT4NCj4+Pj4+Pj4+IENvLWRldmVs
b3BlZC1ieTogQW5kcmV5IEFncmFub3ZpY2ggPGFhZ3Jhbm92aWNoQGhhYmFuYS5haT4NCj4+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBBZ3Jhbm92aWNoIDxhYWdyYW5vdmljaEBoYWJhbmEu
YWk+DQo+Pj4+Pj4+PiBDby1kZXZlbG9wZWQtYnk6IEJoYXJhdCBKYXVoYXJpIDxiamF1aGFyaUBo
YWJhbmEuYWk+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCaGFyYXQgSmF1aGFyaSA8YmphdWhh
cmlAaGFiYW5hLmFpPg0KPj4+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBEYXZpZCBNZXJpaW4gPGRt
ZXJpaW5AaGFiYW5hLmFpPg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTWVyaWluIDxk
bWVyaWluQGhhYmFuYS5haT4NCj4+Pj4+Pj4+IENvLWRldmVsb3BlZC1ieTogU2FnaXYgT3plcmkg
PHNvemVyaUBoYWJhbmEuYWk+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTYWdpdiBPemVyaSA8
c296ZXJpQGhhYmFuYS5haT4NCj4+Pj4+Pj4+IENvLWRldmVsb3BlZC1ieTogWnZpa2EgWWVodWRh
aSA8enllaHVkYWlAaGFiYW5hLmFpPg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWnZpa2EgWWVo
dWRhaSA8enllaHVkYWlAaGFiYW5hLmFpPg0KPj4+Pj4+Pg0KDQo8Li4uPg0KDQo+PiBtbHg1IElC
IGRyaXZlciBkb2Vzbid0IGV4cG9ydCBhbnkgc3ltYm9sIHRoYXQgaXMgdXNlZCBieSB0aGUgY29y
ZSBkcml2ZXIsDQo+PiB0aGF0J3Mgd2h5IHRoZSBjb3JlIGRyaXZlciBjYW4gYmUgbG9hZGVkIHdp
dGhvdXQgdGhlIElCIGRyaXZlciAoYWx0aG91Z2h0DQo+PiB5b3UnbGwgZ2V0IGNpcmN1bGFyIGRl
cGVuZGVuY3kgaWYgeW91IHdvdWxkIGV4cG9ydCkuDQo+IA0KPiBZZXMsIElCIGFuZCBFVEggZHJp
dmVycyBhcmUgInVzZXJzIiBvZiBjb3JlIGRyaXZlci4gQXMgUkRNQSBtYWludGFpbmVyLA0KPiBJ
J20gcmVsdWN0YW50IHRvIGFjY2VwdCBjb2RlIHRoYXQgZXhwb3J0cyBzeW1ib2xzIGZyb20gSUIg
ZHJpdmVycyB0bw0KPiBvdGhlciBzdWJzeXN0ZW1zLiBXZSBoYXZlIGRyaXZlcnMvaW5maW5pYmFu
ZC9jb3JlLyBmb3IgdGhhdC4NCj4gDQoNCldlIG5lZWQgdGhlIGNvcmUgZHJpdmVyIHRvIGFjY2Vz
cyB0aGUgSUIgZHJpdmVyIChhbmQgdG8gdGhlIEVUSCBkcml2ZXIgYXMNCndlbGwpLiBBcyB5b3Ug
d3JvdGUsIHdlIGNhbid0IHVzZSBleHBvcnRlZCBzeW1ib2xzIGZyb20gb3VyIElCIGRyaXZlciBu
b3INCnJlbHkgb24gZnVuY3Rpb24gcG9pbnRlcnMsIGJ1dCB3aGF0IGFib3V0IHByb3ZpZGluZyB0
aGUgY29yZSBkcml2ZXIgYW4gb3BzDQpzdHJ1Y3R1cmU/IG1lYW5pbmcgZXhwb3J0aW5nIGEgcmVn
aXN0ZXIgZnVuY3Rpb24gZnJvbSB0aGUgY29yZSBkcml2ZXIgdGhhdA0Kc2hvdWxkIGJlIGNhbGxl
ZCBieSB0aGUgSUIgZHJpdmVyIGR1cmluZyBhdXhpbGlhcnkgZGV2aWNlIHByb2JlLg0KU29tZXRo
aW5nIGxpa2U6DQoNCmludCBoYmxfY25fcmVnaXN0ZXJfaWJfYXV4X2RldihzdHJ1Y3QgYXV4aWxp
YXJ5X2RldmljZSAqYWRldiwNCgkJCSAgICAgICBzdHJ1Y3QgaGJsX2liX29wcyAqb3BzKQ0Kew0K
Li4uDQp9DQpFWFBPUlRfU1lNQk9MKGhibF9jbl9yZWdpc3Rlcl9pYl9hdXhfZGV2KTsNCg0KVGhh
dCdzIGhvdyBvbmx5IHRoZSBwYXJlbnQgZHJpdmVyIGV4cG9ydHMgc3ltYm9scyB0byB0aGUgc29u
IGRyaXZlciBzbyB0aGUNCklCIGRyaXZlciBpcyBhICJ1c2VyIiBvZiB0aGUgY29yZSBkcml2ZXIg
YW5kIHNvIHdlIGNvdW50IG9uIHRoZSBpbnRlcm5hbA0KbW9kdWxlIHJlZmVyZW5jZSBjb3VudGVy
LiBCdXQgd2UgYWxzbyBnZXQgdGhlIGFiaWxpdHkgdG8gYWNjZXNzIHRoZSBJQg0KZHJpdmVyIGZy
b20gdGhlIGNvcmUgZHJpdmVyICh0byByZXBvcnQgYSBIVyBlcnJvciBmb3IgZXhhbXBsZSkuDQoN
Cj4+IElmIHJlbHlpbmcgb24gZXhwb3J0ZWQgc3ltYm9scyBvbmx5LCB0aGVuIG91ciBJQiBhbmQg
RVRIIGRyaXZlcnMgd2lsbCBuZWVkDQo+PiB0byBleHBvcnQgc3ltYm9scyB0b28gYmVjYXVzZSB0
aGUgY29yZSBkcml2ZXIgYWNjZXNzZXMgdGhlbSBwb3N0IHByb2JpbmcuDQo+IA0KPiBTbyB5b3Ug
c2hvdWxkIGZpeCB5b3VyIGNvcmUgZHJpdmVyLiBUaGlzIGlzIGV4YWN0bHkgd2hhdCBhdXhidXMg
bW9kZWwNCj4gcHJvcG9zZXMuDQo+IA0KPj4gSGVuY2Ugd2Ugd29uJ3QgYmUgYWJsZSB0byBsb2Fk
IHRoZSBjb3JlIGRyaXZlciB3aXRob3V0IGJvdGggb2YgdGhlbSAob3INCj4+IGxvYWRpbmcgYW55
dGhpbmcgZHVlIHRvIGNpcmN1bGFyIGRlcGVuZGVuY3kpLg0KPj4gVW5sZXNzIHdlJ2xsIHVzZSBk
eW5hbWljIHN5bWJvbCBsb29rdXAgYW5kIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHlvdXINCj4+IGlu
dGVudGlvbi4NCj4gDQo+IE5vIGl0IGlzIG5vdC4NCj4gDQoNCjwuLi4+DQo=
