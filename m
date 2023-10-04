Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45107B7F8D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8856B10E0B7;
	Wed,  4 Oct 2023 12:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DEA10E0B7;
 Wed,  4 Oct 2023 12:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwpmCmorqp0RuAxU11N4paOViDXmKXfdUozL6K1jeEuvsnpi0t0LCtWUQk1oi5lAHplLCCFuOSLGtPFjKV1yr75OjfCUFZnZHPVUHNbmCspHNosr2aaT9o/ZTReX46IQhsyV4LciyjNYn4vIkTG6NqfN43yKWgPy7qX/G6d52+KlNr2k49TFNQRY1/g5ZNjZrxk1Av1Lsbb+t30rK0Kxtr2dgGotMDpoOXyUvUhYnZyrQiO5UzCieVbp6md+dKv5BtDJJX6sfUDFVjj711vmaQ6Btp6yZgZXPU6+wb/hmkkoX7zY+lLm3ugewb9UbGXEdm7eTPLIb0CjFHOzolgx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRLDTt6bBgXpSoNCYfpreiauuzLWu8h68u2pBvyuArk=;
 b=Hk+owXf2OVFcIifXDeVIi9EA7fyfiyjCELdpBQbeAry1ti3K0VRfGrYJvNJ+lo+XkapM2sp51SDY/P8LX8AANhp37GH7n7XQQVgAk5eurNjOot/bTH8X6Ee9TXBd5oqI9QBOnsP6QAwg1D4JfN1HTYMcBlHWiygnzicX28ex9fUffIDmP5a9SW7hR59slMwJ5zitLlmjdHhZNaYD00fTXa+BppPFL/Oite4N6KXBgFD36EQlPI0iPsvzSapfIMxQcV9PJ9ODPTafkpWtDUVLGPQfdCy0GAOitYJeQxtT2cHf2G4AY/nKQsnH+s+V9cdPREqrtrUbJxiqfsndGGWIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRLDTt6bBgXpSoNCYfpreiauuzLWu8h68u2pBvyuArk=;
 b=TVCwOuR4fTIiNAa3NwM8CsvgiztDVjNBeVbF0D5zsM+ajQHjxRPzQXLHYrzRcbiWRL01h50JEse77aWLeGhyDUObkh0nLxRQ3/M7zVSjLKZSJvZnVCoyUWvKR3CQKd/MAdWfu7Kj1p6GDNhMM/7Auxe6zuaJB/4DLNLxtfL+JgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 12:45:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.027; Wed, 4 Oct 2023
 12:45:02 +0000
Message-ID: <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
Date: Wed, 4 Oct 2023 14:44:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: bulk_move in ttm_resource manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>
References: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 3909e369-ce31-4054-becd-08dbc4d7ba2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DymADZ1+uuM3fbSOoqpCMgCRtYPjwuLya/m9hO9VNA577Jsw8OKqeFBKmUTxSDNPKtT79o6OJkGQcQc1AdlwAsUcyy+kpPxwc1Q0qmELgetHZW+a2cGHP07qBQiu71VzsHXQHM2YC+2rw3FGXp6vLMzJf0in2fFIkiU9O1Q+7vDKmsO8B8QjONDUpFe9wSfby1y+Dsg5FhMhsIFj+F3qWFyQ0M+1m02y5IqrNJI5FZh9PSlGPSteUajbFa6fyGK713gzDYba3PMcMQsg/HfkIN/gM5UWO6JX+bjpi1uzglvpyIPApPFM3HmHedGmRRzMveHp+6y5323/EdeVBXV+hPJqkOwPf4PpMvVNqbjFk72Klqu4GTuRkaf16jaku9VC1Xi3s4cBN8czojevqrOv25JYUjkrl3iTB5lSY0QDennqLzrRKnBC7LA4WA0PInn9QqfAP6ovFtzbr7z5ThYgo3T2HXk1T008SfsI7/ddMoy0lHtI5ajjLs+nfIc/pElQxFgA/slkg4Xo0kvHMS2RSJAQxGGPYHiSf99My3zisnbYmqs/r5W8/4yIZ53E52Zqn4jr7NaPAFGzdCx/hZ5TFlgAgWGliGq87ttnMO4duyjV4txWmUVBYm7w7Yt7gZFIzP+hpO6Z4d+pz/i1utVmCXS2jngVKiOk0vRBVlRDi5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(5660300002)(31686004)(4326008)(8936002)(316002)(8676002)(41300700001)(2616005)(54906003)(66946007)(110136005)(26005)(66476007)(66556008)(83380400001)(966005)(6486002)(478600001)(6666004)(6506007)(36756003)(66574015)(6512007)(86362001)(38100700002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2ZLMlZXWXEyNDQwZ0RXUm5EOVV6S281ZkxLYWFYTkpYNmdHZ2R4bFMxZngr?=
 =?utf-8?B?d3pGY1lYdmRZWi9NZjVNaDg2eThTMitNeTRHdG0ydHNwdlE0QzF1UFFsd3Nt?=
 =?utf-8?B?djhhcGoxODVFYUIxUU1zVHdrNi9KYlBDU2w1N3U3Ylh1V1lubzJLS0Z2TlVW?=
 =?utf-8?B?K3Rwam9XRmpJKzgwdUdSaW0zWHVXUWRmdHdzSVFpcnowV1JPV0FpTVhSQi8v?=
 =?utf-8?B?eDRRbUNJS1B5N2Zlc1FUandYbTFGZFNtaHpERWluRGVJbHBtVkVuYWJLYWNB?=
 =?utf-8?B?R3EvS1BRaGV0eTQxc1RFUjljVXN5Q1dRVFBGUG5WbnNkd25Td3Jpby9nR1NU?=
 =?utf-8?B?TnVZalRKeFJLYlFhTE9NSk1IY0l6MHFXdnlHVDFKQ2gzN0dVZGZBcVk5SGlH?=
 =?utf-8?B?VG9xTDZvdTdUTlphTnBBSHlkRUVIbDRUZzgwS2pVY2NPVnRPaGtqaXFTdTJq?=
 =?utf-8?B?a3M1VVptcFo3aThab0tTTVhHNVNhR0NIUjlSVlU1U2ZraHdDWTdSbFZWSDFO?=
 =?utf-8?B?YlpqZXFyeXVncTk3OUJGRTZHUkpOVUxES08weXNmUGIvNXUzMHBFMWZ5RnY2?=
 =?utf-8?B?WThodEhFRUR1NnZ2TTcwSk1NMjhzR3NwcmRJaDE3WVY4TThHc1ExdUhvZ0d1?=
 =?utf-8?B?ZVhwQkU4YzF1ckFCcHJWNE0vVWxvOFJYd1RqcUFidVhORGp4YWcxaWpNWklq?=
 =?utf-8?B?dnVoL0tlZnU5NDRnNnhJU2dxNVJDQzJ5eC84NUg4ekpHYmh6TkVhNUh1eTcr?=
 =?utf-8?B?bHJiQVZSR1drYjFOTjRDeXRWTUdqbS8vZjRSVzdKODhwY3JHcVhTQkhweWI3?=
 =?utf-8?B?bGM2K3lRZVgvazFmekIyejRwMi84VGsrMVRIUVVhelZUUTU2dGRJdjIrRk9T?=
 =?utf-8?B?NVUvY0hnVi91d0JKY3pwRWdYMEpMQ0R3Y0xqa29Dems3YXArajNONklkUnZR?=
 =?utf-8?B?S3Q1S0wwYnNDWmdXSUtUdytWbnZCSlREckR1NHJ4anVEb3NpbjBhcWpmUzFs?=
 =?utf-8?B?VHFUWEFiUzE4NGxIMm5QLzBSS0hmc2FmcVpFRDltRGpmeE1YU1hKcGxsU0Fp?=
 =?utf-8?B?WWlMTEJrOGk5MjFTL3lWcWZpTXR6RVJCM2QrWGsyUVpaY0tMNkVER3A5MUs2?=
 =?utf-8?B?c3NDRzJMM2Jkd0Q0MEt3b1VvMUxlZ1ptS1dkbW9UN3Z2Z2wyUHQzTFFHeTRS?=
 =?utf-8?B?R1pVM1podVVhenhpSlY5SStmM0lwZisxdEk3ZG9sOExzQk9ScXlzS3FCMU1x?=
 =?utf-8?B?MHlmb0YyLzA0MjA0N2hadkVzZk0raDZ6SWRRL0RMUVovc0JBWU04UFA2ejZD?=
 =?utf-8?B?Q1pwT1VMTzk5dlVYZlVRbzhkSjhjYU1DKzg5MENaaG05UWl4bXJRUm8zVUhN?=
 =?utf-8?B?R0R2bTlPM0RzUFdFd3huU21GS3JPaDNLaCtPUVJIbWZDdFVHNEx5NElENHY0?=
 =?utf-8?B?bExSMDI0NmFER2VHSmdrdjh0SEIzSXQxRHBPbkdCb2ZFc0NmSUNKMiszelFB?=
 =?utf-8?B?OU5YdlFkTmozemQyOTllWWtHLytTdkt1RGdmcXN5UkZZMjhoQzU0a0x3ZGZi?=
 =?utf-8?B?WVp2YXZQRnFONkI5Wlg1aDU1dFVVNVdHWkllMjB3WDRnMjhOSElnRDZmZW40?=
 =?utf-8?B?WkxzeWxaZSt3RjdFTVRzWVpobUtDb3FQNm5wTkNmY1JMenhRVHVPLzhueVlh?=
 =?utf-8?B?TlNCb1E4L2RpdjRlbURvbGhua3lKczlJd3Bmd0xEdXVuRDNFWktHek1ZTW0r?=
 =?utf-8?B?NzVEYmFSOWlNQk9ld2plTm9OUzYycGJHTThLV2d3S0RmdWdoTU5ramdhek1t?=
 =?utf-8?B?Sms5MExveitCV0hZc1IxTTl6eGZwamY2QUE5MUY0QnZOZXlFZlNCWHpFcFJW?=
 =?utf-8?B?WkFLRUNJZ2RXUTc4NmtBZ01haEZjOXczcnVVbWlHM3VLdUJ5REcwUGRNVWox?=
 =?utf-8?B?Q05ERFVSWmRRM1JoWkt2Vi95YzNqcHhCQi9Sc0tUckJBbXpHN1VPdUxwellW?=
 =?utf-8?B?d3JvNW04ejdGUk01ZmVrelUrQ01lbTR0bWJUMDl3OUhocHRLSlc3NVBBUXdC?=
 =?utf-8?B?VldPYlhiK1ZsV3lWRTNjaXhSMW9mKzRWMGJBdUtaSk00eHlIT09zNGUyU2pD?=
 =?utf-8?Q?X2i0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3909e369-ce31-4054-becd-08dbc4d7ba2c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:45:02.4968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Pd4UxSX5odB5bsXPw1Ia8zv+NMXgz3AxH4bbEseWeWVwBPAc33YDKF5uUpDV0R6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.10.23 um 09:17 schrieb Thomas Hellström:
> On Wed, 2023-10-04 at 03:52 +0000, Zeng, Oak wrote:
>> Hi Christian,
>>   
>> As a follow up to this thread:
>> https://www.spinics.net/lists/dri-devel/msg410740.html, I started the
>> work of moving the lru out of ttm_resource_manager and make it a
>> common library for both ttm and svm. While look into the details of
>> the bulk_move in ttm resource manager, I found a potential problem:
>>   
>> For simplicity, let’s say we only have one memory type and one
>> priority, so ttm resource manager only maintains one global lru list.
>> Let’s say this list has 10 nodes, node1 to node10.
>>   
>> But the lru_bulk_move is per vm. Let’s say vm1 has a bulk_move
>> covering node range [node4, node7] and vm2 has a bulk_move covering
>> node range [node6, node9]. Notice those two range has an overlap.
>> Since two vm can simultaneously add nodes to lru, I think this
>> scenario can happen.

That can't happen. See what ttm_resource_move_to_lru_tail() does when 
the BO has a bulk move associated with it.

>>   
>> Now if we perform a bulk move for vm1, moving [node4, node7] to the
>> tail of the lru list. The lru after this bulk move will be: node1,
>> node2, node3,node8,node9, node10, node4, node5, node6, node7. Now
>> notice that for vm2’s bulk_move, the first pointer  (pointing to
>> node6) is actually after the last pointer (pointing to node9), which
>> doesn’t make sense.
>>   
>> Is this a real problem? As I understand it, with this issue, we only
>> mess up the lru list order, but there won’t be any functional
>> problem. If it is a real problem, should we make the bulk_move global
>> instead of per vm based?
>>   
>> Thanks,
>> Oak
>>   
> FWIW I have a patch set that converts the TTM bulk move code to using
> sublists; a list item is either a resource or a sublist, and when
> performing a bulk move essentially the sublist is moved. Bumping
> resource LRU within a VM would touch only the sublist.

That sounds like my very first attempt at bulk moves which we abandoned 
for various reasons.

That's easily >5years ago, but the history of that should still be on 
the mailing list if I'm not completely mistaken.

Regards,
Christian.

>
> Currently functionality and TTM API is essentially the same but when
> experimenting with LRU traversal for exhaustive WW-locking eviction
> this concept was easier to use. Also hopefully this would reduce
> fragility and improve understanding since a scenario like the above
> could really never happen...
>
> Let me know if I should send it out as an RFC.
>
> Code is here:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/351/commits
>
> /Thomas
>
>
>
>
>

