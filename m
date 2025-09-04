Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F23B43A21
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9F510EA00;
	Thu,  4 Sep 2025 11:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AAv4kMkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E1310EA00
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk182xavrhBS+B8iUq3KXemku4bri1n8S9EM9lYl+0Q0FppbH6GmIdmLHGBIeDVOZH7lCJfvfoyxGhhiWsqhU8XkkT/mAtH1uUmMpXsWweDLLI5j84n/iquWIN+vRNgGZ83qOfuq15rJL4lHrfXvKlfdK3tDV63aR6/Z2T5pS/etMdJvEBYOplunexBnkS3Pl8AHQV0CxBURm8PEwK1aLLbM7pmBHUvw4uqrMjB/CdpSIbJJJnILcrwnD0FHTFbvx/isUOcLXuKHqOH/wWGqAjvhSQq8ivNmLFApojKt4rg3Nfx6SK5tCDJT2Zm+TW7PZgT1zEH9HCsTcbn/+rMhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtRC4pJ3JElyKNWPuwr9bpqL6fvobQi+YiI3Nr70TL4=;
 b=HQAzxscMZezpRrwvvXgj/X5Rn2PY9EZoR2MY3sdyraeLN1KzRZB8woEHq6KPH+OZ8ajDd71J+q23aIRdNLcPYyWIS+IPHoExFEgiAylr/5at97HD6nD5pB72Hyc3oQc97JEE0LTLp4D1AsbKHszMtL+LC/JX1acy+4TfkfGuhvNX3OiiGcoDoAvyGnqB1UwaGG0yvfawT1kJibjrtGpZvCPf0w5v6psVHLfa4LIRhNfXMeGWFsR6PrQCX8v/6cfdWsknryiMj8fftUg/NUFtvzOsKujYkw8KPFVs8oS2cANqwN3Q7KeeqGfYbwaw5WGfuqKjteEGeEbPnDu278O6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtRC4pJ3JElyKNWPuwr9bpqL6fvobQi+YiI3Nr70TL4=;
 b=AAv4kMkTnuyVWFDN5BAZGilygttifb9lc67YgKdcIy1iZc/TesoK2SSSFbLc1nRMKFFkW9Ezx44hQBGqbzEPeEdgyJn1PTE0DuC59CUATkrNj2J6FChdXCps4lXm8CcWL/K4b6z/HXJKLFjtYSOxTJ0lchXX7migYiVv4qISZk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:30:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 11:30:06 +0000
Message-ID: <f4d04144-d8e7-4d4e-81a9-65e1fcef26fd@amd.com>
Date: Thu, 4 Sep 2025 13:29:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-12-airlied@gmail.com>
 <4e462912-64de-461c-8c4b-204e6f58dde8@amd.com>
 <CAPM=9txiApDK8riR3TH3gM2V0pVwGBD5WobbXv2_bfoH+wsgSw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txiApDK8riR3TH3gM2V0pVwGBD5WobbXv2_bfoH+wsgSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f21912-b7dd-4acc-914e-08ddeba66584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUVsRm1BekhsNmI4d0YycnpyR0d5ZEEvak1IemJmcHhiNWdYZnRpakg1RmNy?=
 =?utf-8?B?cGxWR1FmeVJwYkRaRXJpU1ZkODIxdEU3dkcwcE8vaHdzTWVROFI4Rm9STG9p?=
 =?utf-8?B?djZSdWhEczRZY0dqbnFBeU1kN0xIOTFtQjFRNkZyVFBvcWVqcVp2MXF3MDIr?=
 =?utf-8?B?amN6UENZUUY3RjBUVkFidDZoTWNjckI4OE56R3dUVGhmTzdkY0cxakgrL2dS?=
 =?utf-8?B?MmdiNlMwY1dHNUVWZlVyUVN6Wnh3TjBsMG9aalFINERUblpnRzRudlozdFAw?=
 =?utf-8?B?MEZrcHVpV2I5K3hvbzJzSG5wL0xhdXZLRzZHUUdCb0MyZm1Bc05UeTdSei9z?=
 =?utf-8?B?Qnk5YzVMb0RoS0VpR2x0UWxkVUFWUmlwK0dRWC9nRzhaRDZwdkRJakpDcCtV?=
 =?utf-8?B?WjdpM1lzRzBCZFVKL3pCM2diSWpaNWlrdnVBMVFUbXVHVXhnWm84emRRN3By?=
 =?utf-8?B?Y0tqUGRuMFkyek14NUdGQWt5NVNaanpqMnRLb25jMjdyZ2dYSElBL1dtaDFz?=
 =?utf-8?B?V1ZqcThXTlZMU1drOWJaRkdrd2VzQ3RITkpZaFBLT0YwTEt2VlYwbjc2d3Vq?=
 =?utf-8?B?M21zaGtsVUhUT04zOUZRTm4xMlIyamF3R2hOaURyaWY1cHJhNWZXYjRPbXFV?=
 =?utf-8?B?ZVNXVFFPbjRBeEtYWlp5cVFZYUZObWpxa0FWUVBnaWc2aXdER1NOcmxTaDJN?=
 =?utf-8?B?Z25OVktlOXZ3TDN1dGMyUnNiTnB0Mjd4VjZwWFlmdkdLUW5vK2pRS2JEUDh3?=
 =?utf-8?B?Y2ViTVAxMnZKaVZ6TWJJQTFOb05ZSGZ5VDBSdGZpSThiRTFhb2MveEtlZm5U?=
 =?utf-8?B?cnpFc0xpaVhEditoVHBGbEk0eGdtSXNJUVVGL2RPTGN2SHhmU2dGWHljRDhn?=
 =?utf-8?B?dE5oWmVldFdJVy9RL3NzQlpzc0VpaUxJTFpyRFBDZytiekE4UEJmY2IxbStG?=
 =?utf-8?B?cFhrVTVyZzBpWkJMWXZYTFg2SlU0LzMwdGtMMHNzRE5rVk0xV3NiSCtCaWUz?=
 =?utf-8?B?aWlzNE00b0hLT0RJTG5XRlpqZVNCa1FUMWFnbVFLK0plZjBCUDZ6NHpaeEJ1?=
 =?utf-8?B?UlFjbmNpVzFzWE5OaWlXeFNZa2ZVemRrMTU5Z2JRRzl4bGNiZStJMzgvRFVQ?=
 =?utf-8?B?ZlUwUVRZa3RhaWlaaTc3N2VKbUFZMmdydWZXQ09MSjJQV2IrUGtDdTVOcWpC?=
 =?utf-8?B?d2YzL2Y2aFZTRzdyNk1MdUlzb0JZOEFtaUpFUnd0V295ZlJtc0RiRms3TEpT?=
 =?utf-8?B?SjY1NC9TczdraHQxSXJnZXlHdmREUXhMeWFlZE9Zb0xTWHNCdGN1YkN2cEZj?=
 =?utf-8?B?NDl4R09qMUN4alVzSzVTTzljQkVHQUF5ZlFYMjAwcFppR2dUKzRHR0lTSmh5?=
 =?utf-8?B?cTRuaGJmUzB1c2JrQTB3cTdTQTMwQWRNc0dFVm5SSlhCMXNIcnVicjVPcVRU?=
 =?utf-8?B?M0cyM3RsL25lc2NmaVpCK3FkVnlKbm1lUkJNbTlNT2dndlkyakVrdVg4ZlhI?=
 =?utf-8?B?bDU2Yy9JL2lCaU1rWWRadkllNGczNFE4djk4RTFwZDcvaUtLNWdXOFFGdnFq?=
 =?utf-8?B?YlIvdlRxSnpUUm96NnFuYVdWaTU2MDg3Tk5uSEFqYkJtdEVqZ2RXbCtFYTVB?=
 =?utf-8?B?MklYdXhvZVVTZ21TQTVvV3plRnMxTFRuMU50YWVDdHF3Qkx1TElHR21ubHlq?=
 =?utf-8?B?ZGVVQzMycVJPYjVsVGs0ZEVvZUljOVJlU0VGenFJVUwycklYN2I0SUZHblhR?=
 =?utf-8?B?aVFRN0F2bitONGRRWlZTdUgydkNnK3pYN2NyQTk1d3hBbHp3Z1JldjQvOVNi?=
 =?utf-8?B?dUhnMjdhR1BIVVUzMjVkc3Y3WE0yTmJJQ3lhNjI3NlYyY2JDNWNCY0ZxTzRY?=
 =?utf-8?B?SXROWXZKRjBram1TYVBHWmlGTXYra2JocXhQOUxjUkZDRWlhQVVWb3liOTRZ?=
 =?utf-8?Q?Lt8d0F4za64=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlNNC81OGlNZ1J4ck9Ldit6WkVjZVRKd2xjbGZibUxBTFRVYlFzM29wNjc5?=
 =?utf-8?B?UTJyUHNTL0ozNWIxby9tRkJSdGVHRXNiZFV6eWZicVFDU0x3UkdleURrMUlu?=
 =?utf-8?B?ZnZhdUViUmdETEpIcGZNUzAvNmU0VVhIZnNDWFZzOS8vRDFLa2JzVm5rbTl2?=
 =?utf-8?B?aGFBOU40ZjVpLzVyUVZSazdvQXRDNHp0SlpHRHFtSjRTcE4xY1pXNCtZc1cr?=
 =?utf-8?B?U3dUT2tXaDd3bStNekNvTEhvdHJ5cG5aSFBlV0RINEpJQytGK2xwU3RCNWJB?=
 =?utf-8?B?eGFMc3I4NmJHUkVHUWowS3BUR0NVN3ZadzlxcU9idnlqck0rOXpLZ1M0MW9B?=
 =?utf-8?B?bklDVHlOL21ISmllZlFmaDZ3SkhqbWZhL2NlbEJhbUY3UFFaRW5sZEtuZTRY?=
 =?utf-8?B?SXExRlBrMEZlKzhJeFVQY0FETFRTSG16MUJ6UkpwV2RvOG4xczBkckZiRWNB?=
 =?utf-8?B?OGdaNFRSWDcvOUpkRTEwZzkwMFpnVTUvMWtIbFN5dWt4ZVdzSXYzYkdjaFR3?=
 =?utf-8?B?MUVUNnA1OGk3bEpNK0hFK2FMVHRpRmZSY01NTmpUelZLTlBuZzlaT0hOSGh5?=
 =?utf-8?B?eHptMjk1L2JiNEd4cmhkZG5KTDdaa0NXVVRiMCtJeUhtVlVQUmFkT0oxT3Nj?=
 =?utf-8?B?Z0EvdzEvK1BiU3RPdlJlby9LbTdtMWMrZHc5M1ZEV3dLRmZSVWI3cURIb2lR?=
 =?utf-8?B?dVhpSzNldmVaNjFqL1A2VXZVUjRlQ2FtKzlvL2xUcVpqdVBXYjduVHlLNEFE?=
 =?utf-8?B?Q0JCZkp0R2F6cmJsNWJWSGJ0SXY2STd6SU5CQ0t0ODR0a09WQjhEcnFXWUlV?=
 =?utf-8?B?dkJoNjVYS3lraXZMejlIYWdxZ3NDbS9KRFFUbVo1d0VKQmdqT3BrcGdGQnpS?=
 =?utf-8?B?UlpZbTd4aExwWkhOVnc5OFVwUEdlNFFUbHdFMXRnNGpEODJYRDRQZU5kc0N6?=
 =?utf-8?B?ZTJLYXA4TDY4SjZVeG0rbmlwTEt6S21GKzI1Unc2RGJmQ0c5R1JRY21JM3ZV?=
 =?utf-8?B?TklkQUx5L3BqSkN1TFRSQVdHRGFkY05ZYXVwcjRKSHM0QjEwZEhTR3YvRkQ3?=
 =?utf-8?B?SkRRTS8zdVg3LzA4bklrVGFIS21TeWVETXh0cE45aWhGNkxGTFIzUU5oK3JP?=
 =?utf-8?B?U2RnOERDN3Q3ZHN1bUpjckl1bytnTVFVM2xGN28vSEdpenVsYm9QWThySkhT?=
 =?utf-8?B?Z3dsTkZSWXMvZGdUaWljL2xjck5uczQvWW5XYmN0R053bXFPc05DT3hhZEhX?=
 =?utf-8?B?UFlRajJ3N2dUSWsxUVN0azNYYWV2eDVnZzJvZytFZC9EbmFwV1lXRldoY0RQ?=
 =?utf-8?B?SkI2dE5HYzNCUWdPZCtnRnVNVFRPRm1JRXBINGJmYm81TGJKWWduRUFWTXc3?=
 =?utf-8?B?ZHFWWUM2TGoxR0NuOUtxcnV6WU80djZ4S3NRaTBERC9EZWRseFlNZmlpbW14?=
 =?utf-8?B?VzE3djlBb0VDTzNDMWtnZjd0VnZTNjkyZFhnSjk1Y1FSRmljQTZkUlIxSGZU?=
 =?utf-8?B?Qm9pZUtIdEc0eGJZdER4aENXcDVuTmk2cGx2K1Fkd0NGTXdTTllNMk5nbndD?=
 =?utf-8?B?UG5iREZYQ1hFdjRGb3JwVGkzKzMwQ21aNWZ4Yk5HSWVPbm5WMHdpN09mcnNK?=
 =?utf-8?B?R0pTRTMyaEtsN3FlbVM4QlFPOUxYYnF0ckV3aHd0QTZQL09hdnJRakhna05F?=
 =?utf-8?B?UXVTUitMZmtaWitNb1NjeWhCYmVRSzE3dDVOeTE0V3NHTFAzdy9wUXY0djN1?=
 =?utf-8?B?bCsySHVJUHg2NmJ2MHFXcGZKcWVvQjdQNGxXSllLM3hUNmJ1VG12b3Z3anhB?=
 =?utf-8?B?M3Q2WXhNTzhWMHc2OXJTM3FNZUduSTVWODdRWjJUUzNyL0FwL0JQNmJhY0hi?=
 =?utf-8?B?bkxDUStYUEIveDkzWTY3Vm1pQmpmVUJrWmhrYWNMYUxmbVh0Y2FHNktMVGJt?=
 =?utf-8?B?N0swTmlxWFFGTTV4d255K3BReUwrUytsNlNkTUlIejBld0k0WHJ4TlVBbHdP?=
 =?utf-8?B?Rll1eC92c2Y3bnhvK3FpWmNkOWljdFNnSWdQdVFIbTFrN2xtZkZBcXI4Q3JD?=
 =?utf-8?B?YUFBdFJxWXRzK25YQS9rVmZMUkZmaTVQK1lXWVY3WlFsSTdMSzNSUmRoUzhw?=
 =?utf-8?Q?d+syDrUt7+8FmClrITp6FlGbk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f21912-b7dd-4acc-914e-08ddeba66584
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:30:05.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjODfYDLj8IyZZaPKCtA8th9T6ITATZqj2oL9eHRES6rQctyLslW8C6YDrsUM7yi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B
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

On 04.09.25 04:25, Dave Airlie wrote:
> On Wed, 3 Sept 2025 at 00:23, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 02.09.25 06:06, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> This enables all the backend code to use the list lru in memcg mode,
>>> and set the shrinker to be memcg aware.
>>>
>>> It adds the loop case for when pooled pages end up being reparented
>>> to a higher memcg group, that newer memcg can search for them there
>>> and take them back.
>>
>> I can only repeat that as far as I can see that makes no sense at all.
>>
>> This just enables stealing pages from the page pool per cgroup and won't give them back if another cgroup runs into a low memery situation.
>>
>> Maybe Thomas and the XE guys have an use case for that, but as far as I can see that behavior is not something we would ever want.
> 
> This is what I'd want for a desktop use case at least, if we have a
> top level cgroup then logged in user cgroups, each user will own their
> own uncached pages pool and not cause side effects to other users. If
> they finish running their pool will get give to the parent.
> 
> Any new pool will get pages from the parent, and manage them itself.
> 
> This is also what cgroup developers have said makes the most sense for
> containerisation here, one cgroup allocator should not be able to
> cause shrink work for another cgroup unnecessarily.

The key point is i915 is doing the exact same thing completely without a pool and with *MUCH* less overhead.

Together with Thomas I've implemented that approach for TTM as WIP patch and on a Ryzen 7 page faulting becomes nearly ten times faster.

The problem is that the PAT and other legacy handling is like two decades old now and it seems like nobody can remember how it is actually supposed to work.

See this patch here for example as well:

commit 9542ada803198e6eba29d3289abb39ea82047b92
Author: Suresh Siddha <suresh.b.siddha@intel.com>
Date:   Wed Sep 24 08:53:33 2008 -0700

    x86: track memtype for RAM in page struct
    
    Track the memtype for RAM pages in page struct instead of using the
    memtype list. This avoids the explosion in the number of entries in
    memtype list (of the order of 20,000 with AGP) and makes the PAT
    tracking simpler.
    
    We are using PG_arch_1 bit in page->flags.
    
    We still use the memtype list for non RAM pages.
    
    Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>
    Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

So we absolutely *do* have a page flag to indicate the cached vs uncached status, it's just that we can't allocate those pages in TTM for some reason. I'm still digging up what part is missing here.

What I want to avoid is that we created UAPI or at least specific behavior people then start to rely upon. That would make it much more problematic to remove the pool in the long term.

Regards,
Christian.


> 
> Dave.

