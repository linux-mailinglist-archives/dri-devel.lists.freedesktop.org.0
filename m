Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7D957B0F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 03:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1664610E3A0;
	Tue, 20 Aug 2024 01:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="d8+yKVl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2089.outbound.protection.outlook.com [40.107.255.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193CC10E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XABwvN29SNC8lVuFM+E9XaSv6tNQTDr6br1boGrgyS2ezavJHi1zvkOhafgO3duVwGVhxyk0lWAgmK5BnCVLG5OMWUEf8uD3JqVmfZcvK8MOvPL/jLhn5eTwKpwdMHbKlqFCPEDGJN76peKChEqZwo6QPj9iAHhibM9DanrGZ2EHSB5CfprwJIsXn3W4YWoSXNhpyI5ay2FR8piUDh6/zrpEMxu62s5vmf7xU0PyHIJhkF5VXUms1EvFFxqRpR/DbwnaEgK5yLCKMPdAovSUY59GsqERmOhVe8/5Fhq4fZ6mnzFG56hPvLmqwMphwsNiYe797y5esWx0JfbnIInkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08HvaWXHamwvdYjsoAk6oFwNqKj9SCxUOjwuECdDt/M=;
 b=eYuOUkK0eeX7bOvaRlY0VGfv24/4YxskXBaI+Z49E1fwLrxQxQOIR52FgeLQqMNgkAZWOzP72m6V7RjcAr1ZNhi+j2qDAyUOHFNTFWzgVNAYV3m7lfMvDeHoCEcIY9JyV6kQmz43KXqtY8U8cSKnXGxKLzj9z5YwcX8DdEHcsI/v7qu7hRqLaHgRAfItBgO59MzXnzfEguB3elhiEPldZjN0XqTuKFs2SDZN6GMRZjfst7GgXXmT7IqB3w87CZ04Cmn77i9pNRHQtorOuRS7CSOlw2nofSSyU6pnQ8eZt5qzzaOW5qrJYpo7AmPKCHDKp259v/Euc46wDsjYprTDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08HvaWXHamwvdYjsoAk6oFwNqKj9SCxUOjwuECdDt/M=;
 b=d8+yKVl5LymgHbbBzh1jteAYMcSObMLkv0XPeWS3mp8rEUo9TfpJIg+thA+UeqPB9H1ewOHS4mcCwr78Md3u0IAQ+uDCBTIgvwgQrQzRkd0UTZ5bfPckgnPNgdOxFkUfr7kyufee9BAh97tT4Qpq6uO+yubkJU3PIY3RDqG9SDIMk6HHoaQOF6LNcj0MpzXuN6JE1nWqRjTAEt7JxCTlQy7LV0GW2PyKAVWiXsjnalx6mG11SlMyCwJRNvWGPs+qRy7Mga8aJ790PWBmGyOD6+XwXudM6emnxXbi9KXfx7e7ZIIhsxQG1q+Krm9rjrECWHxrOtL6nkPvIyP76f6A3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI6PR06MB7116.apcprd06.prod.outlook.com (2603:1096:4:244::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 01:37:38 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 01:37:38 +0000
Message-ID: <80b41d38-2912-4a34-9cd4-ac2c71b210c8@vivo.com>
Date: Tue, 20 Aug 2024 09:37:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] udmabuf: codestyle cleanup
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-5-link@vivo.com>
 <IA0PR11MB718543BE49A8C394C5CC32C7F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718543BE49A8C394C5CC32C7F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SI6PR06MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: e93fa873-7674-48e0-075a-08dcc0b8acaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVVCeTNYUHVUV3cvQ09hLzhVSVhOeWJvdXpNSlAzbGFrR1hINUQ4VGltTnJ3?=
 =?utf-8?B?VmN1bmJXVWhmbHVDQ2x1UUdkNTZESFBDdEthZlduTnBLYWMvVzVEUDVCTSt1?=
 =?utf-8?B?Rnh1RHdFZEU4TGprRTFjelkxV3ZaeVA4b1pGdDhCaW03YzEyaUxnVXVWeDZZ?=
 =?utf-8?B?M1plMkp1djYxdnZxM3RLb2JwY1RDSzBaRE0zaHBFZFprRlV4UWRHTGk4MnZV?=
 =?utf-8?B?S2k5czNWaG9GbjdTUGI3Y0J0UXRkd2NFS2RvbUVFYjBtYlBaZ1VRbWFQa3Bj?=
 =?utf-8?B?Sis5eVluMUZ0UU9WWFY1bXpCc1FmOEM2alU3OVMrRkdjSlA0WDdDb0IyYXVF?=
 =?utf-8?B?eEVnZGY3TWFlSXM1SklYQ0xMdnFQbGE3U1Njb3FJK0w0SllDRWZHc0JoUndh?=
 =?utf-8?B?M0wwallvWGxOWmtFV1NEWk1YMEMyWktUZTZpM2YyWnBsK1NhU1c1cWdMWk51?=
 =?utf-8?B?ZThmUnBTbk9saWtnUlZCcXNPUVRseUozWVhHZUw3SGRIbXNaTURqMkJNbTNU?=
 =?utf-8?B?cnI3blo4Q0ZjVHRYUDlkVEFOSTVwZWducjREK3FlczBxd2UxdDRmZ2wrMVZ1?=
 =?utf-8?B?TGtNL1lNSlo2SFVVRi93cms0ZTJIZ0NqMnRPaGVJMndpa2duVnRBQ3JsZWFQ?=
 =?utf-8?B?RldURVR4WDcrL0hTNGpLTU1MUWpUNGpXWHdIVG9oUFJJMk9zaTNFVzlwUURs?=
 =?utf-8?B?TWdvU2h6MDVjWTQ0bnFrM2dURUViZG1QQXBmM240bE41bVloTFZFWVFTYkhT?=
 =?utf-8?B?dGpvZURIalMwMUxOUEk3WEdWSlp2NHp2Sk5MODEzcWM4b1B3OUFlcExwUzZV?=
 =?utf-8?B?S0pyZm84ajVLeVE4VTlvSGJ0WFF0TGRROUk3clcyVDhtNi85c3pyUWc3Q2Z5?=
 =?utf-8?B?Sm5ncnhjMm5VVlBRWVo2Y0RWY0JKREZ1bmN4ZlpTYTVrT2Vxdk94RTZBSDN0?=
 =?utf-8?B?SVY5Y3NNZlQ5cmdKTXV4dGZqWmFEVXRxeW02WUtvaUVvVmpiYlljQ2hCZkdz?=
 =?utf-8?B?UnQxWStZM2lsV3l5WS8xZFovQjNEbG1sblBkQkU1azlOMHBzQnFvbmJGTEZi?=
 =?utf-8?B?cWR0dndMVkFzRE9UQlExdnArTkZ2Rk1qTWgvcjBnR3haeVJhSFhIQW1jU0ZK?=
 =?utf-8?B?cFJqbWJoVzVEbFNyd3c0Y0JkUTBHeUQwRnUxMXE1eHhDdUxHaUlocGJXK1Fl?=
 =?utf-8?B?ME5GZEkyVHAzQUt3RHN1NEZvYzUzbzcwanRONGh5MUhuMDdXRkRVcnRuWkJQ?=
 =?utf-8?B?K000VUNRM2Z4TGJvTktPbVZDMkpoV0ZVdWtJckVsblVKRG5OM3NSMDJQdXBw?=
 =?utf-8?B?YjlHc0tiODhXaTJsL1ZDUElwZ3I4cDRQVmFWSmJ5b0c1c040eFJwZ0tLSW50?=
 =?utf-8?B?YkJpK1NybDlxeGE4ekhCTUJQZG8yYWJ4cnFzZnRHWkU0SHZtQU55MHE4SDJO?=
 =?utf-8?B?VTVlOXVaZzN3MWQwRHQ0VFhqREc0RFVHbW85K0dlS01KVGpXbnJuZWczdFgw?=
 =?utf-8?B?dVAxS3lWbGhMVHpqNmFETXQxWFNsYVgrTlM0YTA2NHN4emtLMzYrMjhSSFNX?=
 =?utf-8?B?TkpmVnhwcXBnT3JYK25QdjZFNWR5MzZxYzhyZjdHTGc2RDk3TDBvWWFJUk9J?=
 =?utf-8?B?QjRwMWdjdFdYTWs2SnFiWjAzcER2M1dEUk5MM2hlQUhLRFgxbDJSTXdlYmE2?=
 =?utf-8?B?OTJxQ212Sk9FWDlrMU5IZ3hYdWkzRWszVUZiWXpnbVFPRWNYNit6Y2ppbytm?=
 =?utf-8?B?SmkzOGpGUGp3a2g5NFBnQ2R6QjR4SDdNZEExdGRMYkl2WE5tZ29iWkp4blJh?=
 =?utf-8?B?MXpWbk0wa0FTTzdDdU5waG9WZ3NsRnlHbkVWVUpSV2hVWlozSFIvcm8wQzky?=
 =?utf-8?B?b0RxTzdlaXBUc2lDZGljNWdVUXpDNEJRT2lDcGt5VGJCL0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXNGemlUUDNuOFhZeUZqV3YxZTUvKzZyNmloTmQ0dUVoaXQ3ZCtkRFNXU2Zh?=
 =?utf-8?B?TTFjNHpTcGhDME41OWRlOXV1UldtNmVwTjRYeFdJVDNnZXVoOXVMN2ZWYVlT?=
 =?utf-8?B?aGIxZ01XZ0hHL3NQRWZrL0UzVWNMKytKbmhKRms4RFhYUHRvMms0K2RIUVQ5?=
 =?utf-8?B?eTg3SUdmeHFXeEV3UEw1aUNXMzcvR01qQUQwZzl2OU92a1RWaTRlUlluRVZ0?=
 =?utf-8?B?a0NpaTN4cmVRZk4wM3plc1NJRUlJcHYrcWg5WDlNdFVlMHNVM1kyVmlzSkRU?=
 =?utf-8?B?bU9VZlJnUnI4NmJ2WElLK1QvcTNrMHhIUk5rTUVvajFuV2pWSFBpSE92SVFB?=
 =?utf-8?B?U01EVkhDQkR0eDdVYXRPdE4wWHQ3T3piVmtyWDZ6N3Q5Snh1akhJd3Q1Zk1y?=
 =?utf-8?B?SWVHNUVaTjhiT1dCWVJuc2RMbE81eEJTTk90RDVUNUM0NlN0dzZ1YTk1QllK?=
 =?utf-8?B?K2MvcW9abGVrMlBUV2pSTTkrcEo1WEtieWo3RjdPQ2JFUUNGVVIzWUdkajN3?=
 =?utf-8?B?QmRoaHhKRURLL09DamhVTm93S0RlUUkyR3hKL2x0NnFRbGNpckNhc0FLdE1C?=
 =?utf-8?B?b29weWxUVnlpTVhhVU5laDJOWUFsRkJ5cDlERGMvRmxZMWZQTWI0SHp5MUYz?=
 =?utf-8?B?OUJwMUlHYkFpWEkxM1p5RjF6cXFFR3liK1o0MFczaDZLNUVOZ3BGZEZPZUxn?=
 =?utf-8?B?QlpYTU15aU05eUVYcjhIVFJrZHNuZmRtV1NmMjNZSmIwMzhnSVlaWTI4L2Nr?=
 =?utf-8?B?NzZXV3VVcFkvdUVkdm10Z0lRNy83OS9OcU4xVVZ4WFMvSlo1SDF5VUkzM2Vn?=
 =?utf-8?B?TEZNTFBsUnZyMWF2dmJWZ0JGdUd4TjFSTGdYbm9PbkZXL0pzazFJN2RITmRv?=
 =?utf-8?B?SndmSTBWY3ZrMjk5TUVQc2RHcDhLY1VlZlhHOVdDTnhhVjFycS9EczRhc0Rs?=
 =?utf-8?B?a2cyU3BuUkEwNkkyNVE4OGY5K1VScUY4RlNtWGFRT3ZaQ0pNdk5Rdmo4VjVO?=
 =?utf-8?B?anZ4c2JkTEc4QWU0K1BTNjlWVUdDenpnM0FlTzAwZTFmWlJTZ3hIWUNKdk1r?=
 =?utf-8?B?QU9BVXMyTlJHc1E5QU5YMmd2akpUc1NQU2JERU4xRFhuK2lDSkFOa1RqdW56?=
 =?utf-8?B?UC9zVHZNd0ZNNmdYQi9XUUhqcUZFaUhzTDMwMGZWTWU4THpGeFJpYXM5OThY?=
 =?utf-8?B?NSt2MDAwLytMLzhmMk85VytPWjZPdUhSdWoyNlFDWkJoNWptdU56UDRCdUwv?=
 =?utf-8?B?RnN0SmJzVXU3Sk1obzVqR3RKZStvUWYzQ2hXQXZUVlpKMGdUaVo4L3puUkli?=
 =?utf-8?B?clVwcmUyakFhbnNVY2YyRmhIWEtqSmY2Q1NqTmNqcGV2WmNBTUxGdGNDRXh0?=
 =?utf-8?B?a2U0QTlFaGdlTDZHaEwyZ25pdndMRE5KeUIwcGVtcWVlMXBlcEUrZ3hxU0ds?=
 =?utf-8?B?Wll0SzFzZ1F2eGlRVUNlSGpMQ1RCclJXeW44eVNsMERLd3Y0QTM1T1k4WWpj?=
 =?utf-8?B?eVVpbGo2QUg4RmdrYXpWcUd6NVl4ZFhSZ1JpdUluaXZEWlI1bytNKzU1TERT?=
 =?utf-8?B?Zmc2b3Z1bTF4djdtd3ZFQVhqOFhQVkh0MzJZa1ZXdVE3ZmczakxDbllaM0ZK?=
 =?utf-8?B?UXFaMVpWQ2l0SUJTbDNNZ1pMZnd6a2ZYMEVzU2VxdnNGSlJRT2I3eVRETEpv?=
 =?utf-8?B?RWcrMWNyL3BHMWVlUlJDVFhNY2ROdnhaSElra0pZVVB6ZU9rSW1hcFMvVWZC?=
 =?utf-8?B?Y1dQMVNSRTF1WXp0ZitvbkJscjJKL0VZbHZLWS9rYUZQNGFyR0xnLzFwWWw2?=
 =?utf-8?B?QzdKTndlbE1uait6eDJIaWVpUlRmYncwVnpSSmJ6TXFYYXUrdkRERTdrSGVR?=
 =?utf-8?B?c2ZRYnVBblNkTVl0Y2VxZVZrQUNVeEFHL1IydzJZUEs0a2EwTDE5aFlCNkFV?=
 =?utf-8?B?WWVZczVLZnpXanh0cStaZ1RmSEZOd2YrQWViQUVYc1JBOFc5V2FVY2ZnU2g0?=
 =?utf-8?B?OXI1TlBzL3ZMcWlrRWVSMWhYNDNFcDdjeExHTitHWUN3c1RYdE9sS3J3cGMz?=
 =?utf-8?B?Y0pCTU9sYURmQWg2VXJudUxHWWNHaFQveFJLdUpFZDladWFiY2oyck1EYVVJ?=
 =?utf-8?Q?xApvrTB9KSFYIiD1NvmC7LNbp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93fa873-7674-48e0-075a-08dcc0b8acaf
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 01:37:38.5039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRgn2XdXq4NSLGcH9nY8GiHcpjTSpb34BVDsPtK5e/Er2V+DlTQ2eZ7nGhulSTngvGXCc9AbOsWwxBHA6674kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7116
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


在 2024/8/17 8:58, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> There are some variables in udmabuf_create that are only used inside the
>> loop. Therefore, there is no need to declare them outside the scope.
>> This patch moved it into loop.
>>
>> It is difficult to understand the loop condition of the code that adds
>> folio to the unpin_list.
>>
>> The outer loop of this patch iterates through folios, while the inner
>> loop correctly sets the folio and corresponding offset into the udmabuf
>> starting from the offset. if reach to pgcnt or nr_folios, end of loop.
>>
>> By this, more readable.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 65 ++++++++++++++++++++-------------------
>>   1 file changed, 33 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 4ec54c60d76c..8f9cb0e2e71a 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -296,12 +296,12 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   			   struct udmabuf_create_list *head,
>>   			   struct udmabuf_create_item *list)
>>   {
>> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
>> -	long nr_folios, ret = -EINVAL;
>> +	pgoff_t upgcnt = 0, pglimit, pgbuf = 0;
>> +	long ret = -EINVAL;
>>   	struct file *memfd = NULL;
>>   	struct folio **folios;
>>   	struct udmabuf *ubuf;
>> -	u32 i, j, k, flags;
>> +	u32 i, flags;
>>   	loff_t end;
>>
>>   	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>> @@ -315,22 +315,21 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   			goto err;
>>   		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
>>   			goto err;
>> -		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
>> +		upgcnt += list[i].size >> PAGE_SHIFT;
>>   		if (ubuf->pagecount > pglimit)
>>   			goto err;
>>   	}
>>
>> -	if (!ubuf->pagecount)
>> +	if (!upgcnt)
>>   		goto err;
>>
>> -	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>> folios),
>> +	ubuf->folios = kvmalloc_array(upgcnt, sizeof(*ubuf->folios),
>>   				      GFP_KERNEL);
>>   	if (!ubuf->folios) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>> -	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>> -				 GFP_KERNEL);
>> +	ubuf->offsets = kvcalloc(upgcnt, sizeof(*ubuf->offsets),
>> GFP_KERNEL);
>>   	if (!ubuf->offsets) {
>>   		ret = -ENOMEM;
>>   		goto err;
>> @@ -338,6 +337,10 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>
>>   	pgbuf = 0;
>>   	for (i = 0; i < head->count; i++) {
>> +		pgoff_t pgoff, pgcnt;
>> +		u32 j, cnt;
>> +		long nr_folios;
>> +
>>   		memfd = fget(list[i].memfd);
>>   		ret = check_memfd_seals(memfd);
>>   		if (ret < 0)
>> @@ -351,38 +354,36 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   		}
>>
>>   		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
>> -		ret = memfd_pin_folios(memfd, list[i].offset, end,
>> -				       folios, pgcnt, &pgoff);
>> -		if (ret <= 0) {
>> +		nr_folios = memfd_pin_folios(memfd, list[i].offset, end,
>> folios,
>> +					     pgcnt, &pgoff);
>> +		if (nr_folios <= 0) {
>>   			kvfree(folios);
>> -			if (!ret)
>> -				ret = -EINVAL;
>> +			ret = nr_folios ? nr_folios : -EINVAL;
>>   			goto err;
>>   		}
>>
>> -		nr_folios = ret;
>> -		pgoff >>= PAGE_SHIFT;
>> -		for (j = 0, k = 0; j < pgcnt; j++) {
>> -			ubuf->folios[pgbuf] = folios[k];
>> -			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
>> -
>> -			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
>> -				ret = add_to_unpin_list(&ubuf->unpin_list,
>> -							folios[k]);
>> -				if (ret < 0) {
>> -					kfree(folios);
>> -					goto err;
>> -				}
> I can see that having a loop that iterates from 0 to nr_folios is more intuitive
> compared to the previous version which was a legacy carryover.
>
>> +		for (j = 0, cnt = 0; j < nr_folios; ++j, pgoff = 0) {
> Can all the code in this outer loop be moved into a separate function? This
> would reduce the length of udmabuf_create().
I'll try this in next version
>
>> +			u32 k;
>> +			long fsize = folio_size(folios[j]);
>> +
>> +			ret = add_to_unpin_list(&ubuf->unpin_list, folios[j]);
>> +			if (ret < 0) {
>> +				kfree(folios);
>> +				goto err;
>>   			}
>>
>> -			pgbuf++;
>> -			if (++pgoff == folio_nr_pages(folios[k])) {
>> -				pgoff = 0;
>> -				if (++k == nr_folios)
>> -					break;
>> +			for (k = pgoff; k < fsize; k += PAGE_SIZE) {
> I think renaming k to something like subpgoff or tailpgoff would make this
> more easier to understand.
Yes.
>
>> +				ubuf->folios[pgbuf] = folios[j];
>> +				ubuf->offsets[pgbuf] = k;
>> +				++pgbuf;
>> +
>> +				if (++cnt >= pgcnt)
>> +					goto end;
>>   			}
>>   		}
>> -
>> +end:
>> +		// update the number of pages that have already been set
>> up.
>> +		ubuf->pagecount += pgcnt;
> Since pgbuf also reflects the total number of pages (or folios) processed,
> I think you can use that instead of having to mess with pagecount.
Yes, but need take care of when into error, ubuf->pagecount also need 
update or else, deinit in error path will also "errorr"
>
> Thanks,
> Vivek
>
>>   		kvfree(folios);
>>   		fput(memfd);
>>   		memfd = NULL;
>> --
>> 2.45.2
>>
