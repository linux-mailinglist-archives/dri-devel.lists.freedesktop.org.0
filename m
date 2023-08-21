Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D2782655
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4910E218;
	Mon, 21 Aug 2023 09:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFED10E215;
 Mon, 21 Aug 2023 09:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8MmrP60kkdjANfI3jrQBg8To8KdvyoaQEqioOlN97Ttiy36aG4zbb350PWy5605IowrDxPoXwH/AWAe5BQJ+bZ0F7h22ltoESjnCmxn+UVeUGYehSTjALTOScqhXZNe2DAH1CWq6biXRfwBgz41jBBEaa0pExcYQxC4yJkTin2/IX5JgwSIACqftNbSmwmQa1CJOfmOq1NafS0wj463yN8iwLUzZmqr0XdzEYrTwm5lu4IMsAzQ2oAicpUHGWQ7Haarqwy7DczZALreTsnxrZLdULV+e2UWvA3M5jOQgX+xdPBRAaV1do5dh0S5Bogu+TSlGC2LNHgQ3N2xxYtzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ly9u3phEGi7AGrh0z85G7a8HE5mXqq1L5yQ68rPeZek=;
 b=OgZTuGOmEYeXVJK2z+OJgObCgtYdnRtOFrUeMKEhVRVbmmRk+4qS30E816pP8ecyo6HAdF7qsSqqLhgjLmxzXhMw5BrwwCPH0eKosrclYhU9l42SKOInxyFD5i+zmQBvPK6wUzc/WynZkERlALae3qZ7dJ1lbvHVoQUYW53ELz27H//1ZeWujUQRlv69T39xRze99p+iVWBX7g2Fck965DQYn/UznVdzVrTHzUjF4TZ0f1CoWfUyzbpMBx9hprb0sGyOvAPtdBOEWoMxSOr1u0UTaXY8t4hqEK46QJ9pGaiiM+JdBRuknO4yJEsDK5S6y+cbj+L0G0uWaWrjx0xyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly9u3phEGi7AGrh0z85G7a8HE5mXqq1L5yQ68rPeZek=;
 b=FWa/fEr0zpaeAt6rSzNxe1cqZ6LPHETtpdBQwS4AGhboLaDAPsw6MccJUQCgeHdOK8UFA8usCN1iSJz+qOvC6t8xnP/LWB/X/fLjArSuPJdnfocZnxvCS55AHXhOD7p57J7U7bSWigx3Ut+0jLt8OysR/ab08RV5ZnnHfrIOl7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 09:33:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:33:57 +0000
Message-ID: <d16bf538-f4f8-50ec-e0e9-5a194b113db4@amd.com>
Date: Mon, 21 Aug 2023 11:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH libdrm v2] amdgpu: Use PRI?64 to format uint64_t
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
 <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
 <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
 <CAMuHMdUzqTF9hfe91QN2woV=ycUjLJ-WsODYG8_jH5ABkNk8mQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMuHMdUzqTF9hfe91QN2woV=ycUjLJ-WsODYG8_jH5ABkNk8mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd2ee22-6e3d-48f6-45e9-08dba229be78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/n5LB5iaK5J5FDAltc+AhyWjYF9g3jAMwg8HQnFeKiFtavqxLYLtwQHf7NKpTMiiv4qICAnsCXQkcejZEUfn0dlyDjb2rtq0pTQNjxSTEr9gQHNi39w09Oa6lC1w/N9ED/WR9Von2C9lIrtwMQnfEbFkNmXj6bkLYYCDPgFFhJ6J03OZ/5vM0n86wH491NALJwoJm4et6O7d9NUPoB8ucBrUvMLOl36zgpa3Wb7qeu6z4vylky9xd/pz51yMmvS5JTtQgs6qpSYDUWIg5QaIr/sP61mjwSHhdGFFwmvcjrX2N95GgB9q9/Uh9v3ZYPMGPWSuc1uEb8l2+ELQE7x66QxgZVQ+xH19Ts4b9kRKnhUujidNzNYecS/Qv+tnSw3aIwdt+ot+e48FH2GGH+HYDaYTM7yzx84xhaYIdcRW4MEvr6MiR1V4huoLUC0Jy4/kzqWHuEB+G0e+Qo/3AGrPjkXE4oHP5UJx/NHPiSrK4Yq9xrCFQcp8SwbSml7TDlrrjNUi4uCCFtW78RePCZ4K7HDcN+mYCm2QR+u6n2qREpb+Zl/3KcToikvDH/DZQboIt8MKrylfhJC1jtaWHwpaZ75GyCNcO40fbLOgc4qH0t0WKUP5CAsir+MReD8EMvXn1c0lYK5f7qA+0PmJM5fzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(66574015)(2906002)(83380400001)(53546011)(38100700002)(6506007)(6486002)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(110136005)(966005)(478600001)(6666004)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXk3bmE2VnR2eG96RUNVQkZrODl5dFRaR24wMUE0ajNlbWdWRmxkb1k0cTNv?=
 =?utf-8?B?Zy9kVktlVGJXV2psRllaRmZJZEtPTTR1ZVpoL043bWFINVdack5MTHZOS0l6?=
 =?utf-8?B?dmpsdVlwSnRnVFJhSi92VFBDU0JrTXdtSk16YklhWEdTMHBlcGFjejIzYnFR?=
 =?utf-8?B?aVIyYTBnN1ZoUzJWL0I1UUQySEM3K2tSU2ZjTlNEY1daYVhjeGtaVWxZWDhm?=
 =?utf-8?B?VWNZd0JKTVVXK3hBdEJZb25YbEtYV1NUY21ScjZWcTJDaUxyM2YyRERMcDVp?=
 =?utf-8?B?K2owVzU2cTZyM2JISzg1SHhYcmo1REZ0RTY1YTgwMU85M0p4aVZxN0hQZUpy?=
 =?utf-8?B?eTVTYlBTUWkwN2pBRjU0R2xZcXJDSGlVa1F0N2hmUHdEcGQzaktJak9ndnVa?=
 =?utf-8?B?SVgxUUxMWnZYdmk4OXZkclpzMTk1ZXZxMHp2MlBsWVNNSURseTdnMkYvTnZM?=
 =?utf-8?B?c3ZUeUR1SXBHd3pVd1psUkNMampaZVROUUgzM1o4V3lVT1VEY29jUjhUc2ps?=
 =?utf-8?B?eWZwOThxQTZITkZOQmNxQUQ3VXVjbUJodXl2M2hMOWluMVZGaDA5WC81Y3lB?=
 =?utf-8?B?TzlnNHU1SXlQamhXR2ZreHo2MDJkU29sc0RzcmRpbXRFRDk5aFZHT21lbFF5?=
 =?utf-8?B?NEJjVEpUbHBqQTI5MjlLdlplNnlBTFAvTjFiY2FBOXhRbzZFNFBEd1k1N3lJ?=
 =?utf-8?B?b0JBS2hZOTVYU0huajhPc0MwNmpaU1pvSWdORHlEZDNMRnAwYjdMMnV6dWg2?=
 =?utf-8?B?ak1EQWt5cEJ5ZUd0ZWtmNG5IbWQyWXJpQXpVY0lEUFlXQnBzcmJGK1JOTldl?=
 =?utf-8?B?dFNHWmJxWHZaRGlxdDVDVk9qbk5wVUxhU3FnZld2UWNvTjE3bGQwRlhhVnpr?=
 =?utf-8?B?d3dOcC9lbjEwZW1NN0N4cHlMc0N4MUdWZWtIS2NLcDlVczcrQlFLMmc5aXVU?=
 =?utf-8?B?dFkxU2djUko1RG5lZDJpbVlCc1hlNTZnRmJ3ZlJRc2NYZ2ZGNEM0QTJ6ZUpl?=
 =?utf-8?B?Q2NEcWN6SVh3OVM3SUpVSUhsd3BtbUgxbXh1dkZsZnc1ZUxHZTh2c1ljUGNi?=
 =?utf-8?B?L2JwejZXQTltR0tGd3FBbkNHOHYwVUxuZlY0RkdoZDhHcFkwRm9UaS90cUdL?=
 =?utf-8?B?SWlLQVZuTms1bXFIVlBIdVEvSWlZWWtxRjNRdjNROWgxODBwbHp2a2lvVHVV?=
 =?utf-8?B?Nmp3Q3hPRVl3WG9wVWFHT3dsRFpmRDNvSlArdWFnY3NHYkZZQ1dhYlNCMHow?=
 =?utf-8?B?Qmh4VnQ2VjZaTVFtNTFpZXEvOW1kK2d1Rm90U3RvWjZrdEVMbmNxYVJWeXE4?=
 =?utf-8?B?cVFpeFlPaU5BR2hMbkVtbTRBWGJwRzFYL0szTHVhenVjRzlwaXF3aGpGUHoz?=
 =?utf-8?B?MGdZUUFnVXhUSExhQjlVbkp6Q3NnRldBTjZIYmNqalY3WG9RQkdXRHFyN1Jt?=
 =?utf-8?B?TDE2SUZyT2tST3FmT0dVS1U5MVgwWlJ4OVA2MCtsU3FRTURwUGhETTFEYzRC?=
 =?utf-8?B?ZjNCaW92R25ENWREZCtsaVBxbUcvajFHY2J3U1BFdjRSY25sREZmNkVMNlNB?=
 =?utf-8?B?THZnc2VsVFdqZG9SR1J0QWFQWFh1b0lnUTdnZzRCMnBHUjkyQjI4bFdsalBQ?=
 =?utf-8?B?cTBaaDZZcVZSWFF4ZkhWdlMwekhyMjNzWGRRbDhxM25pd1pzQUNWK2JidEZm?=
 =?utf-8?B?VDhDU1hHd1kxSllFNXVwSkpLTHlUZWpXdWpTdktYR1dSTEpsamZ5YlVhM0Zr?=
 =?utf-8?B?Zng5TFJBWUxCUGNCRzlwaGI2QVgwU0hvWGFMQUx1Q3RzV0lNNGJIbGlWVFRa?=
 =?utf-8?B?WS81UDh5V0RmYzZWOGozd2J3akRWR2FKaGtQS0lIMWtoa1ZudldHOHdnbmZV?=
 =?utf-8?B?RU9xWjVEWStyQjhReHFZSnZjTXdTZkhMZDZrZWdQREFDdzVjYjBEeG5naWVy?=
 =?utf-8?B?bW4wNGZQUElqaWJWZmN4Mkc5b2EwN2VCMy9hdkt6c3A4eHJWbWhXdmlaSlFx?=
 =?utf-8?B?Qm0zSjlRc3puY1ViZ25mdXJjcVFYQWZpRnM0M2pxNHVnRTJuOGJ3bWxBenVV?=
 =?utf-8?B?M2RzeHFrc2RHbXBiK3RIZUhGajRPc3Jyd3hWKzlZMWlhaVZtb05YQTgvUFR2?=
 =?utf-8?Q?VKFGbf0KLmjQ2YKlUGqBI2pua?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd2ee22-6e3d-48f6-45e9-08dba229be78
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:33:57.7308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gK8FimJK0DhOVAbVTUrWMqwOCmZThwbQoiFVJIwnJ2kv7ZwTjN4pkMJkfxzPE/8O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.08.23 um 11:14 schrieb Geert Uytterhoeven:
> Hi Christian,
>
> On Fri, Jul 7, 2023 at 9:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Fri, Jul 7, 2023 at 2:06 PM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 06.07.23 um 10:36 schrieb Geert Uytterhoeven:
>>>> On 32-bit:
>>>>
>>>>       ../tests/amdgpu/amdgpu_stress.c: In function ‘alloc_bo’:
>>>>       ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>>>>         fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
>>>>                                                      ~~^
>>>>                                                      %llx
>>>>          num_buffers++, addr, domain, size);
>>>>                         ~~~~
>> [...]
>>
>>>> Fix this by using the proper "PRI?64" format specifiers.
>>>>
>>>> Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Well generally good patch, but libdrm changes are now reviewed by merge
>>> request and not on the mailing list any more.
>> I heard such a rumor, too ;-)
>>
>> Unfortunately one year later, that process is still not documented in
>> https://gitlab.freedesktop.org/mesa/drm/-/blob/main/CONTRIBUTING.rst
>> which still instructs me (a casual drive-by developer) to just submit
>> my patches to the mailing list...
> So a few weeks ago I created gitlab PRs for all my pending libdrm
> patch series, and I rebased them regularly when needed.
> What needs to be done to get them merged?

You need to ping the userspace maintainers for this. Like Marek, 
Pierre-Eric etc..

Regards,
Christian.

>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                          Geert
>

