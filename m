Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD309A6EBF9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD3610E128;
	Tue, 25 Mar 2025 08:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a8AXfXwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5D10E128
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkklFw8kNVrJdasNCZsQ2n/fNHKDD2EyRd7cpaKpD61Kr/gLgKzgxcTf7M7qvEhQ6kg6e8NQn5YwrYCvw9+geHuJAHPtqmwsfDl/+XRGXfrPWwaqlYQFNk6V9lSelaaEoatd5xWXFKptoyhLXg/RKFyMQMfRLGNMfnrMc+Y7CZkFADtVd5ZFHNK0z8pIac01k0xTTcTmogBrldfefhJ/rQlbefoZF7m4RwNDayTl542w3sqOSOrZPD7VTUmo1uJDZWk0uY/qlONgtux3JiqgF2zcHeVQlXiR4sx3jK3kaI1pdZxfJThEpRyr/x47vjNOGS0tabh7KqVayUjWUiPPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVGhXo/B9a/d4bF9177Xo6kxwPvCE+f160IrQJPXnV0=;
 b=hOT/z07p2iXcuL/tY/NBEyRIgExI4yzgLwng0+Rg77w2WButvIfR9fBZQ6Za0jWekBbakQOkkgNjUjTC7nMOJ7mfSdw+zAnota8OCYCzTfC9Nv/YZE+bGMJsq3VQfm8Y95/Q7/+DsvZKl7d/PnHlnO3zQQW0YwGPv2Njue3L2Rjfn/nOvy9/74xMm6l7N0AoRM00rpO4rvOl4egmY5JOYBHlwHfcfKR01Hzi1dMgfKNAwCC43Vny2nSQRhD3X56etcSVe1YG9CvyPTjJsH+NxeYpxvds9zRiTPYlueqwRjaOAripIK+hsrmnR96Vh3EsowePCwcWDaq8u7nSDJtKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVGhXo/B9a/d4bF9177Xo6kxwPvCE+f160IrQJPXnV0=;
 b=a8AXfXwqrv0rsI9uvkRNhSpL9eCL+uc3BITVYY39niWslEVBXyfm531hTpL5WFb7XlXNuf3G6r62cQsBdDHblV6ERSUqNy7mhEaSyQa8iNPtUjPwmjuXzJupIhMeSy+rNk9oFzNB0mirkV9Zc4eZ74YU0jU8Qgx0tLhNIw3OjF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:53:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 08:53:46 +0000
Message-ID: <099dbff3-42fb-4445-b5a0-1c4031bb9e7c@amd.com>
Date: Tue, 25 Mar 2025 09:53:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "Xiaogang.Chen" <xiaogang.chen@amd.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20250321164126.329638-1-xiaogang.chen@amd.com>
 <555feb70-5d80-4a36-818f-f00fbc3dff23@amd.com>
 <IA0PR11MB718563F5C571E07F1314F152F8A72@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA0PR11MB718563F5C571E07F1314F152F8A72@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d5acd7-6a02-4843-0422-08dd6b7a8db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzdqTXFaQ2lZUnhzTnFaM0wyeERnbytKSVdJNGpEVkJ2TjFrTWdaYjQ4ZWFl?=
 =?utf-8?B?WmJyMkZhZFlkcysxbHd3bW9NSkNURTZMZFlTc0pqVE1LOU9CSVZrbldYTVBL?=
 =?utf-8?B?dERONDlQejNZbEhpbERzZGRjN3hFR2d5c3BTUGJlcG5JbjJWK3RzcXFrS2lN?=
 =?utf-8?B?dU40M1ZCL1VBSVBsdkJqZEpCRjJMaW9EbHBzbStaOC8waWpZZE5YaWZMZlpS?=
 =?utf-8?B?OGw4RVk2WkoyREtDa25UOG8wZjUrM2c2UU1mRUp4Tmx4ODVsMXM1bmhVTHkr?=
 =?utf-8?B?THk4Tm5yQWptYU5vZGVudTU3OC9xSFhjbklJWGJzbkNYMUsvcmZBc3ErUXFW?=
 =?utf-8?B?OXo3bk1SaFVtQmtKcEFleU91YXl2cmhFdlhYaHo5WVRPSVpJV2h5S1FlWVc0?=
 =?utf-8?B?aWJDRGRPVUJveExvazZRa3I5Z3d4YzVTUDFZYXA5T3huMFZzUWdKU0trNjB5?=
 =?utf-8?B?N0Z1OENueXl3U1hocGorY21WdXIyd0wxa2NlNTdSakZ2SWZ0cGVJNmFHeFg2?=
 =?utf-8?B?emFFTEdFVXY2dFRTUXcvZGUxNkQ3bm1MV3FNUTFtcUpERHdLemZWSjVwL3Fu?=
 =?utf-8?B?UGMrdDFmYlp0N1g3ajR5TkJndDJmWDd2OTNBeEJNMzQ0TWRMcDNIRjBxb2Zq?=
 =?utf-8?B?Z201ZXJGZHBXaHhTYWsvV0JFSlpKbkozTWRTZFpmVmovczd2cGdtQm90TjZT?=
 =?utf-8?B?UE9CS3dtYU5GS2F1a2ZCaWlDbEpuekVGZktLeFpSUlgzRnpPQXlPYU4rdFRH?=
 =?utf-8?B?V3d5MHMzakZ1cENhQXJSZ0t6L2RZR3lqTFNBNTUyaC8zaUJFT2I0OG1ka3dK?=
 =?utf-8?B?QXpjL1RlMkxTaGo4eUgxaTI4V0ZGQnRzQkJ1Z0tpeHB1bUNOd3VtcHRhV0w3?=
 =?utf-8?B?TlBCRWF0NHBVSmplazlsYjFGZElXUjNKc3FXamtQd1pEY2p5b3didUdiSXRY?=
 =?utf-8?B?R091UHdsZnNBUDBWRkVwUFU3QlVDeFc0OGJLR3ZZS0NiZFVkdnNWZzBrcmE1?=
 =?utf-8?B?eFBsMlVUejR4NzdKSnMwTlhheEh2clRDcGRyaElXNkJQblhEMGRnRTBlTmJ3?=
 =?utf-8?B?b2tJQWFqcGVicEMxbm1KbXZWTnJQMDBLZ0J5dWFBUUhuYnRWQ1pwdHJkOXVi?=
 =?utf-8?B?WHNnT2gvbmw4QkNValFtbG1JVmt3MGdaSXBQaW1YYU5qYVJjdlJiS1RjMURx?=
 =?utf-8?B?NXlWZXdoZGgxWU9ra3hQd0FVeXJhSE5jTUUxc3RHdkJCdGNmaGFQbDkvSFAx?=
 =?utf-8?B?b2g1VHNzK1ZoSGk2SWhNRHpMRUREcUlvNktzTkQwU0p2SmFJRGZhdXU2TFJk?=
 =?utf-8?B?VUxvOWFBOUNyb0FOaFhGcmhFWG1uVkRPNGxQbS9GZFp1NzhOalhFRElrQ3F1?=
 =?utf-8?B?V0YyZnQ5TTlxb0h4TWpsbHp3UGZoZStxbFh0cTNta0NLd0VLazB4NWhYd0U1?=
 =?utf-8?B?WjZ2eG5wK090UnkzaGJvVlZYUU03dkJQSTE5TWZMbitrZnV4Wi9hcURZQ3hG?=
 =?utf-8?B?UndYUzhBNktaMmpQdW81c2ZvUjJUZmhreUVtYkt2UWRsak00Z1dXaWZsb1Fv?=
 =?utf-8?B?dlNLTUM0M2xqUkFsUjRDelV4NnNCWlF2QUovWFpwSXFIeTJnQVZ5eTQ2c0Fa?=
 =?utf-8?B?SUJQVE9Kc2hOQW81YkdMbWNmcjF2QlMwaW1iZUoxdTYwTGRJZ3Q1WmpPK3RI?=
 =?utf-8?B?NGRGdFNXMURHSUszY2pWdzVRNTZ2WjBDVTR6UUZ5aXRzUllEYlVETXFrQXRP?=
 =?utf-8?B?dVoyTXRBQXQ2TXpETzBZSmp3Nnd4ZHZqbUNuY1BxYUZ4QlF6Sm5VMHpTMkNl?=
 =?utf-8?B?b1pVVTBlaitEbTE2MnI1Q1V0aDhIYWlCQ1NFNTI3V2tFcEx0MlFwM0lJRFhZ?=
 =?utf-8?Q?KXXMQDq/Hc2Gn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TllUaDN2Z0VNYUd6dW5KVE9lTWg3NTA5YVRKbjRXbnU3NWVTc2J4bkVPd2h5?=
 =?utf-8?B?NUt6amY3aEM4b2tQaFZLMHY5aE9MdW1ZN2VsdU5PTUl4ZWl5YVQzV0M1bEVz?=
 =?utf-8?B?K3NzS0twTzgvYmtUVG0zNmZ4TlgxRlBoTlh5N0ZHalpZRURCZHh4a29BOWt1?=
 =?utf-8?B?VVRDUWRaZy82UzZZckZwY2RZNFErbnV0VEFOTndjT2xUaHM1NUkrZzRsZnhN?=
 =?utf-8?B?M3N6ZVRadlZ4Wnc4T2pFbDZaUzkxam9Za0s4cmNRbmg1enBSOXl2enVLenhZ?=
 =?utf-8?B?V1pJeWVnbXd5ZWZqMTV1a3JQblNmQUxObi9BUWlrYWNONGdQQU83dDlkbFF4?=
 =?utf-8?B?SzFNMC96U2Q0NklsdmdQemlwVjRJU3JUM1ZOekgwcy9VWXU2ZXFObWhrYStn?=
 =?utf-8?B?SlVCaFRGM1F2aHlEa1MveUpOQzJtenczZTdsQUZhZGF5ZlJ2WWxTeXdXYXh1?=
 =?utf-8?B?VFJUaUpSTUZtekp2VytONEhXL0Y1RFpSTVlRT0dNNXhhaTdPajhpSzhBM1lh?=
 =?utf-8?B?OUZFZE1xMkNnZi9JZ09KR3VEUjQ4SXkvWDNSN05sb0RpRkVsaURVanB5QTNh?=
 =?utf-8?B?Y2FMMmZxaDl4NkpkTzhXd2kzdS9MdWtBemhEZ29UOStiUTVjY3RBeWphOXIv?=
 =?utf-8?B?LzZEakU1UnMwK1l4WHEwR1g0STduazBoNEw2M0luTUxmTkpUNlBteHRpbVZ1?=
 =?utf-8?B?QU9MTkhxVy9ZN2x2YkhXaEpwN0V4Ukp0emtvU3RQSUx2K1VuQXA0dTVXR2lk?=
 =?utf-8?B?b0NPSGJGMjVoUER6ejR5YzZmQWlTZDRkUnFIUFlPMjQ3VW1TcE8wWU5xdEZO?=
 =?utf-8?B?RjZ4a3RaUTEzWnlXZ3FLbXJUQjczUXFtczF4OVF6MkpLNHd6S1k2cTVsTktx?=
 =?utf-8?B?NXQwVElzRll0dXZncXFYSGRkRXJlZDlOTVk1M0ZUcmxzSHUrcTR3WTFTejJp?=
 =?utf-8?B?NmdYQ0hFOUFZTnQ2YlExTnFHc2NQeTRrdS9MbmswZWVkbnEzazdUVW5EYjdP?=
 =?utf-8?B?WUx5R0x3eVZKTnhYd254TE16cHphOFFyNUlJYlBmaUdVbk9kaUI3Tk8zUVdB?=
 =?utf-8?B?OTlUaytMV3c4YUM1R0pZSlZiYzVzQnQ2TWkxTlQ5SVl0eXZENjJHTVNSUzVX?=
 =?utf-8?B?eXllbWE1REYyZlk0dkd4b0lpMHBJVkhTYUEzWFJBZEFSQUhlcmV0NS9Ra0wx?=
 =?utf-8?B?SmVmVnlUWDRHcE1PWU9ET3hGOUdCaUVDU3I0ekwvdHF6d1F1WVVUVnM1Y0w4?=
 =?utf-8?B?VklSLy9NcExqWnNQSm9iK0RhSGw5bVRaRFlBbWF0UTYwZGtxaVR3OXVhMDRH?=
 =?utf-8?B?Z1FXYlhOZzhHWEZaSlRQYnNOQjBsT1VrMlZNWmYxNGFhQjRFN3lPUEgzZENI?=
 =?utf-8?B?YXppRTVqazJCWXVEbThXZk5NMGlkNHoxU2JBblg1anE1ZTFQcWZPbjZXK0NV?=
 =?utf-8?B?WkgxdjI2ZnlCWFQxdkxNblFrYUd2a0dWYkdEc0d3QnB3ZC9ISzFHMndXNFhn?=
 =?utf-8?B?WTEvUzNXRlRDelY5QXI3TTYwTC9VYS9BT1JBbmIvVG1BRGxWV2RINlJ0SzlN?=
 =?utf-8?B?WFRxeFNVZUp3NDNIaFFrWHh3dXl3OUpFcjNvRDUzN01KR25FR2Vsdi9welV5?=
 =?utf-8?B?cE0ra1BEU2w5ZEc3UXJ5ZmYweks0WWw5dHFGeXEvRFRWeXdkdmlWalNYQzBk?=
 =?utf-8?B?MEZBbDV1UzFNM09oUEt1YWZxcXRkWktOWVcybjlXY0h5WDRmS1BJZlBSbytP?=
 =?utf-8?B?TTAyRGh2R25JV1hnME9yaUJxNm8vcTZQMEU0b2tpaFY5Mi90b0JhVXMxUUs0?=
 =?utf-8?B?eXZxRFRNZTh6RmdsemprTUwrZjl0Q2R3NUhsN040UnQ2RDBJM29sbHp3Y096?=
 =?utf-8?B?aDZ3M21UYkNQb0pwT3lVWHZEVjF5dVFYNG9iQ0taeE5jVmh0TVNTMTlwVWhN?=
 =?utf-8?B?Q0k1ZUpnU3hLa2Z6K1l1dkp5RlBTcTRYTEtyRzY0dm5pYlZjcXNmU2RUQ3Jp?=
 =?utf-8?B?TjlJSnRrMjdNdUxrMWVoc3BZS3FySmNlZStkTVI3SEVFN3lCWXYzUU9kbkMv?=
 =?utf-8?B?eGlHNTBNTlozdnkrU3JsY2VPTkl1U0xHcHo4S1lOOTVjTWNhRzRRb1pmY0xH?=
 =?utf-8?Q?eLCXSr4sdMQrUr9CTKDO3DiHa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d5acd7-6a02-4843-0422-08dd6b7a8db0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:53:46.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbvpojbtNmDUuQVTMBwVoPtZ7XjEtAPXOAHz9V3Cdt9APPKUdN0JEYdH7v3iQ3Z7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
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

Am 25.03.25 um 07:23 schrieb Kasireddy, Vivek:
> Hi Christian,
>
>> Am 21.03.25 um 17:41 schrieb Xiaogang.Chen:
>>> From: Xiaogang Chen <xiaogang.chen@amd.com>
>>>
>>> by casting size_limit_mb to u64  when calculate pglimit.
>>>
>>> Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> If nobody objects I'm going to push that to drm-misc-fixes.
> No objection but I wish the author would have added more details in the commit
> message particularly the value they have used to trigger the overflow. I guess
> Xiaogang can still comment here and briefly describe the exact use-case/test-case
> they are running where they encountered this issue.

Isn't that obvious? At least it was for me.

As soon as you have a value larger than 4095 the 32bit multiplication overflows, resulting in incorrectly limiting the buffer size.

Regards,
Christian.

>
> Thanks,
> Vivek
>
>> Regards,
>> Christian.
>>
>>> ---
>>>  drivers/dma-buf/udmabuf.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>> index 8ce1f074c2d3..e99e3a65a470 100644
>>> --- a/drivers/dma-buf/udmabuf.c
>>> +++ b/drivers/dma-buf/udmabuf.c
>>> @@ -398,7 +398,7 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>>  	if (!ubuf)
>>>  		return -ENOMEM;
>>>
>>> -	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>> +	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>>  	for (i = 0; i < head->count; i++) {
>>>  		pgoff_t subpgcnt;
>>>

