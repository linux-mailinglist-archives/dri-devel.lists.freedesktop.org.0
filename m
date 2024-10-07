Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCC9927D5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 11:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81910E329;
	Mon,  7 Oct 2024 09:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dtL9ro18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AA710E329
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 09:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wk2mfR7L3aSmzNt6fmPlu+X99wGsnCvWnMJxD47/UeAxmAbKsm9XFeej/zQ17i/1tbG/YShF+Vk36nfsUIf3AYQ73Nu2uP/hGfqGjutsHwUo8slOFkdJhSyNoLGcq+xNo1ZKTkSF6SFucFL6mLAoATl7XNgqbEhgoFibzgNmurzoDgi9C3X19wVLX0mRjmtaDBxXaW0JXdOFNsI2Cv3hel1p4r78ji0hroMQMv1w0rSLQBlHtyPDg2OxVvLgROeCCMNbYHL8m254GpxaRBxwtuYnlOpd7QmSKsw6k5TtpLVVn1pI4cjYPYjfzf5OvB9WTa5a7J7mkZDuin9kdq/ZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXBUUiqEiIvLBTd9/z0RKKe+q8XGbc/wvKTdkfLurHo=;
 b=cRxFFfqr58uE32u1uxv0EzEQLdMj4N1GJc5oPE8vRz30aycApuSulY29LM/Oag4wr6Z25CS/AxPePZ6EKSJJmigETOJp5qtbBlTw1JRZEaYQrAtXfQ2HMrkQGhuwtDfFyHEwBrtPTFm4tYDO5TuyI1JxXXcTBAYFso6lQNHQVQFez2RWHPRjOnaXZXpPoi2Vk51OuR+KrTG6OVpzG9t3JmLZS5BBjnCeHiPbSt1x9Vl3U+QOjhRuh9IrhfD8IGFIRRrBUkZGBayO4RjjtPzCsY8BxsmbiSteQcOzT9wBOlEXmXwfTpzB/KXAqt8etdaDy+INtRmuC81zusTcyFsPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXBUUiqEiIvLBTd9/z0RKKe+q8XGbc/wvKTdkfLurHo=;
 b=dtL9ro18XlXG3g0aM4tfasdW+ChunO6OXQCG3mVccy7ult0EH+IsSONzLgDRlN6ukxxQpyaPHVH18MUHDk05+dcyCoZMLfS4XhANmxNRUJlrKsrmLf1EAGaaKN3Jj3tsZGZNZwsyh/PCJseCNzrRs4r1wZ6xLeSrAafcQw9lErs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 09:08:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 09:08:20 +0000
Message-ID: <2bca2a15-029e-4d8a-9eb4-3dc54f42798e@amd.com>
Date: Mon, 7 Oct 2024 11:08:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <ZtWca-cpqUsE8WTZ@phenom.ffwll.local>
 <4c634e5c1bd9907f315d8b3535ebb6154819d5ea.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4c634e5c1bd9907f315d8b3535ebb6154819d5ea.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 454d0ec9-12a2-4704-0395-08dce6af9680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjR2emRtemFSWVlXYkdjU29SSEg5RGJ5cWYwcW5DT2kveGYrU0VhNFRvRGpa?=
 =?utf-8?B?Uzk2TWl0S0JwVnJrRGs1WEJNRzJZc3ErVjhjVEZacHpQV0NDQVFVYUY1VW1P?=
 =?utf-8?B?TXQ0ZS84ZXBIU0F6NTVlbHY5L2tMaWp3R1BSdjlKWjluQXNaUkVEVytJVDZR?=
 =?utf-8?B?eUtqZHRMUHR6V2ZORjBpb2d5c0hybFlTTlFoVzdWbzVKNlROOHgwbktYUXoy?=
 =?utf-8?B?czE4NktxQ1hPS2FzZHV6Zmkyazd2WityL0hCOFZUeHZ0cmRLV2J4Y1o1WU9n?=
 =?utf-8?B?cVM5dWUvbkdoTGh3R1JhWDQ2MzFEb29hK3QzZm4rWmgybkl0eUxNWnlnOHZP?=
 =?utf-8?B?WTJGcHBZS0l1Tk9STWxzZnliRXU1dE1DY3VhVVRKUUhQS1FDVU5rWENIMElP?=
 =?utf-8?B?UnpnczZWMkl0TkgyT3J3MDNnbEZiT2xCRE0zMHlLMm5FR1NyZ0dDK0MxeDJz?=
 =?utf-8?B?dWZEdUU4eUdyRGxPNmZkOThyam9YaGo1c1d1V0FJcE56d2RyVDhYOEVML3pH?=
 =?utf-8?B?MkNrOG5iV1FiOFZuQkRUTlA3T0VSZmFBd3JzaFhTNjRvRWRORXhCaEdtcFJT?=
 =?utf-8?B?d3RFci9JVHBmT0FPQUJPMjlLemZ2YjRHT1ZzZWphOHpVV20vVWRiZ1dRR3dw?=
 =?utf-8?B?ZDlENGNGc0J1SU1kbXUxaU9nRys2a00yOURLeWQ1K0h3dWNjL1JIV09MKzNE?=
 =?utf-8?B?bGNYcitsdDkxeEw0UXBkM3lsMEZGZlRKNUxLbUZCZFE1T2RGRDhFZHNMSzBH?=
 =?utf-8?B?MlJZNTkwNGgzQ3BwU3BmSmg2bFhWeXA3TWZVUkdQTDN0cktPZDZJVkd5bzha?=
 =?utf-8?B?UEFsT0ZKZklBRXVYSGVLYnQ3STFZZXhQZ1p6Qk5INExoengxVE5kek9mK25l?=
 =?utf-8?B?QTRLVnZqWXMweWpMR0N4TGN6K3hWVWhOVDZ4L2t4N1VoM1l3Z2l4N045WWhT?=
 =?utf-8?B?QjJlZTQyUENCT0czUUNRa2VpeWttWmxxRkM0aVM1TS9QaTIzZ1ZFY2FKa1RR?=
 =?utf-8?B?KysxRmFrQ3dmbldhZyt6R0tqVGJIOW1EUmhkT216eEh4WFNVdnNEejQyRUp0?=
 =?utf-8?B?TjVDbzV2ODBLY3poWHRpemhENEpoc3NkYWRBVS9Fa21wbENMZ0FaUTVnNWtu?=
 =?utf-8?B?NWZQUG1VSXlJcFVsZXBHazVHZHBRTVI2L3M4cGZaYlN2enIvTVp2ZjdOWGRk?=
 =?utf-8?B?ZlltK21GVjV3SFJaVkJYUmRKRFQ3YWVsZ0xSdnBGSVAzellBRk9wMWZxeUgx?=
 =?utf-8?B?SEhENHpJR0V2WXdDOWc1TFkvY2lDWURXQmFmdCtsRDUwTlJlR0xNVVFpZUZa?=
 =?utf-8?B?TnhsS240M1g2dWJ3a3R2N2ZwUzRKaXRxSW13blB5MWRMUWNpZEVqOXNvQlIv?=
 =?utf-8?B?NmIyTnYwTDh3eDliRzdOaEJCT1ZlS0NTOWprZUhnSjNhR0NOVjErVmVWenRV?=
 =?utf-8?B?NEZDQk1JTjFxdFl0MHNEMmVMRUZDYmp1bzhFZ3ZaK3NBaElsS25XUFYzNW9p?=
 =?utf-8?B?ejZKMzRPYzRkNm1tUDc4TS9xUlYwbW5yNFdvN2ZEMXQwaG1SNDR2b3pvRlha?=
 =?utf-8?B?cm9LaFhmelVmMGhuVmNqOGNrbmdsWmRBOTkyYVBrdytLTnlzeVNlZFo1WDV4?=
 =?utf-8?Q?NX5ZVPu5Zp5LgcvZwgAT9lsJYMfk51H4Wpzuu9wm3QIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUVCZ0FGM1lINDVxT0NBbHRkVzNXTFByamRJQ3cvSHNZV1ZYWXpJTzlyOU9T?=
 =?utf-8?B?cDJnbjVXejFtNDgxS3ZYVjJZODNjY084a3VjZjNHeDl4ZVdKSTVPeERuSHhp?=
 =?utf-8?B?NkFPV0djNGl6bWxvVU0xSkRjZVFOUGUreEwrR0FZVDkwTkhHbG5iS1hKTVlQ?=
 =?utf-8?B?ODZURUZQTFVyblp6WTFUQ1RuV2Z2UWNma0tyWlQ3RjV4NVBmQ3hvUmdUNnJH?=
 =?utf-8?B?dldzT3dXSXY4ZStybkgxbGZ6Zm1zQmQ2T0tyMy81RG4rUWxtZXB3cm1ieHY3?=
 =?utf-8?B?YVlEdVkzUEJVMmwwU3p1cUJGWktrc3hzWVhTRHA5c0Z1QmdmQTl3N0VZSlhR?=
 =?utf-8?B?S1ZkWVRvNWw3dEVFY0xhSHBib2lCSG1CWmJLZUhTOHROK0I1SUZkNXBiL2lJ?=
 =?utf-8?B?NHBxNEZycjVQTjdoamxwdUc1USs1VWRPWXVjSHc0Ykc5RUVHbmlUM2pzdUpI?=
 =?utf-8?B?WmJjb0xxb0I4SjdZWVpNbnpRdTR6bTdUMWlSZ1ZScUk1aURlY2o5UU5YK2p6?=
 =?utf-8?B?WFQvcGtoai83YzBzN3htUDF0cGxJVVVheGMrOG9FeGQ4UHhrYmVuc1oxejl4?=
 =?utf-8?B?YUlNYllnemV3RVZlNlpLaXVhRC9hQTRmVnU4cUptTXFJbTBaUnAvOHhvcmJT?=
 =?utf-8?B?b05VNjc1UnVWN0hXdExyUDlLMjRpYnpDd01nK0JzcDRMYkJQUlBvS3NTRVBT?=
 =?utf-8?B?dDBMQkM0QmNCQWFkOEtiaGhTL2xQdGdrT1NKeDVFU1RZQVpTamVmSTEzeHlP?=
 =?utf-8?B?aGUweXhVcmR5UXd4VE1tUDJMQXUrNDNsZmNQclRnKzVjOCthaVhva0pybVN5?=
 =?utf-8?B?VEE1RXNNVDdaTmovQitmTnBDUVJjcFJFdjhodHE0ZUdwZm1icHdxdm9ibjdk?=
 =?utf-8?B?M2JOUGR5UUZKUEtvTjMxcTVTNTlMM2I4YlhSU3YvK1hMRW0yWWYzQmh3bGdh?=
 =?utf-8?B?N2hUVy9zYkFMOE01dW1oa2FlMHV5bEdPQWVQaGJndnVON3JCVVJoQnJoMzRY?=
 =?utf-8?B?SERVQVd5b3FNT2hZcTl4ejJBNi9WMUMwTW1wYzlLdmR5N1BMWkNQS3psVFlv?=
 =?utf-8?B?dDZnOWlGN0xxVHB6M0xEQ2FORWNId1kxQWhBejZDbzJPSlV0Wk1MR2pnQmRv?=
 =?utf-8?B?RWVxREgxb2lsdHJaa1IwQ3NucTBxUWVZUDJNTXJTMnNuTk9xTzB1V3FqQVcz?=
 =?utf-8?B?K2swM3hXTzk4OTFvSWZ6Mm5zc0luVEhDYXpHOWxyaDFzTXVxUkNrbjZiWXJW?=
 =?utf-8?B?bWtEMytES2xXcFlEalpjN01vUkh2cGlKTnpudkdlRU04R2hzY2xWVXJCSWRw?=
 =?utf-8?B?NGM5MDBGeHpCdTNpK256dkV1bTRBMytOblFCVEFpOVV3a2pSL01ZdmJHenBu?=
 =?utf-8?B?a2tzV0UzQW5EWVN5eHA3MXhvM01tUHNJZ2pXQXlJajJDbWVrYjhGelh2L0gx?=
 =?utf-8?B?b3p0ZzhjQ2FVRkZwUU1ZY3ZQVVVGRGpGWFVldFg1WFVyeGRGQXlIRVgzMnd3?=
 =?utf-8?B?ZUNkenJycFY3a1pERyt0cmRncVFmZnZxcTBSQnNtMkIvbmZ0Zm84ZzM5dUds?=
 =?utf-8?B?UDhLS1FOOWdyUHpiT21PRHVWckliaGNGdGlTZUJmS1EzeEZwa09VcVRRdUVJ?=
 =?utf-8?B?d2kvWXVKUFdYSEFBdDlCeXNRaytWWWNXNHdFMWtnN1dnQXRmMlA2Wk44citO?=
 =?utf-8?B?TGZmK0NyWk4zdkJhSzZGZnZIWkV3ZXphUWVqbHYxc3ovSm1sNFV2OXorc3NQ?=
 =?utf-8?B?MFlMRlJvV2JqamVSL3FXN2FHUXIvdFVISGQvdlBVakIrSGN1WnA3MkRYdVJY?=
 =?utf-8?B?VUJkc3J2aUJCWUFnaGpaMU5KSjFGTEpIK3VUSnpsKzNiQlRWcTVOYTNXQ0lS?=
 =?utf-8?B?dWJHSCtidDFBV2JlcFhjMWp5ZnBqRlo3RDJBT1NmcDFvUkV6SGMxMzRvWTMv?=
 =?utf-8?B?UDd3MjlrOUEzenVwVWVvT3RPdHJQbmZaSXNrQzZsck5TM2NJZHd0THpsYVZC?=
 =?utf-8?B?Y3o5NTFYcElYL2ZRSEpuSkM3SEYrQWVHb2wwaW5IaFJtM2RsdkErWGQ5SnFM?=
 =?utf-8?B?WlF5aWZuNUR1b2R5Y1krcDQ3SmlOZzhPNVU0ZjI0YWswUW4rR1hueGtzelAw?=
 =?utf-8?Q?4wcw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d0ec9-12a2-4704-0395-08dce6af9680
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 09:08:20.0570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxCXyjetcMnvcmk0Bn+NNfCylpTpGx47OcaVIVFe9cK/Fv1JgkBmJFuDXc3wfmjw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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

Hi Thomas,

I'm on sick leave, but I will try to answer questions and share some 
thoughts on this to unblock you.

Am 18.09.24 um 14:57 schrieb Thomas Hellström:
> Sima, Christian
>
> I've updated the shrinker series now with a guarded for_each macro
> instead:
>
> https://patchwork.freedesktop.org/patch/614514/?series=131815&rev=9

Yeah that looks like a big step in the right direction.

> (Note I forgot to remove the export of the previous LRU walker).
>
>   so the midlayer argument is now not an issue anymore. The cleanup.h
> guard provides some additional protection against drivers exiting the
> LRU loop early.
>
> So remaining is the question whether the driver is allowed to discard a
> suggested bo to shrink from TTM.
>
> Arguments for:
>
> 1) Not allowing that would require teaching TTM about purgeable
> objects.

I think that is actually not correct. TTM already knows about purgeable 
objects.

E.g. when TTM asks the driver what to do with evicted objects it is 
perfectly valid to return an empty placement list indicating that the 
backing store can just be thrown away.

We use this for things like temporary buffers for example.

That this doesn't apply to swapping looks like a design bug in the 
driver/TTM interface to me.

> 2) Devices who need the blitter during shrinking would want to punt
> runtime_pm_get() to kswapd to avoid sleeping direct reclaim.

I think the outcome of the discussion is that runtime PM should never be 
mixed into TTM swapping.

You can power up blocks to enable a HW blitter for swapping, but this 
then can't be driven by the runtime PM framework.

> 3) If those devices end up blitting (LNL) to be able to shrink, they
> would want to punt waiting for the fence to signal to kswapd to avoid
> waiting in direct reclaim.

Mhm, what do you mean with that?


> 4) It looks like we need to resort to folio_trylock in the shmem backup
> backend when shrinking is called for gfp_t = GFP_NOFS. A failing
> trylock will require a new bo.

Why would a folio trylock succeed with one BO and not another?

And why would that trylock something the device specific driver should 
handle?

> Arguments against:
> None really. I thought the idea of demidlayering would be to allow the
> driver more freedom.

Well that is a huge argument against it. Giving drivers more freedom is 
absolutely not something which turned out to be valuable in the past.

Instead we should put device drivers in a very strict corset of 
validated approaches to do things.

Background is that in my experience driver developers are perfectly 
willing to do unclean approaches which only work in like 99% of all 
cases just to get a bit more performance or simpler driver implementation.

Those approaches are not legal and in my opinion as subsystem maintainer 
I think we need to be more strict and push back much harder on stuff 
like that.

Regards,
Christian.

>
> So any feedback appreciated. If that is found acceptable we can proceed
> with reviewing this patch and also with the shrinker series.
>
> Thanks,
> Thomas
>
>
> On Mon, 2024-09-02 at 13:07 +0200, Daniel Vetter wrote:
>> On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian König wrote:
>>> Am 27.08.24 um 19:53 schrieb Daniel Vetter:
>>>> On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
>>>>> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König
>>>>> wrote:
>>>>>> Completely agree that this is complicated, but I still don't
>>>>>> see the need
>>>>>> for it.
>>>>>>
>>>>>> Drivers just need to use pm_runtime_get_if_in_use() inside
>>>>>> the shrinker and
>>>>>> postpone all hw activity until resume.
>>>>> Not good enough, at least long term I think. Also postponing hw
>>>>> activity
>>>>> to resume doesn't solve the deadlock issue, if you still need
>>>>> to grab ttm
>>>>> locks on resume.
>>>> Pondered this specific aspect some more, and I think you still
>>>> have a race
>>>> here (even if you avoid the deadlock): If the condiditional
>>>> rpm_get call
>>>> fails there's no guarantee that the device will suspend/resume
>>>> and clean
>>>> up the GART mapping.
>>> Well I think we have a major disconnect here. When the device is
>>> powered
>>> down there is no GART mapping to clean up any more.
>>>
>>> In other words GART is a table in local memory (VRAM) when the
>>> device is
>>> powered down this table is completely destroyed. Any BO which was
>>> mapped
>>> inside this table is now not mapped any more.
>>>
>>> So when the shrinker wants to evict a BO which is marked as mapped
>>> to GART
>>> and the device is powered down we just skip the GART unmapping part
>>> because
>>> that has already implicitly happened during power down.
>>>
>>> Before mapping any BO into the GART again we power the GPU up
>>> through the
>>> runtime PM calls. And while powering it up again the GART is
>>> restored.
>> My point is that you can't tell whether the device will power down or
>> not,
>> you can only tell whether there's a chance it might be powering down
>> and
>> so you can't get at the rpm reference without deadlock issues.
>>
>>>> The race gets a bit smaller if you use
>>>> pm_runtime_get_if_active(), but even then you might catch it
>>>> right when
>>>> resume almost finished.
>>> What race are you talking about?
>>>
>>> The worst thing which could happen is that we restore a GART entry
>>> which
>>> isn't needed any more, but that is pretty much irrelevant since we
>>> only
>>> clear them to avoid some hw bugs.
>> The race I'm seeing is where you thought the GART entry is not issue,
>> tossed an object, but the device didn't suspend, so might still use
>> it.
>>
>> I guess if we're clearly separating the sw allocation of the TTM_TT
>> with
>> the physical entries in the GART that should all work, but feels a
>> bit
>> tricky. The race I've seen is essentially these two getting out of
>> sync.
>>
>> So maybe it was me who's stuck.
>>
>> What I wonder is whether it works in practice, since on the restore
>> side
>> you need to get some locks to figure out which gart mappings exist
>> and
>> need restoring. And that's the same locks as the shrinker needs to
>> figure
>> out whether it might need to reap a gart mapping.
>>
>> Or do you just copy the gart entries over and restore them exactly
>> as-is,
>> so that there's no shared locks?
>>
>>>> That means we'll have ttm bo hanging around with GART
>>>> allocations/mappings
>>>> which aren't actually valid anymore (since they might escape the
>>>> cleanup
>>>> upon resume due to the race). That doesn't feel like a solid
>>>> design
>>>> either.
>>> I'm most likely missing something, but I'm really scratching my
>>> head where
>>> you see a problem here.
>> I guess one issue is that at least traditionally, igfx drivers have
>> nested
>> runtime pm within dma_resv lock. And dgpu drivers the other way
>> round.
>> Which is a bit awkward if you're trying for common code.
>>
>> Cheers, Sima

