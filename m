Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879390DD4B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB94E10E7A6;
	Tue, 18 Jun 2024 20:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="nrFurUs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED3D10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:16:41 +0000 (UTC)
Received: from rly16d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly16d.srv.mailcontrol.com (MailControl) with ESMTP id 45IBGUe4005618;
 Tue, 18 Jun 2024 12:16:30 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly16d.srv.mailcontrol.com (MailControl) id 45IBG7Bn456721;
 Tue, 18 Jun 2024 12:16:07 +0100
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by rly16d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45IBG5YD456019
 (TLS bits=256 verify=OK); Tue, 18 Jun 2024 12:16:07 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/8dpMqvZQkFHwpNKwxdXmxL9yOnWWcnSxwuKvPF1Wf1Z1aN2JKUmDNReNJmxpcBNqxCzwY8+kvvJIgHeyMmfi1DcKnYoPVvaFG+C215OSiZcXOp6F/WgohBb+rNowTF7eZyvU+MqHPp9joTU19pSt5v+U5UmpkhajkXumEBV0dA2NZBOyPeHFqWBD7mGoKY2mZTUp9xX4aU5MT6vgTwITEP1cogHtKKAeu7sKAsr3kHeobd/OdPi/cfebXuGWo4LhvWmAe3/+iYKWJdztIRfCkacy5vf9j4TqECSmA003TpOUu05zXdUqQfDO4CWjoiQI4CRUZ0RGWJGUwhWEFB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCQu2x6/7W+JHkRKsgqYAyq7nUpOduwkDLDMzOwVEnE=;
 b=VS841MrtPdyq0j/QyAGNxrOHdeErA5kQfrmdqjdAzDWOMfDwdS0VF0PXJEJMefCJmOAAHt+J1fQ9RT1yXg3dMNKgVAI7CjgFXcXVTIdswA7CsF+VTMCl3siB69IObwDgRkH90Goup+ieor1BSJRlEHlHwRG/E48C6UkAcdED191nEmpv/jAATIzg3UO38vvt6WkC2OSv+EMTMroSCOlkPzmBVMan6Ozb8CYBXRnvPON74sxIhVWN8dv8BqKbsxdWsGAlrVXGPTmet16bWtlbxLY2sWsT+zycUe1dCk7cJIm3TwUtxn/3sIAgEZtVv1bpEonMxrVGFJO7O0HX3xFNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCQu2x6/7W+JHkRKsgqYAyq7nUpOduwkDLDMzOwVEnE=;
 b=nrFurUs4xSWtabPoFtkDbHN0dKm5tJ4zvqa1Qoc22d68hS/1QYJnIpkkvjKoDsEODwKUoNYhCruuMbSSAL69p3fPp5fl8cdzCnR1s5xPrGb3QsjzhhTMly5iZnqOZCb4Hxo2dFUsqyEnsOyeLMvAej7a4XUY9jIxJRk2Oy8Er3zpwCXejJGpDyhdFduGwhmUQgcKz0pdeYfI3Kbaz5ts/rzeecK5v0ucj2M8qSj/SukdXUA354IXinr+NNCh+cuZChp0eDfNmRI/EG6sMFw9zWO+2Fzn+0cvtx5Q/DhlGP90w7hHG/k1/rySjPso9XdjgqTiRAKMzXoS7Ysd377QRQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS2PR02MB9189.eurprd02.prod.outlook.com (2603:10a6:20b:5f9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 11:16:03 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 11:16:03 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Zhu Yanjun <yanjun.zhu@linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, Zvika Yehudai
 <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHIqj8AgAS8uQA=
Date: Tue, 18 Jun 2024 11:16:03 +0000
Message-ID: <df68aa17-c32a-45c5-9198-ea2d9fe2c40b@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <c65713c5-3c76-4869-9c52-12962678ed1e@linux.dev>
In-Reply-To: <c65713c5-3c76-4869-9c52-12962678ed1e@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS2PR02MB9189:EE_
x-ms-office365-filtering-correlation-id: dd263aec-bd6b-4401-0658-08dc8f880a94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|41320700010|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?NXpidEtjaWpwNVJJZUpzUXlpcUl1aXdaRGJvS0lzZFhzaFkxc1JteXhaZG4x?=
 =?utf-8?B?ajhoTXJsZXcyQngrM1BpZ1RlbDh6TGgrL0N0RUNENytKTlhIbW1TWEJjcnVY?=
 =?utf-8?B?Zk5NRHFCOVU5TU9sZVNpZWwwMVoyT0ZDOXI5RVFjVDI5UDBsWXpUZkhndHBE?=
 =?utf-8?B?MjVBT2UxRG45cHYyMWUyc2RXYVpvQUg5THBwR2cwRnY5Tks4Z0VuV1ZJcG9q?=
 =?utf-8?B?dm1xY2tSRWd0MTNwVWd5VlJlUU1wZFJGWHdNYXh0SDhLU0ZVWWxxTm5tY3Yy?=
 =?utf-8?B?Rk44TUphU2o2SkxCZlM1MGdNNVR0NVlPMVR4RGNiMEFST2lWVjJ3VEVkd2lp?=
 =?utf-8?B?Y0JCUlVvek1pRWRGVzdoWGk2SGhJNkJ0amF0SHlrRlUvQUJ1N0NSK05iaVBY?=
 =?utf-8?B?bTBGMzIzNUJNMHdvNEtqYTNYeGF2N0RDTno3K1poQk52R3hoSytEUGNZRERt?=
 =?utf-8?B?LytqVjk3TlFWUnEwa2pDNUlLcmxVQ3NrSHEvN0N1WTJIZlFLTms4Yk1SRW5n?=
 =?utf-8?B?WGZ3TlRvUHgwdnVzWjZESW5PQm1vbUhaNnhiL1FXUWIwKzhoMXlVQWtyUkNH?=
 =?utf-8?B?VENCRXBLbStabG1XTEVRSG95ci9VcWZvR3l4alAvTDNBQWMwSGQyUUFXSng4?=
 =?utf-8?B?a1k4TnVRbkRCVjVMTnpKMHdySDZZN2wxdXR3M0FGQW5tZEU5b1daR1BXaW96?=
 =?utf-8?B?cEJnaUtYTkc5TzRTSm56K041UlFPcDV1S3ZmM3Z4cHJPdzI5eklnc3FLNWgz?=
 =?utf-8?B?UWFiRm8xbXJSR3hmdzBScEt0eGhpTHorMFB5d0tVV2xaYmJTbUFlWDRjVUN3?=
 =?utf-8?B?VnFDa1V3UnhiNDdHUEJ0UkFucUlhUXBCR2hmOVRkdkIzbmQ1TjF3SnpRSXZU?=
 =?utf-8?B?eDhpd2dFeHZXeUhJVzRGSG5tTlV4WjNPZE1oYVlDa3lOMDFDQmp5YkhFeElp?=
 =?utf-8?B?ZTFJK1EvamJ6TENobEdEaWYrNWp1UzYzbmJySVZpQU95L3Zyb2VFeUw3aUp4?=
 =?utf-8?B?eThiaFIxVzFLSHVjUE82Kyt1TklZRllBOUJINFN3ZnVJMTREK0U2b2g3bXh4?=
 =?utf-8?B?ODQzb1JNNURMYWl3eUdKaThiNk9EVmJteE5VTHhSbWZSSmNnWUJrM1JJQnVX?=
 =?utf-8?B?T2Q3a1pDb3lLZWJONXNRREhOQXF2cEcvZTRkN2VkODZVcFNpNXNBK2JFMWov?=
 =?utf-8?B?d3FhVVBvazlmNFJuTC94OGgyb3hLQm9HZEVUUUhScytKQjRRdXR0VnowTXJ3?=
 =?utf-8?B?RUpkTWxWQ0hHME1odGptWUJwU2ptVWxkZmJpc29udjVid041bzBqZE5ZNFY2?=
 =?utf-8?B?YndpTXRUY2JML2NjaGxBVkRoVDZDcWYraVpkOXU2WXljejNyQjF3SDYwbldM?=
 =?utf-8?B?MFZ2bEY1L21SY1BtMGJmY3psK2FpZnlCOXlCRDRMQytEZ3V1YUVwelQ1ZExU?=
 =?utf-8?B?a05JakhPcFFlSUdldndDTm9FeGlldTZvZnhFYmhXTTd4WW8wL3dHRUVDbHRj?=
 =?utf-8?B?M2RVZDl6d3kwVVJnaDNHdnRZNjV4T1B4cnZXckxPdGZFWHdNTnpZTnRDTWJX?=
 =?utf-8?B?RE5kQ216QmZSZk1XS3FQQ1RXeklJbFlIL2VsWE1nSXhjRnFVNFcrcjZudHJO?=
 =?utf-8?B?L2U0eFNjdlZvRDl1d0hiNXZBTGlQNXdIQWs2QWI5QUdrZWRYcXNaazd1dEhs?=
 =?utf-8?B?T0FGQ1ZBeGNEWlJLYjMvbEdQZlRaT09GS1p1a0VvVmFjdE5BSEdZaW0wSkhp?=
 =?utf-8?Q?Lx9L7EkB8XXGbypRfRIbFGpa4JVbWLFXO89ZUtZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(41320700010)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlhjZGNhRTVCK0tCZ0pWN0hIdVlXTXVic2VpM3BFeDBOcGZlUGMxZ2dVKzFS?=
 =?utf-8?B?aUlKNEYrSHhWWldrS1RJaGpPZ0NoRXRSR0J4YmU4bHl2NHMzbktoK2R5bEho?=
 =?utf-8?B?ek1tNGNHWU5Icm5QQk11V0FjQ20rd2dXaGNJbnRuYlpYK0dBZkVMcUxBaTI5?=
 =?utf-8?B?NnBqUXJDODhtVHJUQlgrbStoeCtYOUZTZjVqc0c4Q0w1SEJjVW9BWjd3Z1Fr?=
 =?utf-8?B?Zm1XRUxLbFFUNy9YM2tOR0l4ekVHUkw5NWJLeGM0aTliNklBNFF1NWg1RUVO?=
 =?utf-8?B?MVFVUkROUHk1QVdTazJtVFpDNzMySnBpblhnMDl0VkYwSTBvSU1jZktUMzlW?=
 =?utf-8?B?Y3hZVmk0cFdaVE55VmtaSGtYOGFGMXJHT1IrTHpJaHM5T3pRblZKbGY4RUw2?=
 =?utf-8?B?ZkxvdlNmdjBaaGlVQzRGakx6dHZ3TFRtNTNKZ3BQMUxCWVJZbks5T1R4NWE4?=
 =?utf-8?B?N3VnYmtnUmI1NzhEWFBacC80UzBWcEx3RmZJblI4MEY3WGVHUVVvL1F5V1lM?=
 =?utf-8?B?OGtINlI0VldDaEtBaTJyVVVpQ0lrcjZ0Z1Jqam42emZZZU5LQlJ6bW5UdVp1?=
 =?utf-8?B?M0ZHcG84eUNpaFB5blNFeXEvMytsdHVMVno1N3YrdmpRWUtSTnNHMEhTUkV6?=
 =?utf-8?B?a0JzM2g1VFA1SC9aWUZjWWpuSk5uRTdhakZnWGY3Qndjd2k0RFFSUXB5VFVJ?=
 =?utf-8?B?MGIyWHlJYzJTcElxM2praFhYKzNuYXNScXRxaHNzS1NRT2RjVkVkd0VjNFNI?=
 =?utf-8?B?ekJQWjJTL2VpL3NqVUQ5dXRGd1VadnM5Qmw4Vk8yT2lSKzFyVUl6a0FKcndl?=
 =?utf-8?B?UTBxTkRpZ1ozUnplcFF5V29vMWxPTytLM2Jyc2RJU3FyTWR0U0FqZlNVWlp5?=
 =?utf-8?B?K0FnZ3BuL0VJWjJCMzhyQzVoM0ZPTDlxakhjV1JnMVdoaG1NQXNMRmtYQy9i?=
 =?utf-8?B?OW9xSzFYYXRyMTlkbFdhOFJ1emVJREFKRGlKRStrby8xS1FyanY0OGhoZ04v?=
 =?utf-8?B?UWYzY2Y1WWdGaUdHNUIrdUo2MWJzbFhnK3M4NUM1R3JvZU5tSnI3ZlB3dU4v?=
 =?utf-8?B?RGRoeFlUSmJYbCtkc0g3UW1iUTNLYWZ6bkRsK2lWU3R1bWpOUHFhYXhjWXl2?=
 =?utf-8?B?ZHMxQW9MdEdLM1BkejBUeXNydmRVNDBuWTFPSTFRTDhXQ1lJd1FzbGtlbFhs?=
 =?utf-8?B?TGtpYitDZlFxa0lxMWlOdFp6aEZtbUV2b2VnL2RnSjgvTXc0blR0VTNMYWlw?=
 =?utf-8?B?ZWlFaG5NdEpadDhJT1dDNkZvWThCOWpSdGx3MGs2dUdjUkFjbEtMVXRGS2lR?=
 =?utf-8?B?WFowZVFYQnllRkJqQU5MMUl6dTdOVDNyZTBTRyt2TS83TisxNmZ0ZjBCQmJS?=
 =?utf-8?B?VUxwQnF2SEZHQkNpRFZJb0hkVk5pUE56NlNLQlNrbFE0enVUZVVsTHMrVUk4?=
 =?utf-8?B?WGNUNm1lSVBiK2loV0ZMZUJUbWxGY01oQTVTSENyWFpJTUdJVTdpK1JDV2VN?=
 =?utf-8?B?dlVHdHZNSkhHaEhQRU9OQlVxTFMyaVhCd0REUmp0Tm9pR2lhQUhhK2ttRjM2?=
 =?utf-8?B?UmtUN0xlOXdZa0J6OFZsOFM5bjRPc3RaZnRtL0M2K3huNGxoelByVjR5RzVx?=
 =?utf-8?B?aWdMRWJoT05jZnpNdWM5djNkQ2RjMVZrVkhwODVVV2ZGUzZIRDNwTm92bUdu?=
 =?utf-8?B?WmRQdzUrY0pkbWZQeElkVEFTT1B4VWc1SEZISWU4WlpEV29YZjNPVjZ0ZGt3?=
 =?utf-8?B?aXJ4b2U5a29lb2gzaEoydE9Sc3RUc2Vwb2V4bjRTYXlpS3p0eVJoTmxiRUNj?=
 =?utf-8?B?S3BrVzM0VE15R2x6UlFiNURXTlBTemdab2JZSitsWkRSdnNGWFRINnZZckx5?=
 =?utf-8?B?L0x2aXp5YUtBNjJ3dVlmNWdkWUthWFhzbGJmWjN4WGxjcDJqMFdCSEZnZmYv?=
 =?utf-8?B?WHFmWjlPZFdMSDRWZVl3UVpiNm1LTzhzRE1uU3p0bzJiT3FoSVRIRXljWTdj?=
 =?utf-8?B?bEZvUUlDYThvVmZYMFpRS0xKL2FKbmE5a1BOOUFuaUNlbXMvS2tWdHdrSHla?=
 =?utf-8?B?MTZLZGUxU3U1aW1RZERPNjJvN3NVR0RpajlGckl6dHNNQ1UzbEhwMzNCU1Bx?=
 =?utf-8?Q?IASOpc+Dp7qS+NipWLQFVb/11?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F920DC35158ACB42976B06FB52FE1646@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 76sAQlH9PYpQ7BmVlQyWYVHjvY/EihU4gwThZSubMh7zCJfKJLm0Yj6mmgG0KmUmrpcxLbrPqef3INz1EmLXftFaTli8oDojm7j9G0QIu6MvOXk4TTs6Q7I7wBARmBbyUbzeaJz3WbBZNU+bc9GE6OCRMM/sbGYxitGse3uwOkfBH2y7GoRu/impkQHQMuQGzcVqjpO2qURb1BqhggH2D+uxIWAKvskOmRWqg9g/8iHIgz/1/QqdZKYi8Dg11gbFls6aeJc4a/JfzcDL+0579C/FoOAfj5NgZCaUO7GDlVDfSkFKUJApE9durMf4LUbQtJCGZVccn0CieIc8M0J7pr0Iqj+kcKkrShUND0iSB7LiPSmw2cZm8pw/D9z6csmq7aX4TCu/uMxvckTypYqo32fadFRMKLPtYPMJRc/srNr/+JyTdvXPcjt5+CQARj8LLkkg4A1jMBq49YF3rvPEyyg7O3IgeCAZeXE5cneLMBinsREsioDQSfc14cppJnG9JY1aY0x9hW2Ef6mz/mU4SLFMLVuN470ytWeJcHT1M2EjO9/dtxrYxAUVDeu3LFvyGsLUXmYBgbdvhMihH2OP9Nh3A1SxWRtPxRkvdTtY3idDeM75xthJnx1cOrZuXZyT
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd263aec-bd6b-4401-0658-08dc8f880a94
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 11:16:03.5465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScLm34LKhJwV5UMwvcdb+EGFweMLwhucODyNYIvRxTjU0ya70z4Ts6QCRutWnBXxJcZnfiupr0B8RgZH1L7Rwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9189
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODcwOTM5MzpGUEtleTEucHJpdjqAngs71bMegzlI48cK9kAvGk0cr0ixh8m+qPCVeD+kJgMrKl92Ud1FlMbhvwYo/pXeFWZ0jjrvss3Q7CXWny5506dZM/AE/VBD36igTryBOPdCs2BYKyiZnj4fyUaS++MWqUZZY8o2f4t6WiBm2PNcstrPpsxyNE7kCB598dldMPofZQe3CELloCtSemoMW+oV5MlQLo0K0RIXZPEDwsR+J1BNibWuvOarnGMR+Z6Ep9Ih4B0XA9XwudGhy5dfMvdEmI7QbxU715B1aLvrlNKAyIkNTEhlWDWgxGqqkDbd8EMUSYM9gDq45TD7YuIR2Yu/6fruyvyB6+UjURExs/5O
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.68.1.126
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

T24gNi8xNS8yNCAxMzo1NSwgWmh1IFlhbmp1biB3cm90ZToNCj4gW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSB5YW5qdW4uemh1QGxpbnV4LmRldi4gTGVhcm4gd2h5IHRoaXMgaXMgaW1w
b3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBd
DQo+DQo+IOWcqCAyMDI0LzYvMTMgMTY6MjIsIE9tZXIgU2hwaWdlbG1hbiDlhpnpgZM6DQo+PiAr
DQo+PiArLyogVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIGN0cmxfbG9jayB3
YXMgdGFrZW4gKi8NCj4NCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMv
c3BhcnNlLnJzdD9oPXY2LjEwLXJjMyNuNjQNCj4NCj4gIg0KPiBfX211c3RfaG9sZCAtIFRoZSBz
cGVjaWZpZWQgbG9jayBpcyBoZWxkIG9uIGZ1bmN0aW9uIGVudHJ5IGFuZCBleGl0Lg0KPiAiDQo+
IEFkZCAiX19tdXN0X2hvbGQiIHRvIGNvbmZpcm0gIlRoZSBzcGVjaWZpZWQgbG9jayBpcyBoZWxk
IG9uIGZ1bmN0aW9uDQo+IGVudHJ5IGFuZCBleGl0LiIgPw0KPg0KPiBaaHUgWWFuanVuDQoNClRo
YW5rcywgSSdsbCBhZGQgaXQuDQoNCg==
