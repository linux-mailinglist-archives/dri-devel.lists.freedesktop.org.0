Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0030190E3F8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ED210E9AE;
	Wed, 19 Jun 2024 07:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="WM5Ae0d3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47E10E9AE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:05:20 +0000 (UTC)
Received: from rly10d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly10d.srv.mailcontrol.com (MailControl) with ESMTP id 45J75H5P070791;
 Wed, 19 Jun 2024 08:05:17 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly10d.srv.mailcontrol.com (MailControl) id 45J74IiD057262;
 Wed, 19 Jun 2024 08:04:18 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by rly10d-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 45J74HBx056997
 (TLS bits=256 verify=OK); Wed, 19 Jun 2024 08:04:18 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZ5PlkupUDJH43CVDZ2YcLWsVjP7DfY5LURwL1nS4la9zQ+daJIhxbHfhAiVPQOeUrY0WpTiYgNPVxunuaTNAyM3QzUMpb0O9aGoxEgXjlcjFwHXV8JhDsNnx2hIRoJRpbt+PmeT8EU/IaHflu0GC0KtUsJb2Kajr97gpU/G1buowSDqh8jzcl3xCWnDj+D/GVzuYsK/Dc+tNyu9mY7GuXoj8GEj+gTMNLMB7Nl+ibhEXGbf5krCYLfKDum3vuRJtD6rVmlVdN2BfL7gsHjbEvnucZMUUb+2qZr0jekgAT3bjabfIITHHYvn15NRbWaIyTyO5wMIW1PMqtCVHa2N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM2PD4FF3nFtMKUFBCbonz8F4tLRAtEssK/p1yHnQbI=;
 b=fL32KlUhSIU3hA6BiTbkXV3MbllgqCQGaRa45agSCcDLpJ5D4GE3QYtlEMy8wSn3z1txuEuqMvIPW+1cTTGkwiQtzMI/D2uWHjX130V+IUsaMD8TL7tWTBF42bB8fd7axYKBh+EL1XUn+JsYtJyztzdjA8srXhr9rA74VTkLaPB62Se603483CZT80AtPTSWZqh1m9567sCtGs7gcM5CDEYsJVlG6Jvo6zkIeGjYUawFuTsp1ypdOIb5Fk6bHt6AcHiETzG31XDQp/LHQ7euP8lyfsSDfcjs+l8QUhJrm8n1Tk2GulWp5uy+IOIIw0kHhVwsoFEzZKw+/efIDbPLxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM2PD4FF3nFtMKUFBCbonz8F4tLRAtEssK/p1yHnQbI=;
 b=WM5Ae0d3To0thrmQLEQkfJ3x6myDdDYNkEwN+p6SWU8SzEAR4cYjnO/AlDeZHNB8ppZsnfkwc6SvhLY6mUaIyB49GIWx+rHaJnYrJ5jK7AR0ly3fw0xxt5myoj5Wp2+T3uut+zASQv4rE+HRggdsJAtH5SEpU7mgWuEVlFt2sF+gjBgnJtyDP75ZULHZezYhzB7uyoiV3u4enx4KaQP7KS875R1TSIAKSEwrahSm5e30IGIBriXHeztGpvkxalAMkr7NDLgJmk26EoCBWZQqSlbyAbNLU+2lR94Eo4V6JW73j6Fg9OGi7cUcxrptHUtPapyAz+bVidbfzDkmwB1hNA==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by PAVPR02MB8967.eurprd02.prod.outlook.com (2603:10a6:102:325::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 07:04:14 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288%5]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 07:04:13 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Ofir Bitton <obitton@habana.ai>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] accel/habanalbs/gaudi2: reduce interrupt count to 128
Thread-Topic: [PATCH 1/9] accel/habanalbs/gaudi2: reduce interrupt count to 128
Thread-Index: AQHawhLHjF91KMj9L0uM2Uw9WKUf0bHOqaKA
Date: Wed, 19 Jun 2024 07:04:13 +0000
Message-ID: <7966fc16-6805-44d4-b24c-1281475e7ca9@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
Accept-Language: en-IL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|PAVPR02MB8967:EE_
x-ms-office365-filtering-correlation-id: 2e63d599-72bc-44c6-6a25-08dc902e06eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?cE5pbXMrNCtLS3dPaXA1V1BzN0ZFcWk3K0JiUUp1ek5pZTcxckJyZE5Xc2VY?=
 =?utf-8?B?UDZubEs5SmFOcjBsQ1lVdXdUN1E1VGo0R095M1dWTENSUFU4WXo4aVFYT0pP?=
 =?utf-8?B?TERUdW83ZHJVU3Vyd2VKTExOUnlYYWcwL0RTM0FwMWxtT3ZxaFI4SFlwaits?=
 =?utf-8?B?YnZMMWVpQmx1SmpjUDdiTDc4cDVnRklSZU9BeDRZN29aOXhNNWw2Q2ZXK0pp?=
 =?utf-8?B?Q2lsUXpKTjdIYXROelg1Tk03UUFUVm9RaXJaREV1YkJGYUFGTEVPSlJVTTVr?=
 =?utf-8?B?UGtPUUkvZnBUTDJndzgrV0RiZUI3MFJTYnFseitlZzFWMHh2VGRXQlNUdFNQ?=
 =?utf-8?B?SEdzVkt6MkcwL2I5QSs2WHlGekU0dldyRkJ1ZVB0azdDNDBCcGxnWHpNZVhR?=
 =?utf-8?B?aFpqeUJsN0M3TW13enE1bkxKVlFZdGF4bHBhejVhbGpmV2YwUFdYdDBVYklt?=
 =?utf-8?B?T3dCMFFBR3dGMUdLT2VteDI3MTJ6YzYydFRMTWlxZm5DRDRlSyt4RmwvL0lG?=
 =?utf-8?B?eHNDcURsMmpBNUh4ZWt4SGdXNmxJNEpoWDBWVFphVlo2eC9nMTBrYzlFSHBU?=
 =?utf-8?B?ODU2TWdVYkhWazhUb2hnWjRvZkxzK0lPMzJqMC80QnJzSDBkYU5IQWJxbWYx?=
 =?utf-8?B?dUtSdEM2U05BTzJZdDVrb1VJc2k1cWlvb3lBNEorYmpWTXFjbkpsZlZSRm4x?=
 =?utf-8?B?WkNqRHBZYTF4ZW5rSFdLcHg0SGpiTklXRXZUTUFkdU4yZ0lmR3RlRWZZK0RP?=
 =?utf-8?B?alBZUTdheGVrUDRjdzBwOU5Dd3lxNWFhSTV4ZlpPdWlmUUZ3SEkxMTlKS29i?=
 =?utf-8?B?SENEd3BsS2ZydTFwdnRLZFNLQXV6ZFA4Q0NqVGxySVloSVBZaVRlWE85Q2Rz?=
 =?utf-8?B?Q0VseWgxeXFIaDhWM2YxNU9nVzlmcTlsY1RaY0JEWHYrdlYxTDVGMVlDeElW?=
 =?utf-8?B?bndIUER1UGppdW1aeW5uMUdJZ2lKbEtqOE8vOW5UaExoc2FYWkcybGRiRFkv?=
 =?utf-8?B?Q2dNdUxtYVZpWjBWdlpRYkpkTXNFTjg5YW03NGpDcStqU2Jtb1RnSW1BVG5z?=
 =?utf-8?B?WTk3ZG1EK25qOHc4SUpIMUNkU0hCaFV1SEdvOUlUUnBVcVpMaUJpVTc1amw2?=
 =?utf-8?B?b0hZbENBY2hiZ3NqVnJqbDYrb0RTdW5BTTlaZFRqaEYxQUhhcXJBZXlSMkZi?=
 =?utf-8?B?S2F2VytUOXBOZkNSbk5qVHZ6NlBXUjhxWmNYVG5MbmJadFlUQUtnRElmaE5U?=
 =?utf-8?B?QmZkeDlzaWcxdysrQ0ZpSUFGM3JUQTQvby9OdVk3WGFjeUhkUStydG9sNWl6?=
 =?utf-8?B?alRUdS9hV3BWS3l1Z3BtYUZsN3FSVkhtVUk0RTNVSytyKzBQUXJTbEhjTmxo?=
 =?utf-8?B?ellxSkF1ZjJ1ZXE5QjNVQ3RnbWpmNkM1QXUwWHRtRHN0N29TMEpaN2tTa25W?=
 =?utf-8?B?RmlDeURnOXkrOExBU3ZzWFcvRDZkalR3UVlrTnB1NVBzK1ZhL0VUUkZWY0ht?=
 =?utf-8?B?blhDL0JZdDlpSTV4VGNoVi9CS0tJa2xQSFJrTWJsRWxFQkd5TndORkhvV2xq?=
 =?utf-8?B?YXJvbUFGS1YzeFRwWTNqK2lqczdIVWw5eVRBaEh3NUVuaUNqTXpSTktzUVBZ?=
 =?utf-8?B?N21sWnhWMUpmeGoySFIxMDFuSWwrRnEzY3FvM0d4cnZVRnVNOWd2eSsrMzNM?=
 =?utf-8?B?Ny80bkh2SllTMWovSERYRjFldVEwR0VOc2MwcExsWDJma21kUksxMXhXUWJY?=
 =?utf-8?B?aUJBRHd0OW5wcU9ZcWQyK0NZWldnaU9hYnVrdUpOZ2U2aG5BRkdobERMeUtE?=
 =?utf-8?Q?ePqJTpRe3I+stZP3O+xH7sErq5obIvTBy+Vi4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEI4SWF5WnMxL3hqTGYzSW9XSk9qTmRtNGZUVHdEazNOeUx3eWFiNGpiN0tZ?=
 =?utf-8?B?a2NYczNqcTVncjdndjljbHBBV2c2NmJLOXZwRnY2ejh3MHQ0OGcyYmRNQklq?=
 =?utf-8?B?eVltd3lEK1pQV3ZkdmhXQU1jWlYrZWxtSXdGNmFFWTJ4QkF1V3ltb0ZPUFUz?=
 =?utf-8?B?TDBndDIxYkdMV25PM0VQK1lnZG1DUEs1aHkzZmVWd2xRWCtON2NnWlNpaVdZ?=
 =?utf-8?B?RnBpVXRpbVRGNVpsMXA4V01YYkFLUkg0WUFEM3h2TnNDc2ltaDlJOWk5SW4w?=
 =?utf-8?B?bW9GdTFLWjBwSUtoMEhxc3oydWJwdXVwR1VZZFhuakNaZFpKdmcwbjhCVi9s?=
 =?utf-8?B?NHlpV25QNTVIdWtGenhvUlpwLzd0OG5pK0Y5UkYvMnBySGZqRGRXZGZmUWlw?=
 =?utf-8?B?ei9aeHBLZnJZSXZSUUlyZWduQkdHMHRzaVFkU0IzbnF6NlZEQ1pBUU10ZHF4?=
 =?utf-8?B?aXIxbGZHazZwL3U4ZTlXQTh2Zk9XZmRzUmVPUG02VmFoSm4xSCtJM0lSNlR0?=
 =?utf-8?B?bjlqSGVsS1VTZy9RcEw1OHp6L2pXVFk0RFQwUXRvNDFUdSsxd3BJYjRjYVpU?=
 =?utf-8?B?TjdVZkZEOHJuRlZZWmoxdnpMa2VnNkM0b2J1SGF3OXZiMk84U2dNU1c1SFd1?=
 =?utf-8?B?RVhYZWNTbmNHU2xsb1VBR29vbGt6ZG1jQjZUU2NpTStFWGNPUUNsWnFCNHZQ?=
 =?utf-8?B?QjhmeUVGQ0ZOOExRYTZrbjlxaXEzWUJlUVZKREMxN0hrdTFpOVNOa1BhU2JG?=
 =?utf-8?B?bFh5N2E5RUFsZzdwN3hEZG5udklQN0N6dC9nK2c5N0tnK3gxQ092VFpGVzV5?=
 =?utf-8?B?TFdKYkVxTi9xclFneHJPZ3JwbEFIUjdKQ1VLZW85MVRDQkNQZUpFM1A5SWZO?=
 =?utf-8?B?Y1lUelhrVmpKclc2LzlucnhENnkwVVhGajZkMTcrR2sxVnAzVktZcHY4NFBo?=
 =?utf-8?B?OW52SnFIcTVpbGRCZmhVYWRWMUZNeHJpMHlpeVEzVTl6eXhlWjlsYXc5UU53?=
 =?utf-8?B?OWFDdGFPK0w0QXdIKzRUQzN1WEdOdGFnRWpjSnlHU2dGUWErK1BrQm1Zc1RB?=
 =?utf-8?B?V1ZuMXZOTEpWRnFKZUhOcnYxR2tUdU5OQlBSSzM5YmVNQzliM05FMHgrYUpy?=
 =?utf-8?B?cUo4VnRGbUNHVzYxNjh0RWNNMTRnTU9GYmYrMkk0Nk1acXRQMU4wMEtYN3Uy?=
 =?utf-8?B?S1V4cVhKOXh3VVNpOGo3Z2xWWEtMdDBISUg2QVpEWFNZaGQvUUN1b2dpN2lW?=
 =?utf-8?B?V0lSZzBWcnZaRE12ajZGdGttOVFWcnEzOGNsczNFclZEWHU1RFlhMjM1aUNE?=
 =?utf-8?B?QnNNNDc0K2drU2ZmSHZyYTRRMHVnY1EvSS9XeDVOQVNwdWVHVm5TaU9xUUJ1?=
 =?utf-8?B?SzJlNCtObzlNelFBcGp0MDl5bnJiM2kyUWtTVzhLdnlnZHM0eUFjdWNvZFZL?=
 =?utf-8?B?bE02Mlh3R0dNbXE2b3B6YW9BM3VDNkhpU3JMcm9OdEFrbDlVZk9oVStKWjho?=
 =?utf-8?B?NVBPQ3Y4TkNoei9TSXhMUy9rL0hTRHRKMXFFaE0vbFUrTVZEU1VuWVhDblM0?=
 =?utf-8?B?dFEzQ2hRSndkWjB5SW4rUEJqdlBJZlF4QTVvcFR2N2hSa0pVWkEyS3NabDBi?=
 =?utf-8?B?bEtLZ0ZybWZuU2pSVjFWOXMzT1hWRDJBbEpLYXVPd1lSclRlZ1ZXSnVrSnBW?=
 =?utf-8?B?MUpaUTdOcHk4aW9JYldETCtNeFNGSHRJUkRLM011QkowMWZhNm04S1ZyeUNY?=
 =?utf-8?B?RERQMElXdVZKNGtSRjdCK2EyQWZZVHB2MTF5cWt5dlIvZkN5RFdybFFweEg4?=
 =?utf-8?B?SEhiczV0SGNhUzhuQnB2Z1dobmxpQzZtcWtQOHQ0aXJzQUd4THRHRnJMLzlr?=
 =?utf-8?B?QlpoMzljcktYNlVpNWFpYjVnT0d0clhSU2tIR0FPOE1HNVRPSFFSVThBYVll?=
 =?utf-8?B?eElQSU51SzdlM1V4Vld3MUJ6dDN4cWNlQ1BjNDZJTnhKdDNQK1QzcEt0MEU4?=
 =?utf-8?B?dFNvdGd5R2h3V21WVGFiZnVoejdSb1hvVSs0UXdsNllnNm5XMWpKQXRVa2Ez?=
 =?utf-8?B?UCttYmdieFVUdWlJb2lXd2pGZzlscnNESm10ZkFHZDhKbFpVc2VWeERoRkVr?=
 =?utf-8?Q?FSJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE2634C7C0636446854BBF0D41BE010A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3VvcwUsJGtglXnDrvFrS5l94eBYe60cScv1A5XexxnUA3OCCJIRZDDmc4BDBa4/cYiFo4drYaaYAIx/+QENOwi+7epMfAZoCR7zkgNpi7Fauk2+HTu8jWLqF0vGGb3f3cpMpI72YaU+4Kub4sv0SKufZH9XRYNjQ9DFDWUSu72RjwhQI/1TF5r22sa3S1XZl1vnC49szrzIFgmSENTl2uKKUUcb4ZGfiNaZWl5xkPWQhnxLXnYN7EZu91EiLmQt0IRj0Ea1Mj5w+3iX+gzAtEo8xnzdlftVZMkVHbBmgYPJr+n3GI7W6+PT+DJiIori+l10ikfXSKiZ+RtfMDrsDqsRtLF40WfOD/+fZCOLiz4wvV95RhBY1v8oHxDw6oj8YNXbc6i8gA6wr9VKXeCmnCC1S4XXMXBg+BbcwqwhtGqbmjF1K5de7bLo7vE7n1mMESrQeSmhOyg8GuGOvHpem3LN4UGkWgfI8MsOibC3uZu9qIUs8W2wh1l9t07zbfqc0IUh4aWbJtfO8q5KplSIVD8WFSSQ5zKbcyAC82RnMFVEWduvnUhSu84GmB+86FgBO2AsWU4XPi8SdSE3cwF/+QFQRTynkEknIW9fGHUkDochJf14RYCobOWl9/6dosgnh
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e63d599-72bc-44c6-6a25-08dc902e06eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 07:04:13.8722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FROANIN8z+uNnOR+E/pgCtN1MLE4WhmTux5Qf+lvLov/QpT1CXWzdJFG3lkcxBHTKlUp8ODWdpRu6MSeDENjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB8967
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODc4MDcxNzpGUEtleTEucHJpdjrCYI15Xpg+MQD9eYkQxsJ+qjtn+IyYaTbzR7Oqx4jNOJ52s4IABDKMLz116O5e+JR0lYLCDW6rDHMTD2Caq3UrqQsX1fQh5FBpaRawAA09s4zlzGBpBcNYUEFQdv34mkV4JgsLhT5e2JJXRe/F7RazG4igYqtDzU1gLH37X/W2AfxMS4H2Vwvf9P2Zq7j9q6IiN6kCPNrKZWWffOR0/vYcSJ23hM2hv/vAFPn5RH802tczs+76fnUo8rrq+z9jygpdWHwObD6leehFIqp/O8cSrxE+sQXAlFmmSTBB6gelUZo0x8yaGjgCMuKBQkiXnWAcgCtHcDZrxqPGCXjIBYRG
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.120
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

T24gMTkvMDYvMjAyNCA5OjM0LCBPZmlyIEJpdHRvbiB3cm90ZToNCj4gU29tZSBzeXN0ZW1zIGFs
bG93IGEgbWF4aW11bSBudW1iZXIgb2YgMTI4IE1TSS1YIGludGVycnVwdHMuDQo+IEhlbmNlIHdl
IHJlZHVjZSB0aGUgaW50ZXJydXB0IGNvdW50IHRvIDEyOCBpbnN0ZWFkIG9mIDUxMi4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPg0KPiBSZXZpZXdl
ZC1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPg0KDQpSZXZpZXdlZC1ieTogVG9t
ZXIgVGF5YXIgPHR0YXlhckBoYWJhbmEuYWk+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9hY2NlbC9o
YWJhbmFsYWJzL2dhdWRpMi9nYXVkaTJQLmggICAgICAgIHwgOCArKysrLS0tLQ0KPiAgIGRyaXZl
cnMvYWNjZWwvaGFiYW5hbGFicy9pbmNsdWRlL2dhdWRpMi9nYXVkaTIuaCB8IDQgKystLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2dhdWRpMi9nYXVkaTJQLmggYi9k
cml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMlAuaA0KPiBpbmRleCBlZWU0MTM4
N2IyNjkuLjA1MTE3MjcyY2FjNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9hY2NlbC9oYWJhbmFs
YWJzL2dhdWRpMi9nYXVkaTJQLmgNCj4gKysrIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2dh
dWRpMi9nYXVkaTJQLmgNCj4gQEAgLTM4NCw3ICszODQsNyBAQCBlbnVtIGdhdWRpMl9lZG1hX2lk
IHsNCj4gICAvKiBVc2VyIGludGVycnVwdCBjb3VudCBpcyBhbGlnbmVkIHdpdGggSFcgQ1EgY291
bnQuDQo+ICAgICogV2UgaGF2ZSA2NCBDUSdzIHBlciBkY29yZSwgQ1EwIGluIGRjb3JlIDAgaXMg
cmVzZXJ2ZWQgZm9yIGxlZ2FjeSBtb2RlDQo+ICAgICovDQo+IC0jZGVmaW5lIEdBVURJMl9OVU1f
VVNFUl9JTlRFUlJVUFRTIDI1NQ0KPiArI2RlZmluZSBHQVVESTJfTlVNX1VTRVJfSU5URVJSVVBU
UyA2NA0KPiAgICNkZWZpbmUgR0FVREkyX05VTV9SRVNFUlZFRF9JTlRFUlJVUFRTIDENCj4gICAj
ZGVmaW5lIEdBVURJMl9UT1RBTF9VU0VSX0lOVEVSUlVQVFMgKEdBVURJMl9OVU1fVVNFUl9JTlRF
UlJVUFRTICsgR0FVREkyX05VTV9SRVNFUlZFRF9JTlRFUlJVUFRTKQ0KPiAgIA0KPiBAQCAtNDE2
LDExICs0MTYsMTEgQEAgZW51bSBnYXVkaTJfaXJxX251bSB7DQo+ICAgCUdBVURJMl9JUlFfTlVN
X05JQ19QT1JUX0xBU1QgPSAoR0FVREkyX0lSUV9OVU1fTklDX1BPUlRfRklSU1QgKyBOSUNfTlVN
QkVSX09GX1BPUlRTIC0gMSksDQo+ICAgCUdBVURJMl9JUlFfTlVNX1RQQ19BU1NFUlQsDQo+ICAg
CUdBVURJMl9JUlFfTlVNX0VRX0VSUk9SLA0KPiArCUdBVURJMl9JUlFfTlVNX1VTRVJfRklSU1Qs
DQo+ICsJR0FVREkyX0lSUV9OVU1fVVNFUl9MQVNUID0gKEdBVURJMl9JUlFfTlVNX1VTRVJfRklS
U1QgKyBHQVVESTJfTlVNX1VTRVJfSU5URVJSVVBUUyAtIDEpLA0KPiAgIAlHQVVESTJfSVJRX05V
TV9SRVNFUlZFRF9GSVJTVCwNCj4gLQlHQVVESTJfSVJRX05VTV9SRVNFUlZFRF9MQVNUID0gKEdB
VURJMl9NU0lYX0VOVFJJRVMgLSBHQVVESTJfVE9UQUxfVVNFUl9JTlRFUlJVUFRTIC0gMSksDQo+
ICsJR0FVREkyX0lSUV9OVU1fUkVTRVJWRURfTEFTVCA9IChHQVVESTJfTVNJWF9FTlRSSUVTIC0g
R0FVREkyX05VTV9SRVNFUlZFRF9JTlRFUlJVUFRTIC0gMSksDQo+ICAgCUdBVURJMl9JUlFfTlVN
X1VORVhQRUNURURfRVJST1IgPSBSRVNFUlZFRF9NU0lYX1VORVhQRUNURURfVVNFUl9FUlJPUl9J
TlRFUlJVUFQsDQo+IC0JR0FVREkyX0lSUV9OVU1fVVNFUl9GSVJTVCA9IEdBVURJMl9JUlFfTlVN
X1VORVhQRUNURURfRVJST1IgKyAxLA0KPiAtCUdBVURJMl9JUlFfTlVNX1VTRVJfTEFTVCA9IChH
QVVESTJfSVJRX05VTV9VU0VSX0ZJUlNUICsgR0FVREkyX05VTV9VU0VSX0lOVEVSUlVQVFMgLSAx
KSwNCj4gICAJR0FVREkyX0lSUV9OVU1fTEFTVCA9IChHQVVESTJfTVNJWF9FTlRSSUVTIC0gMSkN
Cj4gICB9Ow0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2lu
Y2x1ZGUvZ2F1ZGkyL2dhdWRpMi5oIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2luY2x1ZGUv
Z2F1ZGkyL2dhdWRpMi5oDQo+IGluZGV4IDAyMzFkNmM1NWI0YS4uNzUzZDQ2YTI4MzZiIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvaW5jbHVkZS9nYXVkaTIvZ2F1ZGky
LmgNCj4gKysrIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2luY2x1ZGUvZ2F1ZGkyL2dhdWRp
Mi5oDQo+IEBAIC02Myw5ICs2Myw5IEBADQo+ICAgI2RlZmluZSBSRVNFUlZFRF9WQV9SQU5HRV9G
T1JfQVJDX09OX0hPU1RfSFBBR0VfU1RBUlQJMHhGRkYwRjgwMDAwMDAwMDAwdWxsDQo+ICAgI2Rl
ZmluZSBSRVNFUlZFRF9WQV9SQU5HRV9GT1JfQVJDX09OX0hPU1RfSFBBR0VfRU5ECTB4RkZGMEZG
RkZGRkZGRkZGRnVsbA0KPiAgIA0KPiAtI2RlZmluZSBSRVNFUlZFRF9NU0lYX1VORVhQRUNURURf
VVNFUl9FUlJPUl9JTlRFUlJVUFQJMjU2DQo+ICsjZGVmaW5lIFJFU0VSVkVEX01TSVhfVU5FWFBF
Q1RFRF9VU0VSX0VSUk9SX0lOVEVSUlVQVAkxMjcNCj4gICANCj4gLSNkZWZpbmUgR0FVREkyX01T
SVhfRU5UUklFUwk1MTINCj4gKyNkZWZpbmUgR0FVREkyX01TSVhfRU5UUklFUwkxMjgNCj4gICAN
Cj4gICAjZGVmaW5lIFFNQU5fUFFfRU5UUllfU0laRQkxNgkJCS8qIEJ5dGVzICovDQo+ICAgDQoN
Cg0K
