Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5C439DA5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8657589C17;
	Mon, 25 Oct 2021 17:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3C789BF0;
 Mon, 25 Oct 2021 17:32:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216880961"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216880961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 10:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="571741219"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2021 10:32:35 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 10:32:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 10:32:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 25 Oct 2021 10:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIVNm/w9KyjXlk5KFNPlNcYX29f3/FgsZE2NGPWiokzBpgN25sVaxI9k9f2iWjzkWeZG0C8tflOGE0xV1DZJhMZEpXSsqZp87SAiahfE4QGJDEiWHIQGuQsLud6QlQlNyTaYwpReDyAal1UUigeKLUDilxEYbIjzNCJSeJ1w8S2GTKhwYo81npfInoxTz4g0mOCoso1eND7qHP4ZDT2UGApHsXy8nqQVV0TRUEOqE84sS+rdmDUR9AqRWuf1gYgm1cKnhw/PQ9c5MSql9Ky1Aqs7UcwPNOjMz6vLV3X5iCULS/iXmgJS+0z0ihKPeHt7igrC1sczJHIWWI19wcc7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wBmDLt4dAAhb3PJ2/NPrVncKvdfu2b4bWjDFDdvdyQ=;
 b=NUAbqPMCyDYPpIrg54eOMiXdeSRtJxYy2l/x8er+XkNjyqkS1zsUUTRlmyMPsMvo/fLR8FJwAxRwZ66TqySz64W9iAjYCDfWmUghzSAHmqfarVyaTwL4ZhfJjvkJAoRdsU6tvEoYy7jj/m4cVz+VCvy0LkgHN5BufjQ9NqVJT53WNrqMYh8kfJLIzYD6KIHbXONe+moOEJveALinActya2TBE7l+wjsjLU41UD7t76F/VJXhn1gvK7y2rh+xhELqAXqZmh2UaZ7FadRTTEfNA9JvF1dvb4V+ymvPiqX9nAnvM06TP2v0a0wzgnlowzWijDZLse3rcjsU00fN8Y2+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wBmDLt4dAAhb3PJ2/NPrVncKvdfu2b4bWjDFDdvdyQ=;
 b=et+BuMR0ydOxANUM/hWTfAMaDh5R3vqwag6hkQOccvawxQea0P2OfT7fJaVQVS2d1Uue1xHtvvY1qgtxM56py0HgNRRyvh3LnxSt6eYwLNel+3g7Or50pRTfrhj7uBNCqWXTTo8N5mQPNiJYFe2z5f5oatki9/yWlK8jAe1uCDk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5625.namprd11.prod.outlook.com (2603:10b6:510:ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 17:32:32 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Mon, 25 Oct 2021
 17:32:32 +0000
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <20211022170356.GA23182@jons-linux-dev-box>
 <070ab480-6306-653c-514a-6648ac495253@intel.com>
 <42cb2c7c-ce69-1cae-6e0c-a1f2b3cd5a67@linux.intel.com>
 <20211023181838.GA35211@jons-linux-dev-box>
 <933e9a65-6a17-eba9-0645-8d9ad07be51a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <608fee7f-f0ee-b8c8-6914-dd2e087b9824@intel.com>
Date: Mon, 25 Oct 2021 10:32:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <933e9a65-6a17-eba9-0645-8d9ad07be51a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR12CA0037.namprd12.prod.outlook.com
 (2603:10b6:301:2::23) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR12CA0037.namprd12.prod.outlook.com (2603:10b6:301:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Mon, 25 Oct 2021 17:32:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0894ada6-838a-4c51-4ae8-08d997dd6d41
X-MS-TrafficTypeDiagnostic: PH0PR11MB5625:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56257FC05F63CCFAEFB8AF2CBD839@PH0PR11MB5625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAniXIu/f9ig2sQgwy5JGhBTszPcXk3nvP/I3Dw9K40ujSMqwIh5auQ/e+N+kNtJxxkKa45BG37I/KQpbap5q4T2gGhC/zPYtt4B3fBZW8JXR04dXcXmPgsTy+VeC7VrsSadEdyPXaluW9R9LnjOgfsBYQJoeTo7Nb5Fgf1H3Kre1xbaebCPxN8FdhEyIjdRYz1JuDUz0EPcL9KBZwJeRW3RYdiFE2/5sxVnMZRdo7p8j9FvXjWZGWq6pBIOam8/YsVe/dap6Jhdv+nHe4jvmJPtuX49bXT/jCOaodeVmhHS59oyVKcWpDhSX0qGmOyPHjUJoaWoDCSfzEkf8FzJBYZw77jsuY/nDtBQ4NEoPkUuwAhbwcmcxsujgVvAzYwzsmxBYey6qx2H9I33jZEu1b9kXlKB1sHv3sjErHzjudKlG8rLhsW/mOfAFCRPnGGnNJchw52Kxi9Xi7hiOVePR5bsJiQv41iFMIgTS3Yq4Y9PsN9TXtcKpU+ZBUi1QhIxWJMbiNZNc0ZrFPYaC7XRKJ8+kl2PeAEIUD9mpl73lWa9IFOGc0SYX5He8ffn2luE3f9laCsCqSpAUCpgel5elC0yVJHn3YJQWRP5oPZ/UDyCAhmsFsPg7D+voUkx2sltXRoDgyq7+s44vBXOza+7wGu9KNy4+Mt/A1Q4KnUlc1gloSXyd0zVn2Rgmqt9a7Ab7shMWmo56lhQALFPXJMsYQIDVAs7RFbDVymNplCjeaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(316002)(6636002)(16576012)(110136005)(86362001)(4326008)(6666004)(8936002)(66476007)(31686004)(83380400001)(6486002)(36756003)(66556008)(5660300002)(2906002)(82960400001)(186003)(66574015)(8676002)(53546011)(66946007)(38100700002)(508600001)(31696002)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WktHNFNhdEFjbzIrNWZLcm1vR1lwNHZNWk5Ka05LT2pZd2h2bjRXWlhFWWxI?=
 =?utf-8?B?UkttZDhHMm82T21sM3hQbUZGNmhIQ0dMZ0ZpSmdlQW00SDJEMDA3K3JMWDFu?=
 =?utf-8?B?bTdreHg2dFhjc3UvT2laWUJZUHRORDB1ejJYd3JiQ1VOTzlOaDhLSEo1aUhM?=
 =?utf-8?B?YmNZTGRwS2lZcjQ2ejYvaG55clpGcnF2N0dRcnFYSVZZQUF2Z3grM1EzZ2FC?=
 =?utf-8?B?KzgyanFlb0xhTnNQYzJkNU0vbGJkdUlnVU9SUFh1eXYwMEFQbmw4bnU4Mjhr?=
 =?utf-8?B?WDBySE1oSWwyTDFlK2NIK3cxUHdHb1RyT2RNd1ptZHNBR0R5bml4ZEJab0N3?=
 =?utf-8?B?VXp6VXVmcnFoMUw0UEdxbG84SXdsL0gvZUxrSld3VW9nejFNTlE2ZFR2VVdj?=
 =?utf-8?B?M3o1ZFRrWEY1VlZIdjA0eThYVUdWaTlWSWcrS3lMMEpmMzN2dFNUWTlLcFZm?=
 =?utf-8?B?TmNHNW1VOTNOUFNDcTQzeVFkeHprRzhDRXZaSWw3T1ZCZml3NFVFbXA1cEVM?=
 =?utf-8?B?OFRhRDdRTjJSZytnQ0syeEJUS2laMS9QVXJNSDE5MWFJdm1MU0hrZWlFRkZn?=
 =?utf-8?B?UGFOZWdlRGRUdlNHdDZLTGJuUG5MMTMzM1JUQ1Fwb3hycFZia28wMnFpdzV5?=
 =?utf-8?B?ZWJ6bXc1TEwraU15S0VSbU50TjNUSnVPQlQvSUJwSGh3OHhHR2Q2bjFiYm8x?=
 =?utf-8?B?ekZHaDZ1d2QxNDNLNlpIN1JCUkZ0Sjl3cGtleGdlelJvcWtOWE1GemJEaGVn?=
 =?utf-8?B?VnB2ZVF4emM5MHk3TEZvTEdnQkNwUjBZY3prTjVndXBxMzJmRFpVcWRINnpO?=
 =?utf-8?B?SlpsR2Q5OGhXK0pkSG84YXBxZjdNYlZyazRwY2xZT3NuNEZLYVB1K3lBWnFo?=
 =?utf-8?B?NmJJQlZ5OHhwVWlOSFBYL3Z3ek9tN1ZKeVI2ZlQ5VStHZWd5UEduZFFxeks0?=
 =?utf-8?B?cEZaREhjY2w3eHhJVStYbmtZQlc2M1cxR1haOHE0bjJ0Rko3T282VURYbUlY?=
 =?utf-8?B?YmJaZ2tHOHZqcUFXUkMvaVhGYzRjcENaWkVTRXRkZWNwME52cWFXSlF3NWR0?=
 =?utf-8?B?K1huNUpwV1F2d3VBWnc1R3U4SVdoMUEwV3VOOGdoRWpBQWltN1QyQ3BuRW9w?=
 =?utf-8?B?UmJRZWJDd04xZlNYZ1dqR05OYU9CbkdGZDNUK053VzJUeDNzY282ZE9iODBC?=
 =?utf-8?B?QTVSdXgvUk1oYmMwTzd5L21kN0VGVWF5ZUdIQlRrN1pyV0d1eG92UStuUzRL?=
 =?utf-8?B?ckp1YUJ5WlFNb2pmeFNiNWI1QmtDNFBGNTA1KzRRRk16dC9DNWg3M1FOQmVl?=
 =?utf-8?B?SEszalhieUxWNVlrRU85RzFTZWRWNFdnVGJTVlZ2MGlFTFNjRUNMK2ExMnA5?=
 =?utf-8?B?OGYrM25GekJwa2duYTdjbWFrY2RYUzFMSUFqQzBwZEU0Skx1aXFyZ3p5Q3ll?=
 =?utf-8?B?QTMwdlI3WEdrQWRVVy81a3ZkcjB6T2FVcER1WXhnOXozQ3BoTExUdWREZW95?=
 =?utf-8?B?T1ZMSmFEMzJJNEYyOXhWbnNaZGlLSzAwREFJalVpUklVbENWdlo0bHRtdWtO?=
 =?utf-8?B?L1FoQUJZblNwV1EyL0lsS0FrdGh6RVIxUjB3NGY0NTU5bDMzVWREc2c3amNv?=
 =?utf-8?B?cFFMbzlOQ3ZMMFYzNlU3cW1PZnpjeFdKLzQ0eVhKZ0pVQlBjN0xNSHZ2bnpZ?=
 =?utf-8?B?aHJzeUUraUFiVVRDeThLRzhTS1dBS2ViY2o1Q2dZN1JYS2FaOENlTkM0ZnY5?=
 =?utf-8?B?MkUvaFpzWms2NC85V21NMHhlaWtNVC9YZ0NVeHNweTUwbkNrcEVzL2xFZ3M1?=
 =?utf-8?B?MnhFS0p4bDdtSEJrSFpkUlNyU0s1SlNHQ0ZEK2JCYnEyTG9iajF2MDlNZ0Jk?=
 =?utf-8?B?aDAyYmZkclBmVGtiZWJxd2FuMUJWQWdYdWN5OG5zKzZvUHdPTmUwRmRGZUVT?=
 =?utf-8?B?bFl6ZFBBbmVaK1dzeXlrVlZJenUzTXozNVlkNmRwUEpsd0FBakRQNHZ1cUI3?=
 =?utf-8?B?QzNNbVlFbFNhS01TRzVuTGNrRWQ3dTBmMStUOFBkekpkbW1RS1F4QUZwQytw?=
 =?utf-8?B?b2VTTkxUWlpvMjRSbm9tK2ZCRUpraFYvdWJ3a0pzYW9ReElUN1l1cGp2M01p?=
 =?utf-8?B?QW92a2FPZEczYmorTVFLbVNNTko1dE8yYi9SWHNEOS9ET3VtZTZmakpQaDRZ?=
 =?utf-8?B?emhqbVdRUmZwSXhhdDVvcXVVVi92SlVMclhIU0VXTUU1MVdVQXJxWFFYMWJD?=
 =?utf-8?Q?Ov2QNlJtlE3vhAZrdupwpE86SPgIVHgwxwkGWo7IHM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0894ada6-838a-4c51-4ae8-08d997dd6d41
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 17:32:32.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DK8E8KpXm5WEzgnr1YHHyYkh+UfSxglB5yUAScXxJYe4jwNJs/8une9DF5YjPafQQ3xvwsN54cFgCXpBjucIGU1TYtduV4qPJYTSeeJyDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5625
X-OriginatorOrg: intel.com
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

On 10/23/2021 11:36, Thomas Hellström wrote:
> On 10/23/21 20:18, Matthew Brost wrote:
>> On Sat, Oct 23, 2021 at 07:46:48PM +0200, Thomas Hellström wrote:
>>> On 10/22/21 20:09, John Harrison wrote:
>>>> And to be clear, the engine reset is not supposed to fail. Whether
>>>> issued by GuC or i915, the GDRST register is supposed to self clear
>>>> according to the bspec. If we are being sent the G2H notification 
>>>> for an
>>>> engine reset failure then the assumption is that the hardware is 
>>>> broken.
>>>> This is not a situation that is ever intended to occur in a production
>>>> system. Therefore, it is not something we should spend huge amounts of
>>>> effort on making a perfect selftest for.
>>> I don't agree. Selftests are there to verify that assumptions made and
>>> contracts in the code hold and that hardware behaves as intended / 
>>> assumed.
>>> No selftest should ideally trigger in a production driver / system. 
>>> That
>>> doesn't mean we can remove all selftests or ignore updating them for 
>>> altered
>>> assumptions / contracts. I think it's important here to acknowledge 
>>> the fact
>>> that this and the perf selftest have found two problems that need
>>> consideration for fixing for a production system.
>>>
>> I'm confused - we are going down the rabbit hole here.
>>
>> Back to this patch. This test was written for very specific execlists
>> behavior. It was updated to also support the GuC. In that update we
>> missed fixing the failure path, well because it always passed. Now it
>> has failed, we see that it doesn't fail gracefully, and takes down the
>> machine. This patch fixes that. It also openned my eyes to the horror
>> show reset locking that needs to be fixed long term.
>
> Well the email above wasn't really about the correctness of this 
> particular patch (I should probably have altered the subject to 
> reflect that) but rather about the assumption that failures that 
> should never occur in a production system are not worth spending time 
> on selftests for.
My point is that we have to make assumptions that the hardware is 
basically functional. Otherwise, where do you stop? Do you write a 
selftest for every conceivable operation of the hardware and prove that 
it still works every single day? No. That is pointless and we don't have 
the resources to test everything that the hardware can possibly do. We 
have to cope as gracefully as possible in the case where the hardware 
does not behave as intended, such as not killing the entire OS when a 
selftest fails. But I don't think we should be spending time on writing 
a perfect test for something that is supposed to be impossible at the 
hardware level. The purpose of the selftests is to test the driver 
behaviour, not the hardware.

John.

>
> For the patch itself, I'll take a deeper look at the patch and get back.
>
> /Thomas
>
>

