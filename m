Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EAF2F34B2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 16:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098906E2D5;
	Tue, 12 Jan 2021 15:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146A46E233;
 Tue, 12 Jan 2021 15:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD2LH2LeVpRHGhiBge/od0AnYMvbiLmwxRNGarHu5Xwe5Em4V413hWE909nTnzAUk/o+4qsBUnpNiu7hrMM+S0y1bCwpaAKxE/kPwEg4WQOWaKzFho9obAXBlzhTtyVxpmUp1/Vwk0sv5OMkaiIdpUjYdIE6vvWWF6lH1p0O6C65i8PiF4XFoDKCDZXYBayc53w5ttUivZwfB6B1xnW4fn/X8YCPeWf9En7cVHie1GuLlJPQv0cf7O0uA9uvm61e7sUgAjsBnIniGUhTdUQNwvrY3uFsQB9XtECCEnueVMBpHRdpsIrDnW8jxkDCc2BngsvUuwN8xPjAAoBs4IJ91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xmXuxpIuGK+ZbeDRIOMIs2gwEIEZNzkI2Rh5zG6eF8=;
 b=dxKgF8oy+LqOQsj0YPlNWhdfLUWBHCRZKn2oKHtx1nN4l5EA4tkEu5S2JgrhrQyrVqkajJU9b2EgXJ4lTKo8JFUEmuEgcNitRiT/4f+jxJwxdidDEkLrn5/XVxDiAGsFkhdCUge8YndS5jWk77z8DzqcOeoU2OVWmL3ASn+vPRgwqkW26jUAqwoj5VMFTlNiKa1qvX0IM311DsIsMtM8CwSV4/7qZK4pXGFCT9gdT/AzfAazhd3ssjz5g7gqLakUYJ8fVBuDsrIy9ZpkHq75PBESeX08NgIkRGXKU06khXG7GBppWoI5eeKZenmH+R4XW0rMFCOgEb8j6xQxnmrZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xmXuxpIuGK+ZbeDRIOMIs2gwEIEZNzkI2Rh5zG6eF8=;
 b=cx//H+t8wudW2w4H06CaukiGgmt5BKO5X1U0mbEUSuNTutEZtxy0/AnEV51XhZo3jF2WxecqZeOLAEkt+y/0keA7FD79e9sPTkpE2O+vf0Kw7yUxYIAohxgaML2oi0mhwmcLvP7Nh2uQq/ozZJc3gowrhWE1zKIyAQxvdV+ijHM=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:54:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:54:33 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>
References: <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local> <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
 <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
 <X/1niT8MNvcEwDFS@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <562a80f6-e5eb-6fe4-eb73-a0e9fd9a7d91@amd.com>
Date: Tue, 12 Jan 2021 10:54:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X/1niT8MNvcEwDFS@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1cf9:5b19:bbcc:fe65]
X-ClientProxiedBy: YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::18) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1cf9:5b19:bbcc:fe65]
 (2607:fea8:3edf:49b0:1cf9:5b19:bbcc:fe65) by
 YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 15:54:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae9f7842-fd4a-426e-380a-08d8b7125afc
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4541E919C2AE11E462698B0EEAAA0@SA0PR12MB4541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQYgQSVR99An6hyF5LzLs5BS/mMvLalYtjaTjM4+PeJ06GjSbG0eE1YQgsIpDpjsM3f3E9NTKa+3J2Btxfm4w+uStmM67MGyxYG3cfmgpYR7Lwp3c9lAoXMBU1ZAZr8NRSPYc1F1Ywx/qfY/2wiB1nMeplKDqflf8XQfr3A7uvVSWS2/Fz2hbvTYmj4ta5mUszXxawXvsGmzBrfmDOXUu/TPk4+fEGv3agrX6zN2IjS823oqdYGthTU2FuYtAS4Ma6wj9a0M8gMC2sp6yxugRvKxVByezB4AhU3Z9X0mijHR0iycN6qfu2oXu3ApE82n6nYNAZr56fwg72RVaTAHszJyLIzdJOXAl7CGQEiVLLywExfGk6Mk1jjvsPuzOru6gPZ0KNFdSmcivPusbh7NBU0ZpfAz/M0Dk9XKO6vaJrPtcFeEbtt2Xadv9DLlKXwX0mJPC3+NsqEmZAs3atlFb6PkQLRtluW4pHrPpEKckh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(2906002)(53546011)(8676002)(66476007)(6666004)(5660300002)(478600001)(7416002)(66946007)(66556008)(4326008)(6916009)(86362001)(16526019)(54906003)(6486002)(52116002)(8936002)(4744005)(36756003)(316002)(2616005)(31686004)(31696002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SkRjZFBhaWc5c3FJR3MxY3pBSEhoOXB3OEZKWWhZY2wyL2pVWU9VWHk1SWhK?=
 =?utf-8?B?Z3pIeWxJaTlaU2xSZ0ZmRGNmcHhJQW5IRHJpa2dEOXhKUDVScVRsRHJBc1ph?=
 =?utf-8?B?U0tmMUxrNWxGWmo0c1c4WE1xMmJoNmJpU0VUczYyY0R0WXNXbjdSci9CVUlO?=
 =?utf-8?B?YlNzTmNZRUJXMWVnM2hVUkdvSWJ6MnUwRXltSk9ORVhHVlFCQjY5aDRiVlFU?=
 =?utf-8?B?N1RDWFd0Q3ppUnlYZUtEUHdoNlR2SXBadXBjZXhWTjQrY25Yd0lhUlVzTVdn?=
 =?utf-8?B?SVhFLy9GZjBvOHZac2x0NVFpUEsxclAyNnI5QStMelltZjIxckJjQTRyMGtB?=
 =?utf-8?B?NW5PSGdmajhYUFJLbEhLcGd5RmZNbXljRDlXSlRYMm9pWVE5aWNBVE10T1N3?=
 =?utf-8?B?ZFhrYmRPOHhMNGVuaGgzWC83WHBZNVU5T3lXenZsUW92Wmc0dWhkbWE3dGVa?=
 =?utf-8?B?OEQzVFU2MXBrWDQ3Z09DZU9KYmpnNG1JMFFGZ1FJSEVZaGE0dTZtbEVKcXhv?=
 =?utf-8?B?Wm5sR3hnaU1jckY0bWFUY3JWYzNlYVk1elBGYVpxNUUybmFWeTRJUlVRRm84?=
 =?utf-8?B?SUJXZG5VYTVBYVZRNWp1Q05ydlJRWHpycmo1Zkx6c3dKSksxdldFeW5IRWdR?=
 =?utf-8?B?QzNGb0pIU0pocHFORFEzUmN2SElFU1JWUGM2U21SaW40S2d1M1Izc1dqRWk3?=
 =?utf-8?B?Y3FHaDRYOVRPUi83UjdrZHE4aWgzY3RIY2dsZjJLeUlsVzBiL0RFN0FIbHc1?=
 =?utf-8?B?OUVuOFlkYnR1Q1ByQTlQV083TTRKMWduZ1lwT2Q0U2NEQzUwbktmOHlOU01q?=
 =?utf-8?B?bzJHL05nV004YmhRaGRUdENSYU9iWFJxdExXcldvU3dxakpoMi80REludklU?=
 =?utf-8?B?VUhiOStUbWxVYU15Y2Q4U29yYnRJdnBLYlJKZmxZN0dDcjkxeUVTQzdVRzJE?=
 =?utf-8?B?SkkwWXNmNXpsVGdCR29hajV6YjNWelV4UVNOaUdqN0RkQTNsSXZHcUZIYm5K?=
 =?utf-8?B?dnJXYkhFZFFFdi9kY2hNZTZLOXZpaXlKWXpEV2pmek40WVpIYWViR1VXOGlE?=
 =?utf-8?B?TVhFS2xqMDlDem92MTRnVlFqZ28vd3VhUk12ZzAvaDZwL3hrME9XdWtDRVJ2?=
 =?utf-8?B?aHpsNFN1aFdLNHpUZ1ZwN1FwQS9mVmNGbThnNUhudkFnK2owanRoSnJyV2lW?=
 =?utf-8?B?clZjTmZXemVUUm1pQVhSWXhpM1VBNkFmeVlVdmt5bHdNWWl0MHp4WTFoWWVj?=
 =?utf-8?B?dm9KcTFzTHZQS01vT0dWUERZRklIY0kvalNZd0RVUGJ1cEgyRXRUZmc5VS9I?=
 =?utf-8?B?Q2laNGVMYUNhVE85UWdlbjE4K0tFTU5salY4VXc1R3Y5bVNkZUdrQUMvdDE2?=
 =?utf-8?B?L3Z5VDBsNC9zdEZmYlVQZ09XUFhFakppdWwvdTJld3M1ZkVJV0FCK3NhanRq?=
 =?utf-8?Q?ugztukQ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:54:33.5898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9f7842-fd4a-426e-380a-08d8b7125afc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKMYV4+85QrT53vk9hiI47QoRq1+2SBzFw5cZASu7ulJepbWs8/Ory7ZyYj1ndpIJE6jA/EVb+mCWeT/iL+HNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So - basically allocate the page and pass it as void* pointer to drmm_add_action
with a release function which will do the free page, right ?

Andrey

On 1/12/21 4:10 AM, Daniel Vetter wrote:
> drm_add_action_or_reset (for better control flow) has both a void * data
> and a cleanup function (and it internally allocates the tracking structure
> for that for you). So should work as-is? Allocating a tracking structure
> for our tracking structure for a page would definitely be a bit too much.
>
> Essentiall drmm_add_action is your kcalloc_with_action function you want,
> as long as all you need is a single void * pointer (we could do the
> kzalloc_with_action though, there's enough space, just no need yet for any
> of the current users).
> -Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
