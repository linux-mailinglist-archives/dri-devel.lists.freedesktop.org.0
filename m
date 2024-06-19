Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956790EAA5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 14:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2A010EC7E;
	Wed, 19 Jun 2024 12:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="YyccIICa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52A010EC7E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:16:29 +0000 (UTC)
Received: from rly03b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly03b.srv.mailcontrol.com (MailControl) with ESMTP id 45JCGLZS019011;
 Wed, 19 Jun 2024 13:16:21 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly03b.srv.mailcontrol.com (MailControl) id 45JCG1fE015157;
 Wed, 19 Jun 2024 13:16:01 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2105.outbound.protection.outlook.com [104.47.11.105])
 by rly03b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45JCG0Lx014323
 (TLS bits=256 verify=OK); Wed, 19 Jun 2024 13:16:01 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/eMfq/HvGyoH/fhp6Gt2j0CA2o24U2AEl+GDlWPmR6vU4KOniIGzWlSBGS0HPJs1Q67oO3u6hmzBAhfJlpR9tHjrSt24N4H2N/Voc6Exj3+jXoJ4mdarTHNJl3wPyJ5b4m0E6pzOzKLzCF1s40LMiExJjAHBQ42f4IS7ErRPXJ3KTDOzCqYIqvGBApEy6FyUDXetrJs19seanBL4s0sN2Cm+C9E5LBl0+pis6X7RKzeZRGzY+NFqNJCPekh7sGGLs1l1vTo+Fa1lYa1TooR6XZXXoXnrniuZ3hVSMOfcjJvDkd1RkCUAKNkEBq4hwQUR3IubOnElMvU5jlSRe0R6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NvwxH5lIROj3aoZYJ69CqdQXEOBE9EAro1Kdl60Ovo=;
 b=eCk1oyEPFmb8FR6iOMB/+A5CiCShaS48AtEP0htBOHEZaA8TVP9UbMk88zyo9j51f+Hu8zycxNvzNqFVSvZUFh+GHySKJboaVp8e8owSKD65Ko2EOU0anL7neMMMZUIg1SKhMp7bbX4xFuSpshyR2caMcwprsCohdOVk9zNip2cST/nQKinMAovKxryu3E3Hsy8nqalISlyc3PtArkz97X71BcTUUNLbGnxFA6faJ/dgVtkpPBoODe0J1Dyo55/pQF5N8/hSyHaVCXUBdXS1W8Q/4J/Cd036BCnz/n2anMB5d2AvqqmQmqgjHWIfGoiEi3nIDt0UVM1XZvoNBsgyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NvwxH5lIROj3aoZYJ69CqdQXEOBE9EAro1Kdl60Ovo=;
 b=YyccIICa9F/y6mkG3b1NaDR7ftiwFMinUAv5xhFw1O41rYAhYcWQqdlABeklWOij1PXH4EKLHQswx67S2gPpbmKpaks+lwQSbzhb1K8OlP645GzIrC+LaJkxEJEXiTn5jXstdlBJPNCNae7XIJg6bHou3Qxrmo/HZfe5uz1LlMDcEMM3t9e2cyE2jWxHX7qOwjkTa97ACRWkOtYXWQhEElS8mO9AllnDxFZMfMa/jk6TN4BFZiIUSIW5XlAI8HXR2NJt8dyV7wmNpXtOOHNgpYAjtMegGnilmjwqLDhyJzfE4ydz2XIampPFje84mJC2J+ewJKKxuNvuMi7/YImJzg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DB4PR02MB8728.eurprd02.prod.outlook.com (2603:10a6:10:380::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 12:15:58 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 12:15:58 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
 <andrew@lunn.ch>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHGPFGAgAbik4CAAHs1AIABHDsAgAAMiICAAEcwAA==
Date: Wed, 19 Jun 2024 12:15:58 +0000
Message-ID: <280848c5-6721-47f4-8b39-2ecd4851da4f@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <95549a6e-b2db-42d9-af94-dbc5e5ddcf5d@intel.com>
In-Reply-To: <95549a6e-b2db-42d9-af94-dbc5e5ddcf5d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DB4PR02MB8728:EE_
x-ms-office365-filtering-correlation-id: 3027ab5a-4460-42e2-b1d8-08dc905993f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|41320700010|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?NWdLeVRXN3d5S2NvMDBCb3B0K3lsYURnV2FTV29JdUZHUTNkdFQwcEQ4WW0x?=
 =?utf-8?B?TkdwQnJ5SEJPTlUxTWVNUi8zdys3VGVGTmJoVXl4RDQrRFd6ZWtmWDZlUE9K?=
 =?utf-8?B?R1lPUFkrU24rMytta3B6cTg4MTh0TnlaRXpBZ3RIR25iaDV4N1o0aHZYTnRY?=
 =?utf-8?B?THN1NHY5R2lpNlFKbW4vcVBlK0dyQytic2JwUWQyQ1VvMlBNbWNEMHpYSlRu?=
 =?utf-8?B?VXZGWmsvTTdlRVlEb1lkVHN0RkdIYlZ1aVpURldXQksvaWRGR3UyMGpsbmQ1?=
 =?utf-8?B?V1hIUkRHVFBGTnp5Y0svbTJyU2FmUWtPWDc4UWs5TkVVNExPVmlJMXR1aDhL?=
 =?utf-8?B?RjRjdVZVU3IwNXMydGRrZ21wUmRDcTM5NExEbzRMRFRCcmkzaW41UHBDQkxy?=
 =?utf-8?B?c2VvVTFwQU1qc0MyZWJ6M3R3d1Jnc1ZxbkNWTTN5bWFzT3E0UU1YNmpIL0lI?=
 =?utf-8?B?b0tFSWZSOXdiQ3IzbXlPQkFtWmJ6WVpuem5wWVNDTURWVU9JNk1XN1h6cTZC?=
 =?utf-8?B?WVZkOE1VWkl5czg4TmRKenVUY0gyWWZOUDM1OEEyaE9EdDU4US9aNW9jYnJG?=
 =?utf-8?B?eFh1d2M2WW5vc1p3aWNqSlI4VlNqeDFYaTY3MEhOemwzUkU1ZXlsOFJNYVVx?=
 =?utf-8?B?WjhvdTV6aDJUcVhSWStHNW1Iekw1bnhUQ2IvTys5eVBFVFdnbXI0Y1h1bkxz?=
 =?utf-8?B?ME1IQkxxR1RsR20rcE16bnE4cWNVOGhxSm5PTjloKzdMWUJRUm1vTGVmbm5U?=
 =?utf-8?B?NjZpQitISXRaWnhYYmlXd0pvdE9pZkw0blBUZmVTWElQdUFWbEdVZExBczFJ?=
 =?utf-8?B?eDY5bkN6SzR4RlVGbTFuSW4vOElrVUw5ZWFEaGpqVm5xOC8rZTVwUDVTcE1X?=
 =?utf-8?B?OUFxTFJLb1RWQXNQRDQ0dDBXRURqZHZGRFBoR3NEdmRCeWZxaXFLYUgwd21D?=
 =?utf-8?B?cjZKU0kzWjlqWHB6MENIVGxsbXV3ekFGV015c1kydGpiMXhjT2dhVVROd0Jl?=
 =?utf-8?B?ajFYdVpFWHJsa2IrM2ZRbmxOMlZzZzRsTThya0Z4L2VFTnZoWkJDV3RmWHpF?=
 =?utf-8?B?V29IMjU2S3QrR0p2RXhNMFpYOGt3eFFWN3ZZRjlxeHEwWUNOUmFCS2tPLzd2?=
 =?utf-8?B?Y0RrNDYwQzYrcG81Q25ZVjhjdHBSdXpSL2VLWEFiajZGa01oaFlZUUo2Z0Jr?=
 =?utf-8?B?MGJBRTUwUTRRaTRoRGVIZlJ3YS9wbG9yZVgvOThCMit5RFZhalRsZmVyYWdU?=
 =?utf-8?B?MmhhOUhBS29SVkF3QzFCRmFiZ0JVbnZMdDRSZUUzRDB2Ujl3Zlk1MzNHTDVX?=
 =?utf-8?B?RHVrZndNZlFvOE9PNlFQck00U0VCaFExTEE3Wmd2WGM3WjMwU29sb3pjRFBa?=
 =?utf-8?B?cFZ3RTFOaFR5T0RxUGtPTG50aXJyaHQ5ZFJrMVlFZHBHZS84UHIycTM1NHY2?=
 =?utf-8?B?L0FnVndsYUkyMWVGbjR1bG0zZkJ0UGVvdVF5dHBNay9PN0lkODlVVzJNM1Nt?=
 =?utf-8?B?aHJ1L2JSTXdGRFUydWIzTjY3djMvRk11ZVh0enlLTmk0T0FEaExWL1hOTWVR?=
 =?utf-8?B?ajgrM0hoY1REU0c2K2wzUmtjUHF3TDZtcDVXam9BMFl1RHNtZWxXUEgwZkkw?=
 =?utf-8?B?TTRLcVllK21CRllmT1JLcXpONVZRS0lKWmFmYmFVSmIvWFB0RGVYSGtNNm5q?=
 =?utf-8?B?ZUdJS05wV1IzK1dPSTM0dlV0VURrZUJZc21yenoxVU9oSHJoSndwZWFvTzV5?=
 =?utf-8?B?RnRaTWJiNmpOclhJc3hQb1pJdzYrTXZSbnBMRHlTaW0xRUY2VXhHa2dNNDJC?=
 =?utf-8?Q?HY2fl+Q8f9fFg6nuPwKa+7m3McOgq0Dnp8hDc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(41320700010)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmNqdEI1NzJMaS8yYWVQb29rYldxVy92WjgyU0wrSUtUZVEvdXZwOE52VWRZ?=
 =?utf-8?B?RnY4OFA4WkxFNmFqMzJndFM0aVJhck1YUVFIUk8vZ0hCaXA5Mkc4UkZyMkhE?=
 =?utf-8?B?YUFhNHQyRGlFS2dqL21ZWGt1Y2ZSY0ZKWTZRM0NKTS90UHJZT1B5SG1Zd0Y3?=
 =?utf-8?B?eUNUT2tRUE1rcmx5Tk42Q3N5WWJpWGUzcnF3TVY3dUdzQnpiczNzWTZWZWZI?=
 =?utf-8?B?NXkzc2hIMDVZK2k5US94V1RWWGtQTEVna1gxNCtXVHUvelVvYjhydGFoaDNJ?=
 =?utf-8?B?QWFTMU9mNjJ0RFlSUnZEUFYzeEM0RzlLUE1kSVo0TWZTTUdRQWpjRmJZL3Mw?=
 =?utf-8?B?NHVNaldvYzd5cDRsRU1NUlRubklIOWJVYktXRi8zYjhpZnFUZzhnODI1enI4?=
 =?utf-8?B?d3VQNFI2REUzMkVOL05uZHRFMXFseForZGVRRmRIZGdTeTFtdG5ZcU1pbFRp?=
 =?utf-8?B?SWJrVjBoNXc5dlhVZTY0Z1l2WFA0VWdZcmJkWWZGbGhpdlV0N25hYjMyb284?=
 =?utf-8?B?K2RUNWtYcGg5Tm9KQy8vaDRsdWoxY2ZSMy9VczhCYkZxRUFtS2Zha2pZeDlx?=
 =?utf-8?B?dE4rYkdNWE4xZzR4b09Ba2JuN0FmTzFMYkxZQy9ER21vODUxbWNjdHVPeit6?=
 =?utf-8?B?YStLd05NY1lPdEY0NHBiSy9zeGVKaWdtZng5ZnRwYmp2dnhZdEMwWStMakYy?=
 =?utf-8?B?L0FtdnNnbFgvNGFnZDlkSVJBYmh2Z014ZlJNL2l5ZGFsZGZhdlFYc1c5cHlr?=
 =?utf-8?B?ck8vRzBab3pVQjZVZk9EbUF1WUJ5NFRQVWFUM0hHK0Z1Rmk5cWs1MUcxSHJJ?=
 =?utf-8?B?UGxsMU02djhxT0N2bnlucCt0TTlnOXdqUDVzUG5lbVpUUXFrRFlrenhyZ2lK?=
 =?utf-8?B?enVocEU3dE50T0s2bDRROHo4UU45cFphd2k0V1B2VEhvVEFuN1RSaVpWbWE0?=
 =?utf-8?B?aFA2Wms1aWI1RHg5Zm5XRnZMYWZHaWxBQ1cvS1VyeFBFY0NGeXplUWE5aFRS?=
 =?utf-8?B?eDIzaG1TbnF4QndlcWEvc21zclVvditTR0RCRHNuVDhYdXRsbUZlU2N4cDdK?=
 =?utf-8?B?N1VQM01uVTRmVFJQVVRkQkJ1d3EwTUVkVW8xNm9SM0pSMGt2VTdOSTRLbmd2?=
 =?utf-8?B?RHlqRFo3VWZOemJ0SEgvK3ExbGh3anhFYjhpaDdJaEF6VVNoQkJFeGZJdnQ3?=
 =?utf-8?B?a2RLTTlZNHpJNFNmem5KQTZwdC9MeXNsQk9kS1grK1VCb09QcXl3M0YySjFW?=
 =?utf-8?B?RjFJZnRJaDhmQWIwQ2dwdVcrY0ZyQmw1SjkvcTFoaDlMTWo1dlp0WXBTai93?=
 =?utf-8?B?aWZBWmRVZkNyQ1hXZWhsSXJIeTVjN0JyRnJOWG1SRmdROGxWamswWXpHNzQ2?=
 =?utf-8?B?bW5aZ2hvampoWUJjbzd3MnRuSkswRWxnUklnSGc3a2w4R1BqNDBNd05GeWZz?=
 =?utf-8?B?VGRHN25RaEJXbFZBRmNxYnFqZlFVSi9KT2MrR2xrd1Q2OVBLV1VaSHhWMFJF?=
 =?utf-8?B?Y1QvbGxuaytwZUtuU2ZwTUZjMzZFakNiNzh1VThhNm43ZUE1ald4TkJhcVpX?=
 =?utf-8?B?SHF4am1TM1dxMm1NSzJBKzhEZHV3dG4xdGJHQzh2V1E4N1gwMUh3WlpkdkJL?=
 =?utf-8?B?QXJpS1BhdHR1enhHRU1GMnN2NG9UaDRUUUcrUGlSRnZKQS85elBnMCtnRTVn?=
 =?utf-8?B?RVNLN1ZnTWRIYisxZGQzYjVUeWpCQnA4T2R6U0h2QWw1S3hOd3oweHhvQnEw?=
 =?utf-8?B?Nk02bmxKeG5neTRmZ3NiVk9CV1RYYXo4NWc3cjkwL1lkZUlteVNrWTgvVTFH?=
 =?utf-8?B?b1lnS2orUmtzOVlTeWpGemdacHd3bEcrWlp0aXBUWjFIT0ZZQkF1blYybmdI?=
 =?utf-8?B?OEVzWlgwOWh1UXBnYVhHVkhxZHBXSTN6VFNBWmFhVEdZZlFTcFZSc0xrUkd5?=
 =?utf-8?B?eWlyU2prNFVRNzVMa3FVS0RLYnFPQXVSZkZpZHd4cmwzTFNaNW9WYmhvTXoz?=
 =?utf-8?B?c0lEeEJMVlpSN2NUNTY3ZmswTm1JVWlJaDU0RTZZWmQrQzBmWkthOTIzODJq?=
 =?utf-8?B?UGJ2SURhTVpsNFlMUlhySHRxblFDOGZGTGlzN2h3aWJxT0Y5V3FZWE5jVUZM?=
 =?utf-8?Q?pRdvMIacuoDLQspAF5Jq1oVEE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAC8FD9FBD713D458E4197102BFAE0F9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LOfLac8zN0YSBxte/Jh5stymgOOc1sTzdmPrfskgHLqxsMSOBXf2zFXTj6fAEfxxJL3cOUyuhSc6vTvqgTl8vo/MiWIL2bf6BnwUSMAkxlVW0xDcZ0sRPgRGzKR8sfgj4XCb4JryV/voE2QgHYMJ2Yq7WWFxdFcp8Fp7uNWimM/ZqGTBw1UppEfLTbcfmanyEKQHnVjxyU8x/Q+RA4IIx5Lbj7IXB8I96TXYMndomP17ncrEOhTM7G/I8wvqcTQkM9JOtieW2Wpa5XyDQOh5/xXmuQd+vrSRb7hEsf75jJNlp8JWTYr/jUA0I5opl4XjItTGKzmWwbaYwIJZ4UapHHTby2pgh07G4cRfhqhhjrfJFPQpsQs89IlIr6ESRvRLoDZJbBVJW/uMyb7Wg6glmnWAqlkliwvI6WO9g2Z2fBmGkBGKLGEyndUaVGMzqSQ3FEafc6why8EvwentUdgOKDEVvfjw142fOuuudFFa25IUx69uhjL2+QMd+EhPCREJjF+Jx7SMVXoxOqFOYsOJ6/387czvTudvehhqFHF+fcE4JvO6gAtpQOQC7JTaWUihZSczIJMAg8o1QKKsFQJubqNApmS8eHo5W2+4kHNLCx/2hz1YffhNp/iVuWrFcHNm
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3027ab5a-4460-42e2-b1d8-08dc905993f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 12:15:58.8225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qe6eNdrt8yHcmiIUzJJcxLZwbzmviGTAcb8Y3tvLXbJ17tF+xkHNYE3oRI6TQFXQ+yZ61s+vpoDJIhhKxPDewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8728
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODc5OTM4MjpGUEtleTEucHJpdjohRtvqwcNrdXHFChU2vDtnsDh5lWyIrFbt7xbbKcRETiZktGc7gDp9D+z2bI+cAsA+FxM/HIK9HC/avN35Q+nMv4kcyUdyO+lvnsXbNErlgHBzNMDL1+Kjpa68yfcy0O7VShZXJa+DktKuBy74BEUYDsbEwfHOq3q35vJzeKHwyJre50wQtQ+Q/junFMN77AEOUiZlE5sUSARILLE+YKNCuqS7ovYGmXAyak10Oshrq85CUYdL3JgkH66vYlwLGGW4dVKRkqA4Km2+xMPaWcveH1P5rF4Cz1E6NIJIgFR0StJG9BpGjxtzgLgtQIsLFrU86IPBMw0lf/ltua9cler9
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.113
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

T24gNi8xOS8yNCAxMTowMSwgUHJ6ZW1layBLaXRzemVsIHdyb3RlOg0KPiBPbiA2LzE5LzI0IDA5
OjE2LCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBPbiA2LzE4LzI0IDE3OjE5LCBBbmRyZXcg
THVubiB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0KPj4+Pj4+ICttb2R1bGVfcGFyYW0ocG9sbF9l
bmFibGUsIGJvb2wsIDA0NDQpOw0KPj4+Pj4+ICtNT0RVTEVfUEFSTV9ERVNDKHBvbGxfZW5hYmxl
LA0KPj4+Pj4+ICsgICAgICAgICAgICAgICJFbmFibGUgUnggcG9sbGluZyByYXRoZXIgdGhhbiBJ
UlEgKyBOQVBJICgwID0gbm8sIDEgPSB5ZXMsIGRlZmF1bHQ6IG5vKSIpOw0KPj4+Pj4NCj4+Pj4+
IE1vZHVsZSBwYXJhbWV0ZXJzIGFyZSBub3QgbGlrZWQuIFRoaXMgcHJvYmFibHkgbmVlZHMgdG8g
Z28gYXdheS4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEkgc2VlIHRoYXQgdmFyaW91cyB2ZW5kb3JzIHVu
ZGVyIG5ldC9ldGhlcm5ldC8qIHVzZSBtb2R1bGUgcGFyYW1ldGVycy4NCj4+Pj4gQ2FuJ3Qgd2Ug
YWRkIGFub3RoZXIgb25lPw0KPj4+DQo+Pj4gTG9vayBhdCB0aGUgaGlzdG9yeSBvZiB0aG9zZSBt
b2R1bGUgcGFyYW1ldGVycy4gRG8geW91IHNlZSBtYW55IGFkZGVkDQo+Pj4gaW4gdGhlIGxhc3Qg
eWVhcj8gNSB5ZWFycz8NCj4+Pg0KPj4NCj4+IEkgZGlkbid0IGNoZWNrIHRoYXQgcHJpb3IgdG8g
bXkgc3VibWl0LiBSZWdhcmRpbmcgdGhpcyAibm8gbmV3IG1vZHVsZQ0KPj4gcGFyYW1ldGVycyBh
bGxvd2VkIiBydWxlLCBpcyB0aGF0IGRvY3VtZW50ZWQgYW55d2hlcmU/IGlmIG5vdCwgaXMgdGhh
dCB0aGUNCj4+IGNvbW1vbiBwcmFjdGljZT8gbm90IHRvIHRyeSB0byBkbyBzb21ldGhpbmcgdGhh
dCB3YXMgbm90IGRvbmUgcmVjZW50bHk/DQo+PiBob3cgInJlY2VudGx5IiBpcyBkZWZpbmVkPw0K
Pj4gSSBqdXN0IHdhbnQgdG8gY2xhcmlmeSB0aGlzIGJlY2F1c2UgaXQncyBoYXJkIHRvIGhhbmRs
ZSB0aGVzZSBzdWJtaXNzaW9ucw0KPj4gd2hlbiB3ZSB3cml0ZSBzb21lIGNvZGUgYmFzZWQgb24g
ZXhpc3RpbmcgZXhhbXBsZXMgYnV0IHRoZW4gd2UgYXJlDQo+PiByZWplY3RlZCBiZWNhdXNlICJ3
ZSBkb24ndCBkbyB0aGF0IGhlcmUgYW55bW9yZSIuDQo+PiBJIHdhbnQgdG8gYXZvaWQgZnV0dXJl
IGNhc2VzIG9mIHRoaXMgbWlzbWF0Y2guDQo+Pg0KPiANCj4gYmVzdCB3YXkgaXMgdG8gcmVhZCBu
ZXRkZXYgTUwsIHRoYXQgd2F5IHlvdSB3aWxsIGxlYXJuIHdoYXQgaW50ZXJmYWNlcw0KPiBhcmUg
ZnJvd25lZCB1cG9uIGFuZCB3aGljaCBhcmUgb3V0cmlnaHQgYmFubmVkLCBzb21ldGltZXMgeW91
IGNvdWxkDQo+IGp1ZGdlIHlvdXJzZWxmIGtub3dpbmcgd2hpY2ggaW50ZXJmYWNlcyBhcmUgbW9z
dCBkZXZlbG9wZWQgcmVjZW50bHkNCj4gDQo+IGluIHRoaXMgbW9kdWxlIHBhcmFtcyBleGFtcGxl
IC0gdGhleSB3ZXJlIGludHJvZHVjZWQgdG8gYWxsb3cgaW5pdCBwaGFzZQ0KPiBjb25maWd1cmF0
aW9uIG9mIHRoZSBkZXZpY2UsIHRoYXQgY291bGQgbm90IGJlIHBvc3Rwb25lZCwgd2hhdCBpbiB0
aGUNCj4gZ2VuZXJhbCBjYXNlIHNvdW5kcyBsaWtlIGEgd29ya2Fyb3VuZDsgaGFyZGVzdCBjYXNl
cyBpbmNsdWRlIGh1Z2Ugc3dhdGhzDQo+IG9mIChwaHlzaWNhbCBjb250aW51b3VzKSBtZW1vcnkg
dG8gYmUgYWxsb2NhdGVkLCBidXQgZm9yIHRoYXQgdGhlcmUgYXJlDQo+IG5vdyBkZXZpY2UgdHJl
ZSBiaW5kaW5nIHNvbHV0aW9uczsgbW9yZSB0eXBpY2FsIGNhc2VzIGZvciBuZXR3b3JraW5nIGFy
ZQ0KPiByZXNvbHZlZCB2aWEgZGV2bGluayByZWxvYWQNCj4gDQo+IGRldmxpbmsgcGFybXMgYXJl
IGFsc28gdGhlIHRoaW5nIHRoYXQgc2hvdWxkIGJlIHVzZWQgYXMgYSBkZWZhdWx0IGZvcg0KPiBu
ZXcgcGFyYW1ldGVycywgdGhlIGJlc3QgaWYgZ2l2ZW4gcGFyYW1ldGVyIGlzIG5vdCBkcml2ZXIg
c3BlY2lmaWMgcXVpcmsNCj4gDQo+IHBvbGxfZW5hYmxlIHNvdW5kcyBsaWtlIHNvbWV0aGluZyB0
aGF0IHNob3VsZCBiZSBhIGNvbW1vbiBwYXJhbSwNCj4gYnV0IHlvdSBoYXZlIHRvIGJldHRlciBk
ZXNjcmliZSB3aGF0IHlvdSBtZWFuIHRoZXJlDQo+IChzZWUgbmFwaV9wb2xsKCksICJFbmFibGUg
UnggcG9sbGluZyIgd291bGQgbWVhbiB0byB1c2UgdGhhdCBhcyBkZWZhdWx0LA0KPiBkbyB5b3Ug
bWVhbiBidXN5IHBvbGxpbmcgb3Igd2hhdD8pDQoNClllcywgYnVzeSBwb2xsaW5nLg0KQnV0IG5l
dmVyIG1pbmQsIEkgd2FzIGluZm9ybWVkIHRoYXQgTkFQSSBtdXN0IGJlIHVzZWQgc28gYXBwYXJl
bnRseSBJJ2xsDQpuZWVkIHRvIGFueXdheSByZW1vdmUgdGhpcyBwb2xsaW5nIG1vZGUgYW5kIGl0
cyBtb2R1bGUgcGFyYW1ldGVyLg0K
