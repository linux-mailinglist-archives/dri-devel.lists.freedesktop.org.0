Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9308629F5
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 11:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DD010E121;
	Sun, 25 Feb 2024 10:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="qPVSl5rb";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="KaTMLoro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDAC10E121
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 10:37:32 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly17d.srv.mailcontrol.com (MailControl) with ESMTP id 41PAbIQZ066066;
 Sun, 25 Feb 2024 10:37:18 GMT
Received: from rly17d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender osharabi@habana.ai) (MIMEDefang) with ESMTP id
 41PAbEOD065794
 (TLS bits=256 verify=OK); Sun, 25 Feb 2024 10:37:18 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) id 41PAahwW060312;
 Sun, 25 Feb 2024 10:36:43 GMT
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by rly17d-eth0.srv.mailcontrol.com (envelope-sender osharabi@habana.ai)
 (MIMEDefang) with ESMTP id 41PAaemj059908
 (TLS bits=256 verify=OK); Sun, 25 Feb 2024 10:36:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSbSaYx9tlcbT8BHhnC3Gkx5+Azf7jSayYgSINX7isKbJyuZvXAzhqz/vE0YxviG/Aem0hxPeUU8GJmm2yqBd/doDiQ7RoVRK6lQOS+/VaPc6TheDQ0DyEjIx7e3O6KxoaTlX+srbjRS+GHjWi4ShwWEkUqp7rmQNrXSKr1Jn9q2fpdOiFEQyCrK1Nd5A6DzIMbjCoVjOkiJ1uCKZXfyJMnVVqjZIkWGTVTU4dW1x8XEqidBMRkL/4+43l/CeyW3YqFM8Lf7U5PpkaVw583oczKbLi+5sqIr2IJhVqStKt0yCmSFXVCOzwA0Okrf6rVHv1ELQMEmYrMPIDIj8emFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX6ptR4gnspeV0qK5++gVvwnIXydn7VuHXXq9x70LR4=;
 b=L6whcbRptehU9SQ861Ha1jWDPyeI3rHP9XLHKWkuywTHdwRbTEFqr+no/ERaTHPBDtqkBMcvrOp5htyplLLzHqT3G4NaLDaJHHox5d73Zz03JbdfF6S80TmXRuF+HalKgAUjPtShy0ERze05mUnui9q3as7Vye3eTqq/W6/Bv6EhaVpc8YSeBcoACWq+PCNGHOyknPxKZ0SeYF21PhKP073G1wlWbaJTZhl8uWqEe97XD0Fidf0RYdvQfwSKAekBvWYWWFzBCokzJyZFvYInv5gBBJFoGK27xeM8a+IiYor+r84q1XE3LLnoH+vVb6PKAWNPCWrlZ4mL4Z9RQ2hdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX6ptR4gnspeV0qK5++gVvwnIXydn7VuHXXq9x70LR4=;
 b=qPVSl5rbjZxaSVanW0URCi6LKu8Pg0tXbzVYULV8pJXN9i0ToUvDmtO9RKwWLuqYKtlEyaS5ufERDpQHPU0gxgiZpx4wREbZFZi5RGn0pFVXUSthfIVJl01oQtFtnQayfP1A51iiIaF/aQxcZyo9Vy9HGE+3F6ya1PDwvVO17hOTOHjxW3W523uA7h8IkvoIKI7Q2HorAk3EGHWYkclFUZML2+ywE9ztdFHdI0HVGcMP1SajY6ErNgvqzoUDRE5ORh3nwcKVcxoesH6UgKtWqstQT3V9XcfafW5QWSo1lMDhNH9uvzX0/k2RDoBhm6WHnTwXwTtNL3UF5lmXPgMgEQ==
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com (2603:10a6:150:db::6)
 by PR3PR02MB6396.eurprd02.prod.outlook.com (2603:10a6:102:5d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.27; Sun, 25 Feb
 2024 10:36:39 +0000
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::42b7:1098:d42:9b99]) by GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::42b7:1098:d42:9b99%7]) with mapi id 15.20.7316.031; Sun, 25 Feb 2024
 10:36:38 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/13] accel/habanalabs/gaudi2: use single function to
 compare FW versions
Thread-Topic: [PATCH 01/13] accel/habanalabs/gaudi2: use single function to
 compare FW versions
Thread-Index: AQHaZBYYN1FGyR6lfECyGug0FdLQjLEYib+AgAJbGgA=
Date: Sun, 25 Feb 2024 10:36:38 +0000
Message-ID: <93778bd1-36ed-4db0-9d41-a029577d76c6@habana.ai>
References: <20240220160129.909714-1-ogabbay@kernel.org>
 <1eb926a6-3467-aaf4-2bc0-8d9756516d9c@quicinc.com>
In-Reply-To: <1eb926a6-3467-aaf4-2bc0-8d9756516d9c@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB9325:EE_|PR3PR02MB6396:EE_
x-ms-office365-filtering-correlation-id: 542a5c23-7ae2-4312-f891-08dc35eda5ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VnJSpV5lCGERY7ZzbE4HFYpdixo+yIEqRE7NHipfnXA2bELfeBybafZo9/FOeJ/DNzuEfGKjCihdHZPeN9G3Qe5sz5yZZXTiqh7RborcQGHG88h9HCzqWfX/8FyJU/5SwILzWPushNX49U+8GpcByikSRI+Q0cKvK9iK6oXI/HjPvtLW6W1MnVlXqPxHz2T/CoZyKE81D3f0b26OhozsjrwhkXkGH5RjUtG5ELJ4ATf9D7vLnPYcK+8hDcwi271itWINPvPw2Njc1diuJIG4+UOdzkfpG/8/8rBd1uLpKQjlyxAN3ejOmW9KzxYthN59L/32/0Ksqeb81xA+8oH35/88CJxTtfCb6j+Ym0Mvq5UOi20W6YrZaYAcRxbEJch1TXh7kJN/1XMAm8Nb0RfStQ11cBGRfKQTklLgxLT1SXXc8LGXls7Ug7wvZrzUWqBtxrxnaMEJm5Dp9Q7y8+wd+RV24tdaBpxPthLBM/7vvjwKKgCmaGGHkKvoEnsfRNqdi0hYKNUUGQL7DBFs6oGp7sL/nnk/+A11x0dgeZdwgVKcWoSMoALOecpeBKQ9HQvMwTyzTd9ttP1xLyISQTxCpinObOuGufbHCIfvB5D+WO4dMCIiqorPG+1ltAjA+hbl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR02MB9325.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(230473577357003)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUVwRHBkZFlUOFZCMURudnVqVElyOGVlM1BwV01IZ0FxZHJmalhJbmp6YVIy?=
 =?utf-8?B?cmlLeXlhTEtWMVVWODAxMVI1bVZMNkE3SkhiY1Q2L3FDY1hQVXJzWWV0QnRJ?=
 =?utf-8?B?V3lVTmo4SmZ4WG5SRHVxUllGWmhZeG9TRThRbTdTbjREWGh4RnZQakpkZlFF?=
 =?utf-8?B?SUo4Njh4WTgwSEVjZUZKSS9rclZmTnNNNXlIRGYwYXJJNGJyQlc4MUpxaXpS?=
 =?utf-8?B?RlljNlVsVlM1aWVHVExxQndxK29SUE1rM1kvYlcvaFZZUG53enM2Sjk1dUhD?=
 =?utf-8?B?MWtrNGovSkhXV2pwSkhySzFnWkJvUktSY3NtU3RCb3hDSEdTZ2kraTBTcDRF?=
 =?utf-8?B?L2hGUjRtTVZOWko0bGhkMkNkODl3cnA4aU9LaE1XcExuVWFxT1JuZjdQVkNZ?=
 =?utf-8?B?OWUxbHpDSkdIbFhPdUwzUDRnNDcwVWVEZjZCdTI4akFWQ1M1YWNWVGcxMDVG?=
 =?utf-8?B?MFhUM1JkLzlESUVGVTFuayt1VngxSEFORjV2d2Z4V214MDVET1ZOcFBFSXBv?=
 =?utf-8?B?bWhaZVdRUzN4b2RrcEdNTzdMNFhlYXFJaitKbEc4UmJQWnExNHpIVURJWEg5?=
 =?utf-8?B?TmQ4VHhnQnYxdStSdUlvSUVtYVZQak1sRDgrQUdNSFNDMjUvSEVqM2wzNFFS?=
 =?utf-8?B?cVlsM3dobU0rSnVwNWFZazBCWGJRdUladU5Pa2tiTlJxcSttSjFCeXVxSlhU?=
 =?utf-8?B?RzMzRWpPRkdkNU9GNXU3VHlrTHRXR1ZlYWVwU1dFYnhGbXdJaENZY2c3d2Jz?=
 =?utf-8?B?V2F3WkRzQ1UxM083NS9OWmhnNnVLNjY0dFJtSDk1cnJtTGtCc09BSUIyRWR5?=
 =?utf-8?B?UEFuUDh1UDlUL2dQRU9QOTBsTGtRVEJYc3EyVnBvY2NRZWREZm4yZnFOMEk5?=
 =?utf-8?B?TTh2bDNMZWhINHdkTGZZTFlXZkdhR1dMOXJCU1FkL3V3OXFsZ0FWSXp6K3Fx?=
 =?utf-8?B?WkJMbUNvSVIwYWxhRE41VkVsYW05WHdVUkJHQk5JRmU4MnN1TUNkdXVvNjNC?=
 =?utf-8?B?UHJlOEU3aFBleENXaVdHUGFXYVBXV1pUMHAySDJiZlgwMXovYW83d2prRnow?=
 =?utf-8?B?M00wWmlLWUhsVXB2ZjI2R1dJWFoydmVRQmdxMUowcEg2NDNES0FFY0tiQ0I4?=
 =?utf-8?B?ekFSZmhhbjlabkt1R0l6dUpNYU9HUm83R3F5WC9MTEhOZzNGR3VCZkR3bkpF?=
 =?utf-8?B?dUZlODBsRk4rVmNxUlQvU0h3cVdicUR6aHRBUFkxL0J5ZFJjM05qWVdVN0gy?=
 =?utf-8?B?TzgwM090UnNaWjNSbjU1aCtnY3JaWW1Veml4QnMzVDZWZ1dJUHBtZjZvWENX?=
 =?utf-8?B?bzRxZjhpa2g3ZGpEK3pNRkhJTGV4cXJSOUdpOFZPL0JDSHpiYnlpTVF3WWVI?=
 =?utf-8?B?THdRekJNRnVER0tiNEplejByMXp4Q2hhcDE0NU9uTkVhbnRSNGJLdFlBN1ZN?=
 =?utf-8?B?dUxDci9aYzE4dVVNMTR0aUtLMmI2ZjZqcHJWUEdaYWowQWdLRE1teTVJdGJI?=
 =?utf-8?B?VWJXNklGMWZCWEg5SkFiUndrdkFKd1BJeDh3L1NvbWJuQWNxeTVKYktORlFn?=
 =?utf-8?B?Uy9UV3JwNEpZamJIZXcvWGVsekw1ZjNCZ0NLSU9OWk5Zc3c3RitQRkhTZ05O?=
 =?utf-8?B?a3ludVYvV0VKTG8vbElCaW5UMk90R3N3Zjh0TmxWR3pIL2x4eGkrMmtvcnpD?=
 =?utf-8?B?d085ZTVLcVBYS25sR2h5UDQ3NmF2enhkcm1Pa0Nyc2cvTzNZOVgwb1Zub2Uz?=
 =?utf-8?B?TW1XRFRtNUtOeHNITm1HNm84eUJBT1lTbkt1Sktha1o5UmtRNXZVS2R2SEpX?=
 =?utf-8?B?b0RNZkt0M2dwT2FlWnltSWR2VHBaK3F6aUhKS0tyamt6eEt3alVGVm5HcGFl?=
 =?utf-8?B?VWJ6L2lRY0VBZVdlVEZnNDVqM21pRXRJcVB5aElGMlF4NnZkSldGSTNIb05n?=
 =?utf-8?B?WFBISFhVVmRTOE5qeGJGRnNiTFZNZHc0bW1wQWV0ZVRSeWp1YTlJcTBxTmRN?=
 =?utf-8?B?NVVIYkZsTGU5bkxIekxmNHJsM0FJTUNQU1dNNk5Bd3Joejh6L0hTMTVHV3dM?=
 =?utf-8?B?M1piMWo3K0kxTEVtTlpIVFBoN0ZuV2pBVklNWWVVVFhQZ2dMRFpJUEhvTVBH?=
 =?utf-8?Q?FBpE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11EA21470AA5BE4593430F92745458B7@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eHLUPfVlYhMKV21Ixl3AvoFmtJRiH1jqOHUoRwjQGY2GU3kvGBPqw8v4p1OMCsSI2fCSaAN2Y2wrioHFGchmAs8V/LT0uC7Sc3kHcYCqH2/cx6xKHn7abZP82TIWFfp80mrSpcSWvu3GX/ikKc4gx4UTt61n3nUzympLa2Z0LUXXRYGuGdTr0Jz86987WF1VIikKTJWhzUgFCpnrrm4PgYRY4coGQ4aKSDJw5WKVYCxDNUnoURd/iB7m58w7zn/2eWOgg3WmXFsOtFbF1Wk5+gVE+qDRKVkT/BVqjht9pNyj/nzqZ+3pTCcutUbqnO8CKTR8PvvD3c2/olZHS9IimDj2y5L6FluB+TfK8z9QfzjQ9fkQy+nrHdzqSH7q+yPs0goJU/ZjuNlSyGBoCH0HwmZ0Ij5vw4bGkcYEzpnolv34m0bn93Kut3ZLhEfpevlA2Ebk7pGLPmnPJo2V2Oj59tycPCArHiaidUz7LeDo0ZcqZbbgKGwqRn3G1CUzXK6Gvdad6lWQIH/54EAgI4ohUUNWqU9yDqxvbEMoxZetIEAqXmO6tpbOkceq/+JEM8+huN0o5j1GWVx3vvvdvNKzuwMkI/1jBFBRyrbOO5XbNDFRy7NfqsXO3BegmqzylDfN
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB9325.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542a5c23-7ae2-4312-f891-08dc35eda5ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2024 10:36:38.6780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64PKk8CwP4csKIJ7yNtZ24Pxwa6PHCTMJG5WeapkIZXet7cS7Vkr4pd4i5TlPjjxY60jz6DFVzQb1VFS53CFlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6396
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwODg1NzQzNzpGUEtleTEucHJpdjpjWD1eWMdO5RyrGJxxQ2ZEq4XItLRp/wqkfYFgMkmWckYstG1z+JqQLaMNDcVuI6MqG5QN7J5v3JzgYcSnAVRR8i9GNEgmMpy2Me87d94d3LI/T1aHXnOlcvm/TsZ3gwu1KkUcsGBsIqwQHCxXvR7aeKSw2L0vZY/niG+SlDxjpI7vTwjLI2f8rlnpImchjUNc6YiWK8cCTlXEOYiz+4WG73qzkH97gXqecJlDTKOJqw0pG6YUr6bMJmfpp563rE43iraUbHaHZCLrqsWIYuPsTh/6ITWG7aNn8h60LSBOjbUUt/InZhmHdzos84oQ1MhoMkHJspgiXlS0pH8FUXHQ
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.13.51
X-Mailcontrol-Refers-To: 41PAbEOD065794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=mX6ptR4gnspeV0qK5++gVvwnIXydn7VuHXXq9x70LR4=;
 b=KaTMLoroE6GNA/khXOkM/VsIW8ygtkVeLxDUMRvmqMT155CLXgaBBU9mnWZsN3p3ax1wuwXbows3Aqzb1e+EUggaI9YRH/EBtY+/pnOKjca08uBky617BMswME1CNrF1uvK48QqAY+2iJCo/vIn8YJEPFcJLKqY0hYvWsFhshvSGQhZgEhE+7wATb9c8Q581egAkxBt+wbJWrcZ2QweVbvKfoidp+3G+uxS1aQ4qrWhcE28Ig1KeG44AbwEZFusMHlTgYSsf+gANU1V7klbJbuC3gp4Wc2c1584Hy4KNji2SiqgksWdJck2M7zSFQ8GXcYpCKF8zqEtPA7tvlrHKXQ==
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

T24gMjQvMDIvMjAyNCAwOjM4LCBDYXJsIFZhbmRlcmxpcCB3cm90ZToNCj4gW1lvdSBkb24ndCBv
ZnRlbiBnZXQgZW1haWwgZnJvbSBxdWljX2Nhcmx2QHF1aWNpbmMuY29tLiBMZWFybiB3aHkgdGhp
cyANCj4gaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVu
dGlmaWNhdGlvbiBdDQo+DQo+IE9uIDIvMjAvMjAyNCA4OjAxIEFNLCBPZGVkIEdhYmJheSB3cm90
ZTo+IEZyb206IE9oYWQgU2hhcmFiaQ0KPiA8b3NoYXJhYmlAaGFiYW5hLmFpPg0KPiA+DQo+ID4g
Q3VycmVudGx5LCB0aGUgY29kZSBjb250YWlucyAyIHR5cGVzIG9mIEZXIHZlcnNpb24gY29tcGFy
aXNvbiANCj4gZnVuY3Rpb25zOg0KPiA+IC0gaGxfaXNfZndfc3dfdmVyX1tiZWxvdy9lcXVhbF9v
cl9ncmVhdGVyXSgpDQo+ID4gLSBnYXVkaTIgc3BlY2lmaWMgZnVuY3Rpb24gb2YgdGhlIHR5cGUN
Cj4gPsKgwqDCoCBnYXVkaTJfaXNfZndfdmVyX1tiZWxvdy9hYm92ZV14X3lfeigpDQo+ID4NCj4g
PiBNb3Jlb3Zlciwgc29tZSBmdW5jdGlvbnMgdXNlIHRoZSBpbm5lciBGVyB2ZXJzaW9uIHdoaWNo
IHNob3VsZCBiZSBvbmx5DQo+ID4gc3RhZ2UgZHVyaW5nIGRldmVsb3BtZW50IGJ1dCBub3QgdmVy
c2lvbiBkZXBlbmRlbmNpZXMuDQo+ID4NCj4gPiBGaW5hbGx5LCBzb21lIHRlc3RzIGFyZSBkb25l
IHRvIGRlcHJlY2F0ZWQgRlcgdmVyc2lvbiB0byB3aGljaCBMS0QNCj4gPiBzaG91bGQgaG9sZCBu
byBjb21wYXRpYmlsaXR5Lg0KPiA+DQo+ID4gVGhpcyBjb21taXQgYWxpZ25zIGFsbCBBUElzIHRv
IGEgc2luZ2xlIGZ1bmN0aW9uIHRoYXQganVzdCBjb21wYXJlcyB0aGUNCj4gPiB2ZXJzaW9uIGFu
ZCByZXR1cm4gYW4gaW50ZWdlcnMgaW5kaWNhdG9yIChzaW1pbGFyIGluIHNvbWUgd2F5IHRvDQo+
ID4gc3RyY21wKCkpLg0KPiA+DQo+ID4gSW4gYWRkaXRpb24sIHRoaXMgZ2VuZXJpYyBmdW5jdGlv
biBub3cgY29uc2lkZXJzIGFsc28gdGhlIHN1Yi1taW5vciBGVw0KPiA+IHZlcnNpb24gYW5kIGFs
c28gcmVtb3ZlIGRlYWQgY29kZSByZXN1bHRpbmcgaW4gZGVwcmVjYXRlZCBGVyB2ZXJzaW9ucw0K
PiA+IGNvbXBhdGliaWxpdHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBPaGFkIFNoYXJhYmkg
PG9zaGFyYWJpQGhhYmFuYS5haT4NCj4gPiBSZXZpZXdlZC1ieTogT2RlZCBHYWJiYXkgPG9nYWJi
YXlAa2VybmVsLm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBr
ZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+wqDCoCBkcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvY29t
bW9uL2Zpcm13YXJlX2lmLmMgfCAyNSArKysrKysrKw0KPiA+wqDCoCBkcml2ZXJzL2FjY2VsL2hh
YmFuYWxhYnMvY29tbW9uL2hhYmFuYWxhYnMuaMKgIHwgMjAgKy0tLS0tLQ0KPiA+wqDCoCBkcml2
ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMi5jwqDCoMKgwqDCoCB8IDU3IA0KPiAr
KystLS0tLS0tLS0tLS0tLS0tDQo+ID7CoMKgIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9u
cygrKSwgNjggZGVsZXRpb25zKC0pDQo+ID4NCj4gLi4uDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNjZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGkyLmMNCj4gYi9kcml2ZXJzL2FjY2VsL2hh
YmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMi5jDQo+ID4gaW5kZXggMWYwNjEyMDlhZTIxLi40YTA5MTdh
YTRkZDcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2dhdWRpMi9n
YXVkaTIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGky
LmMNCj4gPiBAQCAtMjYwMSw2ICsyNjAxLDggQEAgc3RhdGljIGludCBnYXVkaTJfc2V0X2ZpeGVk
X3Byb3BlcnRpZXMoc3RydWN0DQo+IGhsX2RldmljZSAqaGRldikNCj4gPg0KPiA+wqDCoMKgwqDC
oCBwcm9wLT5oYndfZmx1c2hfcmVnID0gbW1QQ0lFX1dSQVBfU1BFQ0lBTF9HTEJMX1NQQVJFXzA7
DQo+ID4NCj4gPiArwqDCoMKgIHByb3AtPnN1cHBvcnRzX2FkdmFuY2VkX2NwdWNwX3JjID0gdHJ1
ZTsNCj4gPiArDQo+ID7CoMKgwqDCoMKgIHJldHVybiAwOw0KPiA+DQo+ID7CoMKgIGZyZWVfcXBy
b3BzOg0KPiA+IEBAIC0zMzA4LDggKzMzMTAsNiBAQCBzdGF0aWMgaW50IGdhdWRpMl9sYXRlX2lu
aXQoc3RydWN0IGhsX2RldmljZSANCj4gKmhkZXYpDQo+ID7CoMKgwqDCoMKgIHN0cnVjdCBnYXVk
aTJfZGV2aWNlICpnYXVkaTIgPSBoZGV2LT5hc2ljX3NwZWNpZmljOw0KPiA+wqDCoMKgwqDCoCBp
bnQgcmM7DQo+ID4NCj4gPiAtwqDCoMKgIGhkZXYtPmFzaWNfcHJvcC5zdXBwb3J0c19hZHZhbmNl
ZF9jcHVjcF9yYyA9IHRydWU7DQo+ID4gLQ0KPiA+wqDCoMKgwqDCoCByYyA9IGhsX2Z3X3NlbmRf
cGNpX2FjY2Vzc19tc2coaGRldiwgDQo+IENQVUNQX1BBQ0tFVF9FTkFCTEVfUENJX0FDQ0VTUywN
Cj4gPiBnYXVkaTItPnZpcnRfbXNpeF9kYl9kbWFfYWRkcik7DQo+ID7CoMKgwqDCoMKgIGlmIChy
Yykgew0KDQpDYXJsLA0KDQpTdXJlLCB3ZSdsbCBzcGxpdCB0aGUgcGF0Y2hlcw0KDQpPaGFkDQoN
Cj4NCj4gSXMgdGhpcyBjaGFuZ2UgaW4gc3VwcG9ydCBvZiB0aGUgb3RoZXJzIGluIHRoaXMgcGF0
Y2g/IEZlZWxzIGxpa2UgdGhpcw0KPiBzaG91bGQgYmUgbW9yZSB0aGFuIG9uZSBwYXRjaCAoYWRk
aW5nIG5ldyB2ZXJzaW9uX2NtcCwgcmVtb3Zpbmcgb2xkIA0KPiBjaGVja3MpLg0KPg0KPiAtQ2Fy
bCBWLg0KDQoNCg==
