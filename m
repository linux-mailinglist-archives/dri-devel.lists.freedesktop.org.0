Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD84F19E9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 21:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4A89FE3;
	Mon,  4 Apr 2022 19:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9271F10E56B;
 Mon,  4 Apr 2022 19:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXAmY/OQ2mF9qgB79rj0w0b0q/exZWqWQ9bTqzcU/6QsJPLjvT0GsLW8N97lbW5KSoKxYyk0fiXcEW+Z4nYbnqkgnrqoByrOrUdeqB+75kMKyhjZJYCfGDVFh9c0DyoijrorF5ZNVuJVTZS5gTuDOHovLdWov/iwngtoF/GPq06fDwE/MY3aLIrd4Doa1JxsVqVHTc2BCELAn+VnzqAu9kM5Rhpqfpcc3wqhO6eX63pBlP1IXcb9RpwDZs725CIzQwf81piWLgPl0yR2PC0SEeeToxLIAyBzJgMSBG7G39i4HJ0ty06YUNoCBGszNMwD1v1S9blde1w38juZqEUctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn7VlZrjdkud1pCEohwgWw0QGWBi4FNZ+vh62sWU2uA=;
 b=OPb6DxbK8VNrnaaXSkHMBU1AEd6BdDXY+ccZBByGpbByXUzy+mBjbqpDDWY96brBNzjSBmYSGBWf1DoQaYzbKY1gKWSyVeZaZLMZMRU67ZCuMsX/OCiax4sjU7yFjzCQs4V3+Jwv6gBVfGLXafRCrQfeBTlN2P7NQXOX4jjvvxTgAU3GXjJ5EgyOurNzJH+KKYXifHB+PB9ykodxuJAwwUHO+vDofaNOveww/NyBGSJAP7XlLKp5nwNZfGnI44zuS6Hv8ZfgLo3edPoErOQCRMTcZG4M/teXVzqTEcrt12eIv20ve5/KCs2zJgBFg8GpIgICKwEklglfr0a9NwxaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn7VlZrjdkud1pCEohwgWw0QGWBi4FNZ+vh62sWU2uA=;
 b=wfIDhWZlhQKwRt0B2DlpO4mrKwbQEKkVqPSgCY6ZzNFySpyyFhJSS5X+O5Qpl2EwoSos6d5/uJ0gMWnNl2gyviPlfVlwDOfC3omNam88ViRIQlLlmPfdZoRLgyWipOvl++QNMa2JBZ3X2v0uwax2zihHioB1GSTTOHQCL+QkssU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 19:22:49 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::8079:93c0:f340:7a1f]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::8079:93c0:f340:7a1f%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 19:22:49 +0000
Message-ID: <5030bcfd-3931-d8e8-4eaa-7a3127cbd6ad@amd.com>
Date: Mon, 4 Apr 2022 14:22:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] mm: add vm_normal_lru_pages for LRU handled pages
 only
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Felix Kuehling <felix.kuehling@amd.com>
References: <20220330212537.12186-1-alex.sierra@amd.com>
 <20220330212537.12186-2-alex.sierra@amd.com> <20220331085341.GA22102@lst.de>
 <82ed845d-2534-490c-f9b9-a875e0283cc9@amd.com>
 <20220404173858.GQ2120790@nvidia.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <20220404173858.GQ2120790@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:208:329::27) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2332971d-c0fd-4068-1e1f-08da1670817e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2419772F29B5E0922145FB66FDE59@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hR88Q/xE8D9V1XrWcJJ26VG6tegdD8+AJXLBkjlzNw2lkMoDifGCY+bJakjKsaN07QCl3f6xIKb7YAa2zMNvYY76aqCFnnxdg5aU9QPwhyyRThIqjXYnWULTkw65HjydptVhHKLquEDTvxYLb6ptDQsaGV1DY4JQqonSVW8OkyrqQ7711A9z6GEmu1Zg4A8J5RgeXGLOpGQQJ0dX24GTtfqr2/OWa8uiQHf2ol7ZwCghKW7ixKBWVV2/8BAsojOORtbHvtYH/fevXydnDjK6KQHCTbBkXeAR/VoMNQWWDE69Eh0pNebhCAc+DaJ/xnQuMqXa1gQbGHtG6WIlt7oiUf4znyf0gzdhHbFsbWjswg71OCK+e2dlTTsJv9tE5lKIE1OYvOV+Waru6VUfu7FEQv0o7rC1TUIEworpr3PbI60OiQcv+pJG0J+kj1FryV0JPZfrzkMWygNcRpGAnvDPf8RMeHCje7Xhd5fBzXZl4BJGFlz1QwjZmdxSbZkWhR7sGy6nOTPUbO5ke7DaSeGBuCV7UBoR0fOHeU+u3Oj6r3Bl7FOcyHyjgpdh90uJyIF4sG3otePLIbH8QSqlDpy9cthLa6w5WOvpYlLeZ/xQxDRNcwLgop4jFz7I9JVBJRObSvywhe7O85Cbo+etsTb61HcQ4RTE348kP1zUAqp9PfE4ymL5h4MXD235Sfg6HYwnA0Ea8bjnrIeqdoytvL9ph71zgievCCFAkjRmHbuRnCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(38100700002)(7416002)(8936002)(508600001)(4744005)(53546011)(6486002)(6666004)(36756003)(6636002)(6512007)(6506007)(5660300002)(316002)(2906002)(110136005)(66556008)(31696002)(83380400001)(8676002)(86362001)(66476007)(26005)(4326008)(2616005)(66946007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBxOERFVVBnZjcrU0ZBeldBc3Rjb3lHTkEzUkplV2d2QmhGVzEzNm4xZ3F6?=
 =?utf-8?B?WStCc1FueG0reU5Wa1p0akNIUlF1RTJCUFgzNEhjNk1HeEVvcmtncE5TUE9E?=
 =?utf-8?B?QkJQQi85cHMra21adUlpd1U4S2pNemxiM2ZOcVUvVmpSOFFRRFlzcXIrY2I4?=
 =?utf-8?B?RWhZa3FLR1JFM0YwT1ZuREY0aWJHQjYwSWRBTENCeXNBNVU1UmJ5WDlTUnpi?=
 =?utf-8?B?V2ViNzNXc2F4MWM4dWRUN1JyQ1M0bGlOT2tpZlgvakFWdmFUZ1RmNWVOWWxS?=
 =?utf-8?B?bXA2RHBkMWc1T3F1RFF1M08xUk01T1I2MG01NS9RUkVnOC8xWVo3dGhIUSt0?=
 =?utf-8?B?Zm9rNUoyMTIwWHFueXh4REI2aFdhRXdBU0I3NjBwMjFFbW1TQi9EK3JCUVM0?=
 =?utf-8?B?dHEyakJwRDQ3NzVhT1VYWXEwVVV2a0dDV3RHR21IMnNzelI2YzcxNlNFNVBr?=
 =?utf-8?B?Z2g1S0w3OG4yMWtFeEdoSnJKN0h0OWwrbXA5Q2RWRlpSVEpRczNpR1NuL0Uv?=
 =?utf-8?B?aWsyRGIwaGJpVE4xV1c5WDQ4VWtUMHhOenAyeUFjWGRaelRxVFRSZmNIYlBR?=
 =?utf-8?B?QTFDSnozb0dJbWs4ZU5GUE85eU0zNUJsUGVVczVRSDg3UnYwN1V2MENScVEz?=
 =?utf-8?B?L3VXN1dZeFREV0pqNHNkZ3BReWlrZHN2dy9DYzJwckFIb2ZMRGNkM2MzeTBy?=
 =?utf-8?B?cEVlVWJSZmhvbGtEYzBRd3JIdWNLT0xtek5rMlh0WDFOenNmTnJEVytNUWRF?=
 =?utf-8?B?bmFGeGhUMWZzVTJ3bW9KU0RwTGZVRE5acU8zQ29qbWRrOWRRY0RobVlBa3ox?=
 =?utf-8?B?SkN5QXI1aWZaUUpnT2JjLzFNdFdzWk9rc2k3K0hvcmFBVEM5SkhRTXhhcHNI?=
 =?utf-8?B?MVFSaWN3VnV3MTF4aVlZQU8rckdwOU84WWZycmdnZ2lBNGo3ZGtSQVdKcnBC?=
 =?utf-8?B?QnYzQUVUNDQ2bUJFNVVGVzNXSXJld0xVU1VGdHIyY1d5UWIvWDF3QnVPWFlJ?=
 =?utf-8?B?N3p4Zk1LSHZncmtwSjBmWWk2Z0JIV3VSOFFnQm5yQWQ4UUd0SEZPZjE0MjVT?=
 =?utf-8?B?dlFCeU1vMWxxbm1SRC9vWThsQnpOYXJDRWJwT2FYeFpHV1ExUUtrZi9GK0RW?=
 =?utf-8?B?c2FmdHZwRVJnY3JsOVhUZEtNTUgvWTR0dmQ3VkpBQUhkVEp1SnJjNGVXVGpK?=
 =?utf-8?B?dlZ1a0x4cUdmNjJpZ1NHejBwdFI5TFpteFpjckw5UHlEWm44WWF0ZzFkaWF2?=
 =?utf-8?B?TjQ1L3B6cHJNaGgzekJoUjgvaXRmVFJudVZnQWoyMSt3bHMvMU95ZDVJVkFH?=
 =?utf-8?B?OU1aMkJIVHhKcFVGeGI4QmNYNzlxSW96cEJpa3JlbzNpRy9VcEhJQWRkTys0?=
 =?utf-8?B?dDFBOEovRUNUWloxQnkzWHJrVituL0J6Y1pWaytyOFNOVkJyVWhhdkNpZ2w2?=
 =?utf-8?B?cWVqVFo0cStZQXpDVzVHL0duNTdXVGVYVjVyNXNOSXBlbVdkbUdlN2hxTkdP?=
 =?utf-8?B?YjQ3UGU4V2tqeEQrUmE3a08xUzlRNG1QQ0YzUnl2QWJZdDJpeFFUSlUyNmI2?=
 =?utf-8?B?NkQ2OVF3cGtiaGRaMHEvNUd1dXk1czhlQytuSTBKWVQ4RC9EM3oxQWhIc21k?=
 =?utf-8?B?dlRNNm8ycWNHZ2ptM0hCMVJKTk10VzB4QS9pdmVNNTlKZUtVcXZ3MXltaCsy?=
 =?utf-8?B?eS9LcW9FRVFtRGNTUUNONHAxUFpzQWVGa0JFSklYN0tMcU0rbWtYems4a21K?=
 =?utf-8?B?eEY4V3hianF3WkZHMzJDYXNiNzY2M2lhZ1VDcmZiZ29JRFVoYWllRWFxQi84?=
 =?utf-8?B?V2U2UVBBRnk5MTVMaXpGZU5NOE5TRTZwWk15UmNXYmJ4dmgrSWM0L1FrdG4w?=
 =?utf-8?B?NU1LYkQ0UHNHKzQwblFTZHNFMzJNTHpEdXVRdllkaGgzU0ZKYjEwcldpdFpj?=
 =?utf-8?B?d0ZaeExWak9yQ1VMUEM4OGJHbHF1TmRCbm13MGhhMmRES0RLcWJUUTd3aHFj?=
 =?utf-8?B?YU5XaU1EK2dKV2x0cWpZamtlNk85S1ltQ1Q0VHRSUFR4YmJ1cnkvaVV4Wk04?=
 =?utf-8?B?Mk9sSm1KTnJYOVNqQnMySlkzOXhqTlBOYnExbjVmMDZZU0lNc3RSRnZ2VURJ?=
 =?utf-8?B?WStNY2lqSWZ5bVhVRk42UUVEY0NOUUF2amhSRHB1V3pYbFJyUFFVa1JNbzZs?=
 =?utf-8?B?NEpHYzRqNFFvMy8xYk84MTUwUDBVUEphcENFcmkrbVlVd0J5aERnR2tuZ3pt?=
 =?utf-8?B?U1RNNGljVWhWdnBmK3hGMkpNOHZjaWFmU1FxWWd1Tm9sUHJrVVRWY25GdzZz?=
 =?utf-8?B?VmlkSVVJSTVNeFkzOXMxWTU4SUNNL2xGY1NBbUxsZ0hoOW45M0hrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2332971d-c0fd-4068-1e1f-08da1670817e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 19:22:49.3051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKOj6L+XfX41j04OzU1tEMZ5guPy2eqa6gWI34D0I4RvQ33d9RqJEWrlyefyHt1CTysziwafahOB3pXGiJmpaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/4/2022 12:38 PM, Jason Gunthorpe wrote:
> On Fri, Apr 01, 2022 at 04:08:35PM -0400, Felix Kuehling wrote:
>
>>> In general I find the vm_normal_lru_page vs vm_normal_page
>>> API highly confusing.  An explicit check for zone device pages
>>> in the dozen or so spots that care has a much better documentation
>>> value, especially if accompanied by comments where it isn't entirely
>>> obvious.
>> OK. We can do that. It would solve the function naming problem, and we'd
>> have more visibility of device page handling in more places in the kernel,
>> which has educational value.
> Personally I find the 'is page XYZ' pretty confusing, like I don't
> know half of what the PageKsm annotations are for..
>
> Testing against a specific property the code goes on to use right away
> seems more descriptive to me.

Hi Jason,

Are you referring to test for properties such as is_lru_page, 
is_numa_page, is_lockable_page, etc?
Otherwise, could you provide an example?

Regards,
Alex Sierra

>
> Jason
