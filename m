Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AA90FF29
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773A10E86B;
	Thu, 20 Jun 2024 08:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="n92wkLHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1610E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:44:39 +0000 (UTC)
Received: from rly16b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly16b.srv.mailcontrol.com (MailControl) with ESMTP id 45K8iRRx157051;
 Thu, 20 Jun 2024 09:44:27 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly16b.srv.mailcontrol.com (MailControl) id 45K8hcec140056;
 Thu, 20 Jun 2024 09:43:38 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2046.outbound.protection.outlook.com [104.47.14.46])
 by rly16b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45K8haYV138521
 (TLS bits=256 verify=OK); Thu, 20 Jun 2024 09:43:38 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBxSPPJr5GEgiFqw+8ZigppoAD8qQHI9yEDHypBWuViTohUzRcxU2LxwvLVm5cZaFzCrBLafwkQaBC5do08KVQ8C545im8pyujkubFjLuR6wHbmtQOO/+QHxENioPXLg2xdjU5ZdbS8CXQyBitALAfXiT+FiXhOwmnZWlrGXJHyBBqc08fUradmRfEisrkS2S1AWNOUvQEle4kHLH6jbHSRW9Jmtu1KPZczvLCANA9iCC7mXM2uV2R6DJKfFEPgbrXerzBBg9SqR3rDMaaUtoJ/HmCXT7f53s3JonZKQAyJcz5F7ErVxxXY6NtFxYtkdC9XwIJtSTjWEfQr0wPYeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIOjH6Xs1PkVDxqaS5UKN/c6Exoq7xXzjkWtmHVYoZE=;
 b=H0GC/T4u8sg9hv6HpN8x/ocv/LNPBjGivNfizGBnFjeiK4rd43y/H8vBoYYPB+KnLjqCyDEPBMe8Ik6A3RyP09FGkBvy33r2e9u6lP7OeHlEyylwaGOAuHL/xR3hgmVn1B/wsEIUD54xXEYEvHRWzW7THpgmns29M4bEXDrCrhAC13qA+7GyowSRg/UNhcOvV9u1KSWRISUhCtPJKF3qczVQpN5KMz7biAlS/SOJppDQw+DEiTAp3KY0gUthyW+fKfKoWDTaycKEyPaQfrCJYSGo6JkbRHwIQQu+ZfX/swjP7hckWeUJ9bbNuouALQ/8BTzmcqmd5YndIOh2WItu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIOjH6Xs1PkVDxqaS5UKN/c6Exoq7xXzjkWtmHVYoZE=;
 b=n92wkLHvrE/C7lUUHws0NiVB4a9G7P2F0nJZkHbIN+XE1JNMlTBWXbi/CY94aoDhFzo1Jd/u/b5rlHAJf+IM+GuWHd+wyf38Jbs9U5+9suRz6AEzgNSw3HyBMAdyT9qKMfkujNWpbijnHsPh0NRckCy8lfOfmQpHo0eoMpIIONeWXvXd9JJHoZtmv0ihdUfQELC6co7tQ0iYnuw+8EyqqXOqt08ZQdd5SgqFz8ZTbC1apxwhkS9+24onIsaoQS5zXr7ZQvDLF53vjSv2TDl5dv6T4I0eJqiV3R71zNhP9vTxoDFH4P6PbnTiqw65JsjGaTGDH2KzZuRQaEqT0+yqxA==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PAWPR02MB9782.eurprd02.prod.outlook.com (2603:10a6:102:2ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 08:43:34 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 08:43:34 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHGPFGAgAbik4CAAHs1AIABHDsAgACHbwCAASNEgA==
Date: Thu, 20 Jun 2024 08:43:34 +0000
Message-ID: <5cb11774-a710-4edc-a55c-c529b0114ca4@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <20240619082104.2dcdcd86@kernel.org>
In-Reply-To: <20240619082104.2dcdcd86@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PAWPR02MB9782:EE_
x-ms-office365-filtering-correlation-id: 6286859c-6aea-4a25-7452-08dc91051202
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|1800799021|41320700010|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?UEF4d2o0VURFd3BEZHArbm1aMW40bXNiL3ZEUTJ1am84bzdpK0VhMWdQTkxy?=
 =?utf-8?B?TURCWWh0L3k0SE5RUG56WEFwZUpuRVdTSlFEVXRxZUcwcm9TV0d3WmtUekky?=
 =?utf-8?B?V1dhYTdOQlBYMTlFTjdMczhxbVBnVitTUDlaaUlvTUMzeUUwQTljTU84ZEJ3?=
 =?utf-8?B?cWFQZFJaYjI0WkxpbXpLczc1ZDBrMEJuUC9mT0FwWHl2VitIZkdrMjhzcmZN?=
 =?utf-8?B?ZWd0c2g1OExsZlVJS1pNNVMzWkhVYW9TUCtXQkF4cEhOUE5yVzFKK3VneVE2?=
 =?utf-8?B?TEhxc0s3eTF0LzJ3M2djTEFRcXg0M2lka0JEdG5DbDNvc2YraTM2Y2diSmZh?=
 =?utf-8?B?MTg1SkxKYkFsN3NlYWxVaDZPL2RVcmF1aitrM2pYR3hlUGFNRnJCL25VNTlC?=
 =?utf-8?B?MUhFN0h3LzlLTktSQTBrVWdiNGNmUjR2aUowZkp6YTR6QXoySFBxZmEyMEtH?=
 =?utf-8?B?OUU1TnRIL1cwdFRyNlJ4bDR2eHJWVVpKcjM3STNScEVodWFCanhLaTNmMnpx?=
 =?utf-8?B?VWZINXN6RWpDVzErTkJhU2lVb3NHdkwwMXNObUVuL1RSQTNhMExlRnhycWRu?=
 =?utf-8?B?bEt0T1Y0c1ZLeXJWN0crQ2xYV1dFclk0THlyN09TOW9wNkZENmI5WDIyY2hR?=
 =?utf-8?B?WmZZcnRxV0I3RnU3WkVDMGc5MXAvTEt2aEw5M3NIY0tTLzZHOXB4cHNEa0lE?=
 =?utf-8?B?TTczalR5ZTVhcFIyd2NSRmVNSGwwOFdpT0w4bGg5dW1YdUs2dy8reUpTMFov?=
 =?utf-8?B?NC9BblJ0djIyeGUwaXN3eVE0RURwc3pWTjF3MWwrK1NOUFR2OU5NWTlKalRt?=
 =?utf-8?B?WCs2cVE2VERYNVNjSE1leEVibEJLQjhucTBkbkl1ZTZUc3p0d1NoNmFyTGNO?=
 =?utf-8?B?ME9OZzR2ZkhSWWFQVk96UEpRZGtRdDQyYWhxc1BIVk5seEp6U2FabjJpOUN2?=
 =?utf-8?B?cmZjdktNWUpwMDhyamtITEs2cXNwQVhJS3FZYXBNd3pVbHhDZVJlcVBzRldC?=
 =?utf-8?B?aFMrVFo0QmRwcG9BU0FaSU9EWVM3czl5eDM5V210UFM1OW54eWY2ZmJLVDg4?=
 =?utf-8?B?MGdxSmZ2ZFI4c1FkdDJPb0R4bjVXZ1lJTzZVbUFNbTRGVGFmZlE1bFZnOWVu?=
 =?utf-8?B?UnJ0SEdJK25aZDhVbzR3VWVwcEtsZXhHZU94azFZV3U1NWZxSlkvNnJWRXM0?=
 =?utf-8?B?bHNzZVNxRHVobHgrRGdKSFBPcHFLSTM0K05DNDM0d2t3TWRBMHhZMThHYnhL?=
 =?utf-8?B?NWtpU2haV3lqNERtNitYVGFqNEIzMzN4U25FdGlQV0ZGY2NBeXE1U0doS1o4?=
 =?utf-8?B?TkFXUnN3TGtCWEZNMFFjNlZ1ZkVnUVZvREZtTnNaVHlNZUM2ZnY3OEEwR1RW?=
 =?utf-8?B?TzluZVQwZ0Y1M2JkNy93VHgxK280REpIYUJMWVIxemdKYXRpR2tsMDBrUlRY?=
 =?utf-8?B?RVVnM05sTFF4TmpJVUNvbnY5RGdWM3RNN1QyL0R1eFFjaGxScUlMZE9qYlpx?=
 =?utf-8?B?OGU5U1hZaXdNbml4L1IxZnhCdXhhQk5KdFVSekpyKzk5a1c4MzBZdVg2N1A5?=
 =?utf-8?B?dG55TWg1ZThJcWRSTmxTclNMUi9Vek41RU8zc1JvNzNzOFEycC9lZTdna0Ri?=
 =?utf-8?B?RXp0S0tBVmtNbWpFWGIxcUFCMVg0ZlI3UmlCbmlyOFlrMlFqOFVJQ0cvSll1?=
 =?utf-8?B?UVd0d1Fod2oxNzJqa2lnOUtzN1dwR2c4amRhUDg5dFIwV3dnZVFLT3A3OTE0?=
 =?utf-8?B?ZzE1d3JhVDZjYUkzdElRQ3JrSnNnbmhkQmViUW5pOGN5WFZhMnZWNERmS2Jr?=
 =?utf-8?Q?aXjjNzd8TVbdrMa+UyArrFNo6Fae1vY11+lsg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(41320700010)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1FIY21RVjZuTTBJU1Q5cko5RFVIWlVuS1hOSWZLSTRCUkxiR1ZjZmFkRFpz?=
 =?utf-8?B?cW0ydngyaWtCcU8xYm80SkNJTDBpZ3F1Qk1mclo2ZElpQVlZT25ENm1WMGQ0?=
 =?utf-8?B?ZlA1TTJhNk5VSW43TEpOYko4ZGpGYUpUd2ordHR6dlQ4MUZIU0RqeU9WRTE5?=
 =?utf-8?B?ZHFoT2kzMUs3V2FrSDU5Y3kxL3c5K2ZqdnhPdGlrMzFKd1kwL1VIRmFGVmF3?=
 =?utf-8?B?eVdSWFpnL3QwdmplWlh4R1p3dnpXNFErVmlpMlJQWFZLSmRjZlVVM3ZCY3RI?=
 =?utf-8?B?MDJpbDRNTzdlWGwrNGJpaE53TG1zYkQyWXFUamFaaXJQWS9oVGg5K0ZyK25U?=
 =?utf-8?B?cFRHM2ZPa0xPN2llb2orWWllT3M5WWtxNmpwci9IazZMVmFGSkFmaG9wTVdZ?=
 =?utf-8?B?VXdMNHJxV3pCOXJRV1IyOTNVM3A5ODlpY2xNR3EvS1dZVjlzTFNPVnpGSjRI?=
 =?utf-8?B?L1YxdytjWExWN0l3NC9GcHNPVVdCQktlaW54NEppdU5jLzNBejdLd0VCQTBv?=
 =?utf-8?B?RXN2YjFGK2d5WHNVQXo0TWlGOGw2UmIzOWFGcmpjcmkwK3cvOEpXQUxHOFBG?=
 =?utf-8?B?TlRITDJFT3M4Z3l2QVFkWmpsanNKVnMwZ3hJRzNPdGt4ZGNad2JIZUpSUThF?=
 =?utf-8?B?S1dFYXp2OVVqWEptZGIzV2Z3SDJsL1pvR210VTZmU3ZqelVLVEN1ZXZkRTRs?=
 =?utf-8?B?ZjhQK2NjZHc0WC9QdFhyR09tU0FkMnp4Q29rUjVZWE1QVnNjUnVzZ2R6bTQv?=
 =?utf-8?B?amFrRWZ4bVFabER2M0xiQW1JN1JQME1oMzBNZkZFY0NreFlvUHo1cFF6NzQ2?=
 =?utf-8?B?STVpRVg3MzJHd0h6d21nUGxUN2tURDBYbFlBS2tzV0tNd1ZPV2xrOFRzMGNa?=
 =?utf-8?B?dkl4OWVkVGFlSzdXYUhaM1ExZ1VnYWNRTExFcXBseWdlUnd1eVB6bkYvcndu?=
 =?utf-8?B?ZDlWamJrZnBGZHJzZExxMnNVZk1KTE91UVo4YlhRN0R3dmp6R0FwbnNiZjFC?=
 =?utf-8?B?Sm9JYWtYbzBMV0hiUVVuSGI5bDgxOE1JSWJKNEJqbUF6blovSmprWE9YVFJ1?=
 =?utf-8?B?NFNHMi9qYy8rdjkzTHEwbzhRcjd0WHRiSUF2RTROeXROemxIQStWdXBRdTBH?=
 =?utf-8?B?cHI2Y0s3N0ljZTlvQkdJRzJiZmtZOHIxUnd4U3NhUXBYVURxWnRPZmtvbk54?=
 =?utf-8?B?aVV5a2pjU21Od2t5UWxIYml0K3ZKVThrMTByS0lGZlM0RC9teS9rOGo3TVdz?=
 =?utf-8?B?ZStsTjhBemdWTHYwUFM4djlVSmRQb241VStEbnVtd2ZPeklEZ2w0U29LYVFZ?=
 =?utf-8?B?bjRFb08ydS83cHgvYVUwdVEzb3h1a2dhVU5RQUM2Z2liU29lQlZDWlNDa0FH?=
 =?utf-8?B?OEtjWnhrNlNVTVhCeDlYMjhRV2VkcVROZW1VMHdTbWVZSGwzZ2lWSHhTbHpv?=
 =?utf-8?B?MnNXZC9xd0lvc1MvWjVaVHFoU2RZRUtNQUtwTVNGSVlJYVNPWVhYbzVFV0xV?=
 =?utf-8?B?WkpXKys5Zm5DL1BEN1VSUDBFZzZockkzZEdiaXl3VkJWenMyakFlTkZTRVpy?=
 =?utf-8?B?RXp0QnRORGJ5YnM5UGZPRlduWjdEdVZxZHA2dTZ2eERFTDVoSzZQblVoRmUz?=
 =?utf-8?B?UEV2ZW41SEZSbUtGaWlSazZNYVNLa1V2V0lMaGNjenpXR29rSFRHRUhLQTlq?=
 =?utf-8?B?azhqZUNGcGs4aVZJci90UzN3SW81ekFZNXFsbEdkYlRKaGdCZWpjOStUZWZk?=
 =?utf-8?B?aXNvR2NtbVhWeHJydWsvVngrdG45Z05EVWZJWnl4RnpFTGZMR0N0WFV5N1Nn?=
 =?utf-8?B?c0RkNFpmbHN2TDFOcHRtajZoM1JnUFJmREk5ZGRXcXRqOG0zTEZhMmJDU05v?=
 =?utf-8?B?MnMvYzV6SUpnMHNDdnB5UXRCWkhNN2RFOVdNbHZWSmljcVNFODhOSVBGMzln?=
 =?utf-8?B?UkNYaFRIR0hEQjRqOE55NGxxY2FnZmZmSmxsT28wT2VheGpqK1krdU5HbzBo?=
 =?utf-8?B?U0hzTXEwYWQ0cjFwWmJJNDlWUi9Lclo4UU96TDFyZDk3VmovNTFCM1MweHZp?=
 =?utf-8?B?RldEZ3gzdGM0R2xRL1NqZFp3N1RCWXBsR1pwQ1VGMGZubUVxcWZoYk4xMkRl?=
 =?utf-8?Q?YTKISrWAbQoAD7lxCuivD8cMG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D3BC203FBCE4646BBFE6CE82A51A5D4@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Zkbg8C3H226PDCljs3Gk4f2BoEmsLWCa7DbKcvH57TqWntNf4RccxU6f73o4N8xNG6a02BFZNLK2++ttBSXtq6kzrCQQMFCMD7P8/aqBT6n10OxaG6YClwNetxRDARUarTEg6TDuzccadDc0rNMmrE6greNPnP8L+ZfhyoBrWoCJEZxez1oaprJdm1nIv1ZR3Sdv4dQ3AwlPQuiHioDVkQvJrmI9Fqrv78SOJ8ZKDzCvNs+/mney/z60rPnVWa/zcNrZqzKNMa553bH7Sr9Qd1R81ME98t+mkLBULe5pks9R+Bl/fHGYGRiFk8wphbtF5Omyu2HznSCj0ctTq1CJnT+7raF29ybgf3gUKBw4wBKR4nxe+UNQXG+1z78ApkxS71ANMAqeVECsCTDn62XD/oiGb6d94HVijZALgLYu+WCiF0CaGzLW7BqUqStfRiSDUA0DszM/YCky5hXF0q86REvU2j45XaWsTv0Gmj9Yy8xlckDvCs1djuXvVWgEk7e7um2YX8CrGIvXypLQWBJuDFbzKA0jpvuSy02nBsbuGjI2fH9s0Xzq2YfHCTAymuAPgXS6tCvK+nbvuBKgseemNxH6XtY92ZPhkN6I754TmPKy7Hpm/snsWVg4F9EUgvnY
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6286859c-6aea-4a25-7452-08dc91051202
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 08:43:34.2549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEnXCs1OG87s15wz2ZVZwjEzu+PwLzF44WLfdHSQOOse0rghMvTBFiXHzTnDT1IijsUEvh7478IoQJwodK2Q8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9782
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODg3MzA2OTpGUEtleTEucHJpdjpT+UoKwbV7AA32XWZmbS4ok7R2U3hV0GLRLWgECCUOyMW7oiWEd5DTD5ZaAkhZVcSRshlE4C0Jw56LzeOYbjXCPisG8ByMNYboSB+iigTFD+hX9iHSjWjlJWhKrAmRTwFBT/VhtLpuRconI8134kCaCUltOYVw0hVdyHoI1rls6Pi5aTDqp3oI0mPaU5ZU8ZQ/QHRLjxKY1dHCxNVuEcMx5eT7wfufbnMniqr5Q+sUHPfOoFIB+REAlbw1UDPxIY9GPi/D78+2phlZ2xwJ18h00VoxpTRcC15JWnlk0SJJsy2QUc29aiJEovvNPdD3mm88oRzF1KKrXDRoNRXqDnnH
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.126
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

T24gNi8xOS8yNCAxODoyMSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6DQo+IFtTb21lIHBlb3BsZSB3
aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGt1YmFA
a2VybmVsLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1z
L0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiBXZWQsIDE5IEp1biAy
MDI0IDA3OjE2OjIwICswMDAwIE9tZXIgU2hwaWdlbG1hbiB3cm90ZToNCj4+Pj4gQXJlIHlvdSBy
ZWZlcnJpbmcgdG8gZ2V0X21vZHVsZV9lZXByb21fYnlfcGFnZSgpPyBpZiBzbywgdGhlbiBpdCBp
cyBub3QNCj4+Pj4gc3VwcG9ydGVkIGJ5IG91ciBGVywgd2UgcmVhZCB0aGUgZW50aXJlIGRhdGEg
b24gZGV2aWNlIGxvYWQuDQo+Pj4+IEhvd2V2ZXIsIEkgY2FuIGhpZGUgdGhhdCBiZWhpbmQgdGhl
IG5ldyBBUEkgYW5kIHJldHVybiBvbmx5IHRoZQ0KPj4+PiByZXF1ZXN0ZWQgcGFnZSBpZiB0aGF0
J3MgdGhlIGludGVudGlvbi4NCj4+Pg0KPj4+IFdlbGwsIGlmIHlvdXIgZmlybXdhcmUgaXMgc28g
bGltaXRlZCwgdGhlbiB5b3UgbWlnaHQgYXMgd2VsbCBzdGljayB0bw0KPj4+IHRoZSBvbGQgQVBJ
LCBhbmQgbGV0IHRoZSBjb3JlIGRvIHRoZSBjb252ZXJzaW9uIHRvIHRoZSBsZWdhY3kNCj4+PiBj
b2RlLiBCdXQgaSdtIHN1cnByaXNlZCB5b3UgZG9uJ3QgYWxsb3cgYWNjZXNzIHRvIHRoZSB0ZW1w
ZXJhdHVyZQ0KPj4+IHNlbnNvcnMsIHJlY2VpdmVkIHNpZ25hbCBzdHJlbmd0aCwgdm9sdGFnZXMg
ZXRjLCB3aGljaCBjb3VsZCBiZQ0KPj4+IGV4cG9ydGVkIHZpYSBIV01PTi4NCj4+DQo+PiBJJ2xs
IHN0aWNrIHRvIHRoZSBvbGQgQVBJLg0KPj4gUmVnYXJpbmcgdGhlIHNlbnNvcnMsIG91ciBjb21w
dXRlIGRyaXZlciAodW5kZXIgYWNjZWwvaGFiYW5hbGFicykgZXhwb3J0cw0KPj4gdGhlbSB2aWEg
SFdNT04uDQo+IA0KPiBZb3Ugc3VwcG9ydCA0MDBHLCB5b3UgcmVhbGx5IG5lZWQgdG8gZ2l2ZSB0
aGUgdXNlciB0aGUgYWJpbGl0eQ0KPiB0byBhY2Nlc3MgaGlnaGVyIHBhZ2VzLg0KDQpBY3R1YWxs
eSB0aGUgMjAwRyBhbmQgNDAwRyBtb2RlcyBpbiB0aGUgZXRodG9vbCBjb2RlIHNob3VsZCBiZSBy
ZW1vdmVkDQpmcm9tIHRoaXMgcGF0Y2ggc2V0LiBUaGV5IGFyZSBub3QgcmVsZXZhbnQgZm9yIEdh
dWRpMi4gSSdsbCBmaXggaXQgaW4gdGhlDQpuZXh0IHZlcnNpb24uDQo=
