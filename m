Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BF23EF12
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 16:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751616E9F4;
	Fri,  7 Aug 2020 14:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF036E9D3;
 Fri,  7 Aug 2020 14:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INhD+8d+9haDv/EDUx+z9hKOGGidsySWZbqcccgEqgsqWYtJOzS+syAEzICbKz/14NzBXT4y+T7/wAb5YKNumcZ8OYiQFCt+ZsPAAkTh13z0UmK+T58uIPVLp2HW75ZtegcTbDluAcadh5iyQDQez/rAtmGynfRIJipk92145KPC1SPlOBS7WC3wC29xU6tAsT7gSBVHt6P1gVzezZ8BYIp5KCs0LQYkt061OdsT9hF9HaHOlewJev92VFv4Y42bAS15XmG7EnFbcaQi3tmd+UwX8udYNBtImvdqq2VMU67iYD4+qRAxi+GLoZEW05uu2qqEqxTZ6VaNsiv5cQwYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxo+VFNjpVLX2IPDR+A+3bZRQWFAfu8bbgC1i6v6sQs=;
 b=Rb8hGcSdIy1ritML1ni7OTurxuX7Gmssp/jYM2r3JV4tlyPGXDb4Q0m6WKlwkQIJGzrtPG8lxUvs8sYZNC+FMCX1pi/mjPHSrxb3YU6w/7WrD2i+mt4tQn3Hsf91nwvli232BuafzY0WG8K2ppAbAnRfWNeRWYQEObktuzm8kqXaQ+cvMKK2ewclwoUnw0+gUQRKEJbWSPv97dv0YYyYiqWyjDolI4Ix0FKAag9ob24fbXIUjQ1LoTYrJZv48RQEHboF5vSWZ73AZEn+CZRE6uKAPc4EFSxxzZ/41t75NedNHQryvzWocxQAcwfRJJss69i3ka+nmrqR8JPTv+U5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxo+VFNjpVLX2IPDR+A+3bZRQWFAfu8bbgC1i6v6sQs=;
 b=Dof5mglSygrilbXB25ooQu6zutyGIUk6OKcOnm7dwxmTiD3Vsyxz2cePAcZ35ttFZG5UisVLn+fl3iGfrth5rBai3/jyDGowVXWsaTufQyGmwCxaGRxPD7A1WxVbblHSzxzAZkUoV7p307AqYJRmdG5Hwsaq2E7266pn47zKrrs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 14:32:17 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3239.024; Fri, 7 Aug 2020
 14:32:17 +0000
Subject: Re: [PATCH 7/7] drm/amd/display: Replace DRM private objects with
 subclassed DRM atomic state
To: daniel@ffwll.ch
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
 <20200807085214.GP6419@phenom.ffwll.local>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <88c15278-9510-c7b9-76ff-62d425d721ed@amd.com>
Date: Fri, 7 Aug 2020 10:32:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200807085214.GP6419@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 14:32:16 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67d818eb-1525-42f2-ce86-08d83adeaf2f
X-MS-TrafficTypeDiagnostic: BY5PR12MB4034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB403402E0FB3B4F608BE443ADEC490@BY5PR12MB4034.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCRjzKvTDUacxpO05i50Qc/N+F0TThnUMs6TGfXkWYo9uxr3nzJwNJdrrk7+N4Mlm6ciKKu+MHvCdJ+7FeUZTX0OfOQHDpznLotfBljPNPEuPCPxzONnK8RXAaJW8EJgpkyI5lMowd15N2I/d2/fIVgu0rMn0Q/62zUqezMekLVpjvzNFCCEZx2k5BJt7Q4q058rFrm+ax5JsOiEGAGpu4JAJu28HCYTWWOW3AdlsfLy8XDt63zsXekDoYu1OYQ9LsIJRvCLj+5OGNHOIiQyeTYIo+P31I/0wuVgL8BiucS9i6wTbgDYYC+rjeCMehgGYqjbRNRoEb8F7ezMCH5v6TzkSbk9GMbQYc0S0jYDGEzb2oSZQvVHWtyVUEMOUAgd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(6916009)(6486002)(31686004)(16576012)(86362001)(52116002)(36756003)(316002)(26005)(16526019)(5660300002)(54906003)(8936002)(186003)(2906002)(478600001)(2616005)(66476007)(53546011)(66946007)(956004)(4326008)(8676002)(66556008)(31696002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6tI2gVUGG9Y20CcurWiPdkwurs6pOz8RTeOvLXJNDsHasCAvYWbsihPeXbYEPRVVCIto96ZKi8E/X5WaAB9ms2vAPDhDxElPJ4hjC9tB3aIbGFm5uP1CBG0hrNLBkySeg8lsEYv6U8+LcrvrszY8f5l56Xa53PXmtFYLkRv0IgvJBZ3dB02wS5pjDgxwKb/f3qKK7SV+m7m3Vzw7fwb8hn0v1lIgaCGLqWbgXpJwyQY/wZOev0cBF6Uu9x2SANrV8+GdJd7jyuPrp3xKFDevb4ZouvvkKg3jvB5DGz7S7b3s9vLkDzAwnvZeY9WMP+Hk70qr7bx2PZmuovWJN7cSuFPwHIwsBJ8uFBkAJZgNutG8QftjD+vdN6ag/bOncDyGnh1mZe/bWEJt6f8QEVzjsGi325g4fhB62ltVbCyiv8w3Ulvvi7jnV2C3rRVIwvA93GDJsrcbKKzq1CDXir2+wQlVwnZVmm91me+zMEiGebsVCuMuKXXDP4z38udk8ALAF5gXKtfPwssF35W8TEv/tyHIDoWPPYAdbq7sF5OaglZPKN2mGxgehBlr878DbIWwcyot59mFnRngXM4RckhsEpfErVlRGxqhU/bFaSGP9iwdoLAyO72Yn2CfyrSD7AhGSXPh3rOQShInOYLtWv6Ppw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d818eb-1525-42f2-ce86-08d83adeaf2f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 14:32:17.2110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sRFsOB+u4kULOZe6J9AE4U3SiOjxtM6spWit4nS3E1Py8w/pizcsoyubLJtGgRjRmKRBd+JTiELz5VIoQMQyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-07 4:52 a.m., daniel@ffwll.ch wrote:
> On Thu, Jul 30, 2020 at 04:36:42PM -0400, Nicholas Kazlauskas wrote:
>> @@ -440,7 +431,7 @@ struct dm_crtc_state {
>>   #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
>>   
>>   struct dm_atomic_state {
>> -	struct drm_private_state base;
>> +	struct drm_atomic_state base;
>>   
>>   	struct dc_state *context;
> 
> Also curiosity: Can't we just embed dc_state here, instead of a pointer?
> Then it would become a lot more obvious that mostly this is a state object
> container like drm_atomic_state, but for the DC specific state structures.
> And we could look into moving the actual DC states into drm private states
> perhaps (if that helps with the code structure and overall flow).
> 
> Maybe as next steps.
> -Daniel
> 

It's the refcounting that's the problem with this stuff. I'd like to 
move DC to a model where we have no memory allocation/ownership but that 
might be a bit of a more long term plan at this point.

Same with dc_plane_state and dc_stream_state as well - these could exist 
on the DRM objects as long as they're not refcounted.

Regards,
Nicholas Kazlauskas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
