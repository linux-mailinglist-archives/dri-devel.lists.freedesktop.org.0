Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73403914383
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F62010E376;
	Mon, 24 Jun 2024 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="OAPZvb41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C6910E376
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:22:32 +0000 (UTC)
Received: from rly02d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) with ESMTP id 45O7MJ6A364105;
 Mon, 24 Jun 2024 08:22:19 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) id 45O7LSEp345041;
 Mon, 24 Jun 2024 08:21:28 +0100
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by rly02d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45O7LQfD344423
 (TLS bits=256 verify=OK); Mon, 24 Jun 2024 08:21:28 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0UN3IKCDIl4bc8REMLlcvrOVSp3xraMPoPDCHzviaWO1TupeYdwfb94jy+TxxIPV+m7lWqn2VPVEpa3+4C4QBVfsqgU1IvUCVENXMK4XeyCD0KgC0Y3N6xd/MAIZat2IIvAm23t5vtd7xR4J7lgXV1COiKMK9kr/lxvSCv8prJ5lnF9OB2L9SLozYbMIpb6xWRdJJPxzYgJNvb3QPCCBmrkTj+8L0BHzEe6kKSgOJJQzJ8CAcfdgl1POzz1JUeG6oykGxVgbnD0jxdppibNklgsWz+ZUzBsEK3GaB06I4ui9ktlU74oPWUFLLixcpG8E/2KULbXgCHRmJUJVPxn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDQ8qgDY6CEPzK1LAFGcYm0Ov5uHmnvVz15XJG+Ymd4=;
 b=WHBkOpDe55yRH3rkHwNVqzNYR51FQcsMTAnCoMwxCdJ1sZKuAsScSBnoBKpQpGofw7vCauNaUO3XMyLTgaPGYwlvdEShGMXCNX34B4IkpOrd/u19ghPAFWr5DWbX5MljuwcGyKrU+3nJv5MSeH7gywaFkYjvaGSALAnzUQ0MwA36YGwkXS6zTZl56c+ZYAeNy3VHJWE+vnnVm+cKtkD9Nzrtlumew4YLM8zG288k51Y2oDf6DPSWw0510Ps0yIorsBsxVs8muqHB2BHERWO0k8VgWigebduh+dTm6AcEDJw/5uqBK1OGqZQnK5qkKMBKB11TyO2XRlXpRy6wJKiXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDQ8qgDY6CEPzK1LAFGcYm0Ov5uHmnvVz15XJG+Ymd4=;
 b=OAPZvb41daJtks6asIvuq4HCorKoYkjHBZAH6/OB+Wtznam4Vo8UY0MdhrTJ/oqoOsL+KPGJQj0bkRT8yaa8T0d+eT5x0N7X4BGwUR6vpbzduStXQQ2rgIv5FbPGgkC1uBCmJHesIacB/XGgD02J4rqo7WZPmWk3OLCWiYr4SX5FyQMNEOc0fBIbGU4FHYD01hWZqwZ5bxNrnnVtoi0JLCF+9Uq+Hdy0oOZ1Ol6vTC0ruFIH+FrUSIdH7pBBWNZonsrV9dgq5+xABPQ39hmso0wOGqlTL7AwZ6jMj56DXz7KK4xeAxMkQPLj5TasrxNXzlNf1Ga8T+2hrzclcncOuA==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PAWPR02MB11140.eurprd02.prod.outlook.com (2603:10a6:102:46d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 07:21:24 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:21:24 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>
CC: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Topic: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Index: AQHavWrP8fzUP7TvlUuSpdkfhyjIlrHPc/UAgAKZx4CAAFg9AIAClIWAgACHeQCAARFwAA==
Date: Mon, 24 Jun 2024 07:21:24 +0000
Message-ID: <d79c7f3a-c770-4ef5-b9be-20f0c214b09f@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
 <060ac3a6-bbac-400c-bfd9-cb1a32c653b4@lunn.ch>
 <a1a3bafb-c64e-4960-a826-f49d4679d7a0@habana.ai>
 <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
In-Reply-To: <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PAWPR02MB11140:EE_
x-ms-office365-filtering-correlation-id: c98149a7-7e91-4977-616f-08dc941e4149
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|41320700010|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?aVFQdDJVbkhiUXJtR1pSZHdZL21iRnRlM3AxZzlMVmhZVTF1UkRpcEx3RlhG?=
 =?utf-8?B?MkRHNnNLMGFxbG81cGdhUXFPTTVyVVdjbTZ2SHZpU1BlcDk3bUM0S1dPNkpI?=
 =?utf-8?B?YkxmeXF6UHZCdDZqdzFFenREamVKYVFGYWtDZFQyWjNWWm5UdlY3Q3F3ZXNr?=
 =?utf-8?B?ZURkSkFCOGV4VWhMQ1g2UUlKaGtCZ093cXlvWS90dXEvVTZQYjB6WWRhN1NT?=
 =?utf-8?B?MWoxLzVwWkZRU2thSlZsOXhLTFBSbExzbmJkc1hhQXFURlZsMVFFYmcrNGpF?=
 =?utf-8?B?VjQxRVpzUzJFclAxellzYzZEWUsvcEpMRFlYSkp1eWlkTEV5U2dza3BodjhB?=
 =?utf-8?B?OWw3a2taVFFiN2huTjBwMHd6WXFuMDFWb3pRUElEN1RBRlZrejlVNWNSSWh2?=
 =?utf-8?B?SVFzUThhbEpmZldCQTA5L0ZGeGR1L0QxNkVMb00vWjMwSmRxbld3TWNlamRQ?=
 =?utf-8?B?UFA0cmJUNDZxb1FhR2pCTm12a004M1dKQ0NSSDFXNkhBOEJDUjBpc3BWdFJ1?=
 =?utf-8?B?bkE2QkN6UlgyMkhLUHdlNFc2U0ozeW9YWjBMNW1jbC9CYW93aGp5T3RoMXJ2?=
 =?utf-8?B?ZEFyVlBscTBleWdDcnozNjVCLzgvOW5LclpjLzIrWWVQQXI3UTM2M1hVNk1Y?=
 =?utf-8?B?aTg3U3JiK3BaTjVjNjM2aGlidUY1NGZaY0RJOEgrdStvL0N4L0RYS3hsbXVj?=
 =?utf-8?B?OG5QeSt1UldmMlc1VXNxL2RJc3k1cUhISFF2M3NiZHBNK2kvYW1STFhySDNx?=
 =?utf-8?B?NWNkZldld3VzZXpjbFZkWGoxcWo2NjhFZyt1SDNRdmZ2Y3dndHFVcFZqaUxF?=
 =?utf-8?B?ZElUSVYrUitGeVN4UERTV3FIeXdJOENTdjJOblp6OXgrOTRtaDBHRjBZaW1r?=
 =?utf-8?B?NnZRMXZCZTBnUEI3MDBzU1UvMG41eklZUlVFRDluN0VwZVBTSCtIOVV3Rita?=
 =?utf-8?B?VFZNU293YnphejhnVDhIa1l4b05wNkxNYUpuVE5hYWFTTFo3V2pEbWJ3UUp5?=
 =?utf-8?B?c05VYWhJMUZVTjVoVmhLMnRXbUxqNytvcEhTN2c0RmtMU0xZcklDREZrcWsv?=
 =?utf-8?B?UWRLdkVFTEJTeXhBYmJLejRKaU5Ua3UreDlCUWNwMTc0QWNXZ21UTTMra1pM?=
 =?utf-8?B?Qk5iMUVJRytaVk05VldPV2dFaHNXS01LYUlheGk1emRtZEpHQUZXME84cHBo?=
 =?utf-8?B?bkVxK0o1MUNTVHl2azRMVDdmVW1Ob0NGV1ZJcjVmZnMwa1hpOExwMC9yN2g1?=
 =?utf-8?B?V29acXlWdHhYbkdxL1NwbytYSndpMU9jczlLMjJlMlp4Nk5qMjhpekt3UEI0?=
 =?utf-8?B?eUpRVHBEV1p1YVRpQ01hNXhaejYzcnFkNFpVN1dsVFcwSDlDMllBL0phaDBS?=
 =?utf-8?B?elNJQlZrZWJVenV4V0tkZDR6dnBNcStNYVBwVlRud25VdTF1cWRiVURhY0dy?=
 =?utf-8?B?cUJMaGNMZkd4VEdDRlVMTWVHUkg3QzBDTllnd2pMM2g2Vlh1Q1VwSzBQUk1q?=
 =?utf-8?B?VThsd0Yxb1ppenhVbHhQMkNBVVNSekZFN2cvM08yRUo0Zk8zenJvWXYyOXFO?=
 =?utf-8?B?OFlPM3lUdEZPWklqMjdybWVJWU50amNLSkRuTGpacDVuZy9MWVppQUdUaE1n?=
 =?utf-8?B?dTlGbHE5RmJ6OTlIZWdKOGhZL1FiVEZ4UGI1ZnFrTDNtNmRqK2lKUkhiWXVI?=
 =?utf-8?B?YklsdEd1am4yMkZxc3A4Ry9pbGxBMjg4MjBBWGRGYko0VDhzTVRpcC91ajNW?=
 =?utf-8?B?ekczZ3ZtWFBORElsVTZTRzJubGg5OUd0L0l2c0NZdU5WbmVSSHJrOWVrVEJ0?=
 =?utf-8?Q?iby7wXlNLedhwzNHH7A8XW/l2HBucVKlhIO3s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(41320700010)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWZwNTd6RWV5U001SkpUNXh3WFI1OTE1UFM0YVRWRzNkdkF6MDVKbjFDaW1m?=
 =?utf-8?B?dmdYSWFHMVE2QWtiRDQ5NTAxZVlNY2c5c1hWVTlpU3BBbjdCUmJpKzdiY1F0?=
 =?utf-8?B?UXJOdGdLVlp2Qk83UnRuV1J3MVJpVnY3QVRwcllvOS9TSDlJMFBRY0pBT0RS?=
 =?utf-8?B?Uk5VVVZBSDA3KzR4RFkrdUJoN3dTNTFlSVlaSzROYVkxZFRDREowbjV3YkV0?=
 =?utf-8?B?dzNzRy84VHVYR05ZWGhlenpjN3V1MUFRNnFlRkpReTNQQkd4SmdVK2VMaVhT?=
 =?utf-8?B?V2YwemZSWXp6Q0RTdHdIN0ZiSmJ1WWFCNTJrcTUyZ3RaWHYyRUxuNnVDWm5z?=
 =?utf-8?B?emxqdXFVK1U0MmVFTWNaOVVsSUF5N0tPSmJBOXZZdEFkNmFtM05DcHIycGhK?=
 =?utf-8?B?S3I5UUNhMHV0akJ1VXNEZnJxRUFFc2x0MVJvSFBJY1ZKN09wWm5NQ1BBSXRH?=
 =?utf-8?B?V2tBTCs1Z2JrWHR2aEJuQkxQa21YUzdlaTh6N1FoVmE2eEpxdThRbnBrZHBK?=
 =?utf-8?B?YlBiclIyRHhkZ0lGMDJjTi90dGlzSU9KRVZRNm41Ym1Dc2dYMDNFVm4wT2pm?=
 =?utf-8?B?eHdlb2UzM3ZHcGRCTmNFOFNNTUxaTjFBT0lpWGt3QkF5R3QyQUwwc2dGM0NE?=
 =?utf-8?B?eUZjRzZRWVI0c1dWbDdGZzF2NXFNdm45UHF6UERyQzNGY2Y5UHFva2lOV3NY?=
 =?utf-8?B?aXhBZVNUNzdqYmxBR2dtZEpHaWJ4L1kyN29nbjQ4Y3ZVNHBqN1EzZkNKRldV?=
 =?utf-8?B?b01GRE9UZHAwMnRGeWlqNi95QXc3RTV4cFA0SmduS1VMMWptbUtZK01CQkdz?=
 =?utf-8?B?dVdJQ09iUlhQMWdVY3E0bGdZdWxjY1NZZGUrNHBTN2VDVHIyLzMxWWJsQW91?=
 =?utf-8?B?SFRFRG5lRWVXNGF0UkQzc3dyZE5taVAwZ0w4dWZTWXhsMUhOR2NjckRoRVpq?=
 =?utf-8?B?Mi9XeU56Q2gwUVJvSnk2WW1xN2ZYSFFqRE1oQzBHdEZ2TDJoYXNFcy9uemR0?=
 =?utf-8?B?RHdYRGJHalR0aThEMXRiZWFhWmQzYSt6SElaTFhHa2E5VTNpcTBOM0JRZFJx?=
 =?utf-8?B?dVpNK0JGVTZDLzV3V2NCR0J2OFBqZWgyb2dMSkh6SXFPeVNaa1ZYa1R4d25x?=
 =?utf-8?B?NkZwRE1wSzJ5MTlCWXNFMElZZHhCQURxTEJWTTA4ekd2MlFNTzFWRjJmbDNH?=
 =?utf-8?B?YVR6TzAvK3JuUEdxbFVQbUxpTThlL0NkSnNiY3hxcVVhZFh6RTFBTk5HQzVG?=
 =?utf-8?B?Q3M3S0REMFN0Wnp0Qm5ETTlKbmZHamFFdWhkQ2l4cmg4TWV3QUVPZVU2MFdS?=
 =?utf-8?B?emZQRUlJVnBrcklzVklFQmxTTDArTTIzeE5GTjlhYkFjc1d3K3VFTUdmM0Vm?=
 =?utf-8?B?UEZYTGpDem82RXJBOE5yTVk2UUFFZkxDeDEyZEoreWRoWUFwaXcycFIvdmRM?=
 =?utf-8?B?QjdRbXR0R0J6K3ZUdFFVSkRhYzR5UzNCTHdkbXNZRkNOYjl0clRIRUg1SWpu?=
 =?utf-8?B?NUpXWjBDR0VTRHErYUNiWUFCeWh3YW80TVd3UW9GL3k0eEM0M05OQ0tVd2Vv?=
 =?utf-8?B?Zzg1VDVVT2ZobmtPY1ppMExDZlU5ZFNSbkpvaUIrUUtIVVIxSGxpQTkxaVgr?=
 =?utf-8?B?YW0zSEZsU1hRTnU1RmU0R09PMitHeHAxMnpJRlBidFVjSzFaelFwREpSM2tz?=
 =?utf-8?B?OSsvM2QxZCsweGtRT2VtNXlyeGVHaXlLZVJvMHZaeDYxSEhvaG5LMmRtUVJH?=
 =?utf-8?B?Z3pqS3ovTHB6ZlBOOWFDZk40cVg2RGJIUmREck5kcmU2bzc4OUkzd0RJZW04?=
 =?utf-8?B?WDQ0aklrS0MwNnY5WDFodUljUTFrZ05pQ0RyZytKR1FRb21aRFJHMEJNZ1RQ?=
 =?utf-8?B?bmJxZi9nOFk3eVNuQ1hKR2djN205dnM4czZYT1ppeEg2QUpKNXd6QXVGLzdH?=
 =?utf-8?B?OEZqRSs3N0Z2WUZSdjluOGc0RWYxMG5DNUZmR0dEWHMzVmswRUxHUER4QS9U?=
 =?utf-8?B?UGlPekc4eXdCZlBYMUloUFNDaTdyclpWb004K0tVZ1F0M3F5THV3NFVxczhN?=
 =?utf-8?B?bE4yTEtLZFR2dHBpZ1dwSmxyQVNKd04vSVkyOGpuOW1tL2Q4U2pkWjB4MldC?=
 =?utf-8?Q?a473NDFwLWHnH4z/uYePq2XJJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40C0DD73662D7541A3548A2969518337@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: q06VMSVkQ8ZSjODJWQntkYzunAT0WMh8Uff/+mndwKpt+Rs8WFlvL4aYVjuE1qLC6tzG0SloAYCKvjn0673zBT5zcPfCdIMchtmnuxyO23o3hjN7kdyrBer6QsrkV/F13pyj3Pfmn3upbbDpwVsn69GAciYPStuLaTWkFsGOti0kO0YrQb74E2SrxmykSXb2+P7ong1nBy5z1gZalFPe5RQPX8pPZnJxG5cbf7O8LR2pkq1Bjg758lAU6vnmuJc4YJL+BX258lTiS3GEmfI3lX77G4oQX7cG8eFOCX8JtY3kYfpPKIar15p3TVLTfcHDAlkvSoezEqVS56FGdQnr42P6EYQ8cp4KYrVZ15wwTJB/DK6lNdmqfwSvE2UcA3cFE41aiMx7EbyHY1aJ3VRdFqI4FwFyRDjgiKIipARenTpLieBDlIrmWibBOrCFNMWQV5rLh/w7S4fVrYYmzgqdUm/sS3kohLtepG9rFyUc53qYg7H1d4Hcb6WPSZRVQm5j2faDdFo1ezzr5yTeCdwcTYDhwMaeTrayqG3zwNzZ8T3B2DTYdBBM9pnHA9i/07fyOzJi6oZqnxluNVbgx1pBB04UOC2oTjrLlBSzm+gFvOZ3hLplYn+o83x/hk17KweQ
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98149a7-7e91-4977-616f-08dc941e4149
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 07:21:24.4677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TpnfGdcx/2fZ5qR6JGnPVzFON3FQuH+Ov8s3ZX6ttOnxD7JKalIsFX2yRXrlpwm9TY/sbn56gQJ4jGloTLlWcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB11140
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTIxMzc0MDpGUEtleTEucHJpdjq1I0Bo6ySadY+sSMSpeWookszEBgG2zNeS91788D2YEbLMHnCKG5VWFgCqv+tIag9qKWZ49T6FtyMB+spGZnf/FV5gLJxed+lwQ5zvyoH9NA7mzv/t3gMTYOxIxKoSgkAxGFtfdmlJHBKuipkH0S0Dmzgfx8IU9AQtVfNu9wxR8eeX52KgvL/d0oTReCcApbPAnBoXPHM1cpYMM+NS4OlrIG7VTfgHod4v6ZscP+Rm8h3MZUIlz2FsQ+Myg2Y3llv4eksPYXM/TNF44ohxwksXJ5Li15bXK7Igeh3citvtNTCH3SCWjZ/Y7Iy0z6ifae4wLrx5f2GJFKlKWpJ3Ko7g
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.112
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

T24gNi8yMy8yNCAxODowMiwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+Pj4gSWYgdGhlcmUgaXMgbm8g
bmV0ZGV2LCB3aGF0IGlzIHRoZSBwb2ludCBvZiBwdXR0aW5nIGl0IGludG8gbG9vcGJhY2s/DQo+
Pj4gSG93IGRvIHlvdSBzZW5kIHBhY2tldHMgd2hpY2ggYXJlIHRvIGJlIGxvb3BlZCBiYWNrPyBI
b3cgZG8geW91DQo+Pj4gcmVjZWl2ZSB0aGVtIHRvIHNlZSBpZiB0aGV5IHdlcmUgYWN0dWFsbHkg
bG9vcGVkIGJhY2s/DQo+Pj4NCj4+PiAJQW5kcmV3DQo+Pg0KPj4gVG8gcnVuIFJETUEgdGVzdCBp
biBsb29wYmFjay4NCj4gDQo+IFdoYXQgaXMgc3BlY2lhbCBhYm91dCB5b3VyIFJETUE/IFdoeSBk
byB5b3UgbmVlZCBzb21ldGhpbmcgd2hpY2ggb3RoZXINCj4gdmVuZG9ycyBkb24ndD8gUGxlYXNl
IHNvbHZlIHRoaXMgcHJvYmxlbSBmb3IgYWxsIFJETUEgZGV2aWNlcywgbm90DQo+IHlvdXJzLg0K
PiANCj4gVGhpcyBhbGwgcGFydCBvZiB0aGUgc2FtZSB0aGluZyB3aXRoIHJlc3BlY3QgdG8gbW9k
dWxlDQo+IHBhcmFtZXRlcnMuIFZlbmRvcnMgd291bGQgYWRkIG1vZHVsZSBwYXJhbWV0ZXJzIGZv
ciBzb21ldGhpbmcuIE90aGVyDQo+IHZlbmRvcnMgd291bGQgaGF2ZSB0aGUgc2FtZSBjb25jZXB0
LCBidXQgZ2l2ZSBpdCBhIGRpZmZlcmVudCBuYW1lLA0KPiBkaWZmZXJlbnQgdmFsdWVzLiBJdCB3
YXMgYWxsIHBvb3JseSBkb2N1bWVudGVkLiBZb3UgaGFkIHRvIHJlYWQgdGhlDQo+IGtlcm5lbCBz
b3VyY2VzIHRvIGZpZ3VyZSBvdXQgd2hhdCBrZXJuZWwgbW9kdWxlIHBhcmFtZXRlcnMgZG8uIFNh
bWUNCj4gZ29lcyBmb3IgZGVidWdmcywgZHJpdmVyIHZhbHVlcyBpbiAvcHJvYywgL3N5c2ZzIG9y
IC9kZWJ1Z2ZzLiBTbyBmb3INCj4geWVhcnMgd2UgaGF2ZSBiZWVuIHB1c2hpbmcgYmFjayBvbiB0
aGluZ3MgbGlrZSB0aGlzLg0KPiANCj4gSWYgeW91IGhhdmUgc29tZXRoaW5nIHdoaWNoIGlzIHVu
aXF1ZSB0byB5b3VyIGhhcmR3YXJlLCBubyBvdGhlcg0KPiB2ZW5kb3IgaXMgZXZlciBnb2luZyB0
byBoYXZlIHRoZSBzYW1lLCB0aGVuIHlvdSBjYW4gbWFrZSBhbiBhcmd1bWVudA0KPiBmb3Igc29t
ZXRoaW5nIGRyaXZlciBzcGVjaWZpYyBpbiAvZGVidWdmcy4gQnV0IFJETUEgbG9vcGJhY2sgdGVz
dHMgaXMNCj4gY2xlYXJseSBub3Qgc3BlY2lmaWMgdG8geW91ciBkcml2ZXIuIEV4dGVuZCB0aGUg
S0FQSSBhbmQgdG9vbHMgdG8NCj4gY292ZXIgdGhpcywgZG9jdW1lbnQgdGhlIEtBUEksIHdyaXRl
IHRoZSBtYW4gcGFnZSwgYW5kIGxldCBvdGhlcg0KPiB2ZW5kb3JzIGltcGxlbWVudCB0aGUgbGl0
dGxlIGJpdCB0aGV5IG5lZWQgaW4gdGhlaXIgZHJpdmVyLCBzbyB1c2Vycw0KPiBoYXZlIGEgdW5p
Zm9ybSB3YXkgb2YgZG9pbmcgdGhpbmdzIG92ZXIgYSByYXRoZXIgb2YgZGV2aWNlcy4NCj4gDQo+
IFlvdSB3aWxsIGdldCBhIGxvdCBvZiBwdXNoYmFjayBvbiBldmVyeXRoaW5nIGluIC9kZWJ1Z2Zz
LCBzbyBwbGVhc2UNCj4gcmV2aWV3IHRoZW0gYWxsIHdpdGggdGhpcyBpbiBtaW5kLg0KPiANCj4g
ICAgICAgIEFuZHJldw0KDQpJIHNlZSB5b3VyIHBvaW50IGFuZCBJJ2xsIGtlZXAgdGhhdCBpbiBt
aW5kLiBGb3IgdGhlc2Uga2luZHMgb2YNCmNvbmZpZ3VyYXRpb25zIHdlIGNhbiB1c2UgZGV2bGlu
ayBpbnN0ZWFkIG9mIGRlYnVnZnMuDQo=
