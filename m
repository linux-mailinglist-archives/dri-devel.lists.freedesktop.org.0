Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F378560D5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444DF10E658;
	Thu, 15 Feb 2024 11:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pSOMp0+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C5110E658
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjLzLcUduJAuNuHbxwoJ2ydmIPMCrsXXsBJtT8OC+DptaY+1cZxttG+0L7Bodz7xRzFDPB6eChIrSIWRfCidy6vyGgkV/XKWAwbicrd83Q1oW+Eh9gvJcaQn/37yXigjHt4qL2EmYfHDpWFMc5pBiRQYogEBNtTVNpciGJ4lsN9Wmx17PK8ocEDeqcUHsYnmsI4TDmAYhx4ifeD22EOjRVmxVbOJkxGqm6tTbZp2MqrD7Od/jxDQeuU3uLTsz+0hHu4wuGxw6Q2MbrN11KMlunDChmWNwgNiuUQp5zQmNM75klXvj4eQqZ2kLjUPcXOUi2GOduQlS+//waeRGN+/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGfPFQ/8fEi88woZDPw4S8c6u3glEEgHdU4OueRa2K4=;
 b=HBzr0hY/RZVXnm+fXk6hf9+NQyB8LRcpKeqEgaJ1NLC7NHhMK2ATf7/cG0+qWLpgPgDHWMRUjeUDrC+IELyuKwHulmqtZxWQ/fh0nRQnPXCd6BBmm1c0F3GKSD5BwvjAHlFSyEncIxrwjl9VfjLB47K7QAFyyrxQDGxZmGNINcaEXkOxkErg/SAQfzdq5rPgxbVpYV522kXxnRDrQSXbpD56KhE5o8RtJynemIEz9J0OiE274ME8SqDvryWGcoDkRbAj0lc8wRIl1m+FBnJxE/HU+LWS5NvSeb1PlJngbP3LkL3zTNKeDqHXoIgh4yrE/SC5XtoYBTbBQw21BBBhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGfPFQ/8fEi88woZDPw4S8c6u3glEEgHdU4OueRa2K4=;
 b=pSOMp0+yMuwd0tUirqzqoRO7w7+mAngdV1c6JUwpyYdK26GkoIurYEk2Wl0ATeGXWYxWSjLpPznZkOAYLSSzrtgqWf/3PULCyMgM6srWcQsd8NRg4EwFXUwq3I92DeicVjIVtI133WvR0+h2Zr2ebyhlcH1IEl18ZZw7dm1bdItZQbVE8Oe+yDCDEOh4/K//2cZCgHF7h58ngcngsyhzMO38KvtYE9e8zXLNBivUHYkuNwjG/e4zWRW+2iSlv9cWg/tORTW8qsffHo5Ep/s7hkO8jbbdakYuw5BsX0sgUUO4Bsqiw2l+U3RPh5+62yo2kmo/VrLrxVfu4RYQV6rriw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 11:07:34 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f462:16b8:4857:38b7]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f462:16b8:4857:38b7%5]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 11:07:34 +0000
Message-ID: <49b0a05b-f094-4b50-8bc0-827c837cce72@nvidia.com>
Date: Thu, 15 Feb 2024 11:07:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
References: <20240214114049.1421463-1-cyndis@kapsi.fi>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240214114049.1421463-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d05067d-9e15-4f8c-d344-08dc2e164f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sKn0aFur2gaNHD9/2fbjIIKjjMRktuYtBAnsoem1rkPRPejOpaBlIPGjV/w6Ye8ndENTaEJWAogOixVGqnY451rAEV4IuCFoI+zKh3Rz1OuopFUw8jnNp62pKJ4+QjIYzERYEOuCCC2e7p7dcLtz+bCHZZDVnni9z9Gmyih/+Z6jyGYAoBNcUSSgU3Vw94DrMDPJs5q5aEhPrx8wPlDXfXnr4LcrtMLv6Xht5iGbTxxT5s4QJvHh8e3AxHHJJU496MZrlNp9PCy2iVOHMrow6cERtRYIULvUqT7P4vcuXHFs8eYH+o6CycWGOZ6SrAyn70CoEnvxCqX+j/AAo3e7QLFUkuOTyrDSbrwn/mpfz84QTaSfwRdmgj5JiMroJaMYzXCCFJeC0257kMmVdCx3ybKpbsejkYH88Ygh7xja7IpMAuSAJou5ldkZTZrDWtizicjQhvuMBoIuTaW/sQJRYGNuPs+mzQfNz5ZAU86AWmt5L7+T0erGHZYf7TrZ5CjizouTNU5ewLB/F2++Yi1Hn2enCkZYW2tiTjtHdUuN6Sj2dXxCF+9MDFlfIn/HvPu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(36756003)(31696002)(38100700002)(31686004)(86362001)(66476007)(66946007)(8676002)(8936002)(66556008)(83380400001)(4744005)(26005)(4326008)(2906002)(41300700001)(2616005)(316002)(6666004)(110136005)(5660300002)(6506007)(478600001)(6486002)(6512007)(53546011)(55236004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhHVmNjcUFOUXdFTVBrVS9ZRmMzZU9lOFg0UDdyNS9ObFZwZXVSdEZkWXBS?=
 =?utf-8?B?alJjaUUrTzROTmZ0MWhzK2JoYnp4N3pLaFd4M09RV3RNMVdVcE55SE45TGdn?=
 =?utf-8?B?OWR6UHRyaDB6bjFkQ0FBZGZmUVVGVnIvUzF3WWZqejg5SG9OVzJLQkJMT3gw?=
 =?utf-8?B?bU1JL1JKNUNGZ1dJMStBS2FyaThMM0FoSEdCTUxRRVV2NUJIMVBHSkpMWjJQ?=
 =?utf-8?B?bS81ZHlVbWYzSzlrRFVpUnVVSW4vdXVzN1BCcHNvaFJtNlY1WWRLdDFoUjFm?=
 =?utf-8?B?ekc0RklHWStyT1A1ckFPRlIrZk4wYkw0UERpZ3VYdTZuNktBZm9RVHdHQWxL?=
 =?utf-8?B?b2hpeXZyL3FNN3BOaHFzTGFmRjUxUmwwZXJmS2lRQWppMmdpYWl1cWlLREp0?=
 =?utf-8?B?UFVNQlM3VENOZDJNaFBsMjV0SjdXR3dSOFRPcTJaWG1BNnE2WFBQUUk3Mm9q?=
 =?utf-8?B?ZnhjWlJHdlBVTFcvUm0vaVJIZGhDL0l2ZzI4UCtSV1kwdHpPNEhYdjJHYjhT?=
 =?utf-8?B?S2Y2Y2lHNzMycjVPckVRb2t2b2hDYVJpTUhXRFVia3JOOEdpSjBrR01nSGpi?=
 =?utf-8?B?Q3dNdldKS0oyVFV6YlA0bkJ3WGVzb1ByQk5TNENocWdyUnUyYUpLU002eldl?=
 =?utf-8?B?d3VqOU5BMmNVdFZYajVHWEQrVlB2RjNPSWFEaytoQkU4Y3IxUGdqVkNwWUtn?=
 =?utf-8?B?bnl4cnpPWFRNTlhEMEE3NEdwUHRuYU4yTWVvY3VDN0JtaldCVXNscjJhMWNs?=
 =?utf-8?B?UTJ3SUFubDhPTmRnUk9tbmh5TE9zRnBraWxJVFVRN3V5NkZRTFNiNjcxWXNE?=
 =?utf-8?B?dEdLckdJd2JXVGhkNU5ielZ0OXBKNjYvcTlDUEdrQmFiNlRXblorWGRJMnAv?=
 =?utf-8?B?bHdxY1RDUjl1cDBNOTJqOW8yVkt5M3d5T1o4c0Z2aGdFSllISHNwWG5oZ0ZW?=
 =?utf-8?B?NGR5T2NKZEcvbFpZN0Q2ak5lWW04U3VLQlVwamxlYndmK3B0eGlGTUFSR2xw?=
 =?utf-8?B?YkhoaEwrbkZ0enpLS3VVczdNd1NoelVZK1JSaEFHSHcwbzhGRldRRkJ0bmVY?=
 =?utf-8?B?OVNWaXFhRnpsbVVvT1hOUGVxeTEreHRxak1TNDdJOWpSNGdvc244RUtVKy9Q?=
 =?utf-8?B?NUZHY0xMcDdtUzJqWHYvejBzajhzUTZId01kZ2Y5bkhKbUdiYmNxY2JEVUVE?=
 =?utf-8?B?LzJMZ3Y2TWVqaEhVOXNEcGcrUXllL3dYRGlycWZGUS9Ka0tDaTVmMkt0cGZa?=
 =?utf-8?B?RTJOVjhvQ3RKK3ZyWFFHUnozMjd5bUg5SzFRVkpoNkc0MEtWVEFJWUt6a3Na?=
 =?utf-8?B?ZWNpRWx6WkxXU3V6R2Jzbi9IT0FOd3dEejdqbjlsWXkvTkcxMFJpK29tT0VC?=
 =?utf-8?B?clRsbW5JZHlTbzdSUm9WS0ZoQXY0Z1RQZXpZZjFBb3Z3dWFpUGQ1MGFkUUFF?=
 =?utf-8?B?NTJ4TWFXVkR5MDBCSmNKbUpSS1ZnVGZIMEx4NkU3Z3VweVAvVFc5TzJUcEN5?=
 =?utf-8?B?Z3Q3Q3FwV2FhaGxzTjFERU1TdlNvRW9neEEzZjZWbE5Md1lqeGxGMnhnbjc5?=
 =?utf-8?B?YTUyMEZ0UnZ5MXppNEVvc1pGNUtrWmczQnY0bHByaW1qZnpYT2pCdkp1MVl6?=
 =?utf-8?B?eVluNDhGTS80cldpYUl4alAzUTFLWWlMTVJWbnBoTldkdHNybW5xKy9Na2FG?=
 =?utf-8?B?dGR1VlEweXZrREZqTGVJVWJOVzh0czlKS3h3cEhaZjRiM3VJYXk4eW1pbUg5?=
 =?utf-8?B?Y2hRV2VFSXEvTFg4Q3RrUTI4SWdUZE4vSmloUmI4TkxLaGZqVDBlV0dFZS92?=
 =?utf-8?B?TW16Y0JmTHFITWRLcDFiWkNhck8yUjh1dklYUkQrQVpGd21tWUIrS2pueUlh?=
 =?utf-8?B?c3o2bUVvNE5xMUx2enVkUkJIdnhBSmFnS2FFaGRZTmErakgvVG9LQXloaFZu?=
 =?utf-8?B?c2w4V1hHL09kQkZQNUduYldnM3dVMThGTVU1MGh1TUFxTVAxdm9BV2swbGdx?=
 =?utf-8?B?MjJrd3RQMEZUbVJ6YktYMjN2SHQ0b04wcWVlemRiS3IrdXdxY3FQSTFqbXZa?=
 =?utf-8?B?d05tcWk3bnZPSTZOdGdNTHhrSVJ6Y2ROSEVOYm8vM2EzUFFjOEV0ZzRxTjVh?=
 =?utf-8?B?WlV4TnBTRkc0M29NNXhpSks4dUpGdS8wV0FVd0pRM21YZklxQy9iRURLeEFC?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d05067d-9e15-4f8c-d344-08dc2e164f86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 11:07:34.0678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClHosPL4dINhfT4EPqWLhwcODHHZoIhvCdQ668B0699l7AIL4LHmVD7rtqthRwZsiZU8wAh/XyQPGc9G9zAZcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
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


On 14/02/2024 11:40, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> On Tegra186, other software components may rely on the kernel to
> keep Host1x operational even during suspend. As such, as a quirk,
> skip asserting Host1x's reset on Tegra186.
> 
> We don't need to keep the clocks enabled, as BPMP ensures the clock
> stays on while Host1x is being used. On newer SoC's, the reset line
> is inaccessible, so there is no need for the quirk.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>


We should add the fixes tag ...

Fixes: b7c00cdf6df5 ("gpu: host1x: Enable system suspend callbacks")

... because this fixes a suspend regression on Tegra186.

Thierry, would you be able to add the fixes-tag and send out as a fix 
for v6.8? Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
