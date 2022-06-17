Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9037154F828
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 15:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB011ADFF;
	Fri, 17 Jun 2022 13:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA9E11ADFA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7cF+gU1UdV668EWEfWk6iWAe6vLbtb2ruiXva6ZoB25XmLon74cOs2joVqbbwpM4vBVcQK7bbQzBui1IoKaDERC4NK8VflUSLHXgY8lAjeTvzuVGxjCrzdSomZux23JXBNuCls8wJNajB7Ape43TuDZfOKhK4zHAGqP8hNNZwlTfLPcQ/S7JbZSlNRYSD1beQxjTC5pvmtkAfGgMB4W8LiBbBdk3y3ukBX2oK4G4mwpDrNN+XoJ9cZk8PcC1XV6bSuX90X6uwMravStQDU9dwFfZkaBJFS6sHA5DNsXp+rq8U5cqVBYhhzOkJbbWIhQtCPItSdiX53K5SYp76Dphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVkUHds00OX8NqyPdyEpgNW2x3anRTrl8WAb/l/o9Ls=;
 b=ZQTHtJf0B26MzWItIvtolzfSpzVe6igX6NiARVYsm6UxSTdI5fQls4ZqJnrl8wlw4DUcHJAeIjcA7MpHhhPRxndKcpRLVUvTJybqxmBffb+/5IxnM679iZ1D8//52fG6FlPksKFIuIRywpoOU1HsJUIDCiZ4Mk6giDf37SVt7tOPtKNughqN+cN1GBQe1LBvHJuiv1lMJangQtsveqSqFAQHJbdoRJJJgkdnPk7w3qKBmmSFm92dmMZYtiGGPw91oNumrqM4OVZT/MCK/KydxIQZe03wEOwJ4gzXCWBb7P1C+XdUxS7fQhPuJOQGFI78oMyNHaOzxnr21uB1c+hCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVkUHds00OX8NqyPdyEpgNW2x3anRTrl8WAb/l/o9Ls=;
 b=Ujas2yKO0gXrqM0z3FivHaSgsVqs5gxj2aE34JW/Cn8+VzMf7P76Z1XQXH92rQdXgYH+EmD+Mw9rnb+lFy85/BlrMHhuS0CisZpchS/enCAb2niuPq5Voh3ywmr6sZwjsU8kWxqy3vt9/3xCAiRN72f0HUS0AcpLUkgdvJNOFYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 13:08:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 13:08:05 +0000
Message-ID: <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
Date: Fri, 17 Jun 2022 15:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
 <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
 <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d05ead90-7d2c-41c1-c908-08da50626a9d
X-MS-TrafficTypeDiagnostic: DM4PR12MB6040:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB6040DACB8BAFC18D2595413783AF9@DM4PR12MB6040.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Vvr0KXpuT+ApEWHZ/D/aabjY0DR789hjwwKhHXXpD8+fFTIHW76bji9udG6pzW/nE6az0rzPy0plagFe/ooyGjBTo6CSMsg0NE/6s9bdcMlIyeKnRiyiruaNaNnyOWKKSG6Er5c7vNw8Z51fV66rl358Xyf2bqW9ixGKXBYiVt9IpvMuj5TD2nQfQ30fEiAkwIjlHP8nE4dzqGK5AkFFA7r+FPfm0giUowW0Mg1li+HjJlEt2shHbo17VUJ0FdyM+7qDTWU2V/egWpORKMJYtLOHUVMGvPAY0EqeYrjg4VlQGPM6Ka9VQx89AOzX97ZgFK+L1fakYBzrU7RUuZsX8RUADDY37YMg84CMh6TqyQ3OmPRmNKRMHeGVzOmuyL10Wtzk8gmKjgUeBgz+Py3yS2h/9aWWkxFwgp/sQl/6vx9Oh1jHh0aakvgT/88aYs07t+nHMBRSTpY0hgHEyJto1g4n6TYqA3S15O2PtJQTgknBXxfMNPqYiH8I4BLy3mJy4EhWOQNf8kDsIZxEVRUkDMlbX/6d04dbf3YAn37W5Xvw1NW8YQUljH8+Lm+KxWeTNgVpayhwL+BAQjVNwxCRbODJZ2ATrP3X9DiNM70okKQQEudmOOQ0JzFobLwJWW5am3tHPX3DlrKgWOPdUqhAm8RF6G4kyrA9AHlhFXDjLSxNLMrnV9jX3GN9ANTYrxzqDjaQudSYMfDcNGPLtFd2NcanxIcJ3hW6ht42naRbPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6512007)(2616005)(6916009)(2906002)(6486002)(316002)(5660300002)(86362001)(31696002)(498600001)(8936002)(66476007)(4326008)(66556008)(8676002)(54906003)(66946007)(186003)(36756003)(38100700002)(6666004)(31686004)(6506007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2orblB4NVJvQ2dBWEF1K1dtT1M0ZmNhVCs1RWhmSnlZNjFuNGpoQ3lYZ1ND?=
 =?utf-8?B?dFYvVzBHRWw2N1NXQ1ZlR1FETm84WDJIUkd0N09UbE1rVzBYSmw5QVpRMmdv?=
 =?utf-8?B?WlZxb1E5dkFFVWtHY2daTUhHUXZsSUdRMklPdVJMSW5QeE5XQmZWNkF3Y0ND?=
 =?utf-8?B?bUpKR2x4R3NEMmpRRTdlK1dDRXNycTRSSFFWOEtWTkNLZDhXaDNJajJFcGR6?=
 =?utf-8?B?RjMrT0pBV3NRMWJOZVB2NDNtWVZLZVdPREt1QUV4dldhVHJyblVvRFBDVSsr?=
 =?utf-8?B?dFkzM29Dc2RVblhtclRxSWJKWW5vc0NmZmM1a2hRSzNObmlUT2hGWStpL1Q1?=
 =?utf-8?B?elo2ZVVqTVBKMk0zaXAzSDFseHBIeFd6UGpudmVSWFhRaFFRRG1YRFE3elA1?=
 =?utf-8?B?eERicmZmYTJ1QldWVG1LUnZsbEpHVjcyaW14QXNTMFNzbjZQU0hycWYwbHJh?=
 =?utf-8?B?aDRPa0drYjg0MTMxTWFqVlRZQUErK0tjYldndklPMG1EOWtXa0ExQmVGYUtG?=
 =?utf-8?B?Ty9LU3pKQWxGOUNyTTlrLzUyNkdFdmMyZHM1UkRwa3IrQUtpRGJwVE9LdjBl?=
 =?utf-8?B?RGNVbWVCaEc1ZTNEdndBNjFoRmd3UkEvTzNnR2Y3TjVwKzRvYXY5U2piWlV6?=
 =?utf-8?B?S1NXV0gvVnd6cWVwaVpxU1JMcXoyRWFLVHBSWkhmNkRYckhjTEdIYm0xQ3ZQ?=
 =?utf-8?B?STBWaE9LMDlNcnpKdHo0djNHQ015MDRBN3RjelNDazRvT0szaEM4bWdZNzhy?=
 =?utf-8?B?T0tnQlhTb3orZE1wZEhrVE5rd2JUajVoQWI0WnF5enE5L0x4WEY4RWtDeDVn?=
 =?utf-8?B?VkpLTFBvVjZIeHl5cDl5MFMzS3JRREdYeDlhRjVOc0g5clNtanlwNmRSZ0Ju?=
 =?utf-8?B?NWZQVFFNZE9wcUthWE9KSFNpNzFtV1pJc3psdldWMFNjN3Z1U3krdzBpRFl0?=
 =?utf-8?B?REliaENndGI0SzNwV3BuZjVObWd0SUwreTlDRFdlZFZzQVpwc3RwR3hRcmcr?=
 =?utf-8?B?MGdER2laR0xleHk4MXBSTXdLcGI3MGJXRWR6amtTN21lbjRYK3FJUE9nemNh?=
 =?utf-8?B?WjRmMVo4dmRQYmMvNkgwZXVPMXBrK0Z2dDJOZWFBWk1nUmZrMWcvTXBGZ2pE?=
 =?utf-8?B?UitnUDB6UStQQmwwUmkxNEZSNEU1c3ZjbGJDaUVNRkx5YWVPZEMvQm9UVU9a?=
 =?utf-8?B?c0FsMDYvR1F3eWw3THg0VUpFR2dKQXpGZmI1Z2dZR2d1S20rMDdaenlUZUdC?=
 =?utf-8?B?UlIzTUpaUXJwUmJ0RWhNQzNOWXp5MW9mZzBkTzdQUzF1eFA0RHVnU2o0YkIy?=
 =?utf-8?B?K0ZOK0h6d1BUeEpMbjlEZHZPU25XOVFJRW9wMGFkZXRrOUxXaEJma0dnQ3hl?=
 =?utf-8?B?OVhaazJGbGtBT0c4dGMvUE9GbklrQ0kxblM1aDZGUFRlS1loTlMwSTFHODdv?=
 =?utf-8?B?VkJLOTlwRUgxVmQ0S0dDcmtCcnpZbk9jdkJOUnVjTklnOXhxYVk3eVErb1Zl?=
 =?utf-8?B?bTBlNjhFZmdRYkRhZEhXd0ZtSjNWRXlGUWljK1RVNnhYeVF3cVBxUGowSXlU?=
 =?utf-8?B?b3dLSUdHa2ZsRy9uWkpUV1RXcmx0YU5NYkh0OTdxY1NWNENZRHZ1dXdadWlD?=
 =?utf-8?B?RDM1VTAzc2VSV3NJM3FiOTZWaE9zWVc4N2RudHNBQk90dGxjZDlkTlZmUHlt?=
 =?utf-8?B?eEMxWStlcERxVmdkRnpRT2VqcnFEeHhyRjY1bzQ4TUFsS29ick0yNlRZYU85?=
 =?utf-8?B?MmlBSVJ6blU2bCtJRFl6OVhmQWl0U1dHQU5LRWZQSmlkaXl6RzB3SkVWK3h2?=
 =?utf-8?B?a1hVL0w3OGdpMEF0RHROZWhLU2JQd1Nwall1ZHZmU3Q1ZXg2Wnd5b0o5eG5S?=
 =?utf-8?B?T21Qa1p3bng5QnE3VThMMmJMNy9nOTJLZ1hOdWR4dERwWWZlbjI4dXQ3UDZn?=
 =?utf-8?B?SjdPZHUyQU1odS85dUdCOEJ1YVVkWHFjRS9MelZlTXAwR2I0dGFOSzU2VThM?=
 =?utf-8?B?UG9KbVkwcEtwbVRFelFUOFRnMDAySk1Jc2g1eGF0Q0xrdlM1Z3N2RWliQWYz?=
 =?utf-8?B?RnZGdjVwcmYrR21jck9POXplVnBrakIza1UrYlEvQlNibUM0MGJ5T0FPNjRX?=
 =?utf-8?B?NmdTSTI0SVBwOTVCakVwZjN6VUJUbTZQSkFZNE9WUzc1dVE3OWRCK3pVOGxk?=
 =?utf-8?B?OXhMUTZUNXd2QXRUU3MzVUEvRDFzVW0xTHZUTjg0WlVKb3BySG55dGZrSTVv?=
 =?utf-8?B?ZW1yYUQ2bk1leDJtZEladXBpUk1xbGRRNUpTQUlIT2lnQ3VvRTRuZ3puekZ2?=
 =?utf-8?B?S0ZzM1NjQlI3aGhWdUp6ZVdEck96eTZXNGp2MGpyTERWdFlSKzVNWWg5b3U1?=
 =?utf-8?Q?1LSacaTx6kAL5P8y7vhDzGSf+4baxtvSZ8uJ5x+BfdYF5?=
X-MS-Exchange-AntiSpam-MessageData-1: YXWmojko2DLm4w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05ead90-7d2c-41c1-c908-08da50626a9d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 13:08:05.3963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfp2JaePVgNobNFd34vI6WRMtE1t5AYCcl9Ve8hB5YGD/OFJGcGPLeAkDR6/hJsu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.06.22 um 15:03 schrieb Bas Nieuwenhuizen:
> [SNIP]
>>>> BOOKKEEP can only be used by VM updates themselves. So that they don't
>>>> interfere with CS.
>>> That is the point why we would go BOOKKEEP for explicit sync CS
>>> submissions, no? Explicit submission shouldn't interfere with any
>>> other CS submissions. That includes being totally ignored by GL
>>> importers (if we want to have synchronization there between an
>>> explicit submission and GL, userspace is expected to use Jason's
>>> dmabuf fence import/export IOCTLs)
>> No, that would break existing DMA-buf rules.
>>
>> Explicit CS submissions are still a dependency for implicit submissions.
> This is explicitly what we don't want for explicit submissions and why
> I waited with this series until the DMA_RESV_USAGE series landed. We
> wish to opt out from implicit sync completely, and just use the IOCTLs
> Jason wrote for back-compat with windowing systems that need it.
>
> If BOOKKEEP isn't for that, should we add a new USAGE?

BOOKKEEP is exactly for that, but as discussed with Daniel that's not 
what we want in the kernel.

When you mix implicit with explicit synchronization (OpenGL with RADV 
for example) it should be mandatory for the OpenGL to wait for any RADV 
submission before issuing an operation.

What you want to do is intentionally not supported.

Regards,
Christian.
