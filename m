Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB972234232
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EB56EA43;
	Fri, 31 Jul 2020 09:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B7F6EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8+ON76TeCjRoBVJl7XvzifECmkynhkX+pr7vF6j58cO6AbUKDo5MVipsyXlCPH0zuIVdkEavr476TD9e4jPKzYIbLW+0lPLvQ1SsoAIG8pAwXsE8Pwuorcf3gBl8WkRGCF3T/Rfl663r6+LCw5I4KUItxM7FpZtJWoJg42sJyjG4X4/6wWAnKXLSW3CN77ciFAHQJLpdEVn8ZfLFnpJDjYwB3X421s3vQ57Mvb3g87wiXkktk5QsM/ZZbj3k8qYy90FJtRVVtnsdK30RTcEyBR0hzOWK5WYR9ipL9P6yRci5xet+0PhHJFZfUyLh5ic42Izf0jrl9ZxBvsOljzBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT3m/rSG37CLXmig3eKfuBWDrm5fHPootwGTlfd0QYs=;
 b=MS6aNGHLapVZZxSrMAgr0/77CtSKkB3cty4igb8868oEPZo1ViqQIxp1LQBAuemJgaLyXAEDn9pjO4lDTgCJ2dV/BwOYqncpAanZgSsmvfKygfk1KpOfRcXGU2HPyLSzh5dU9F0Q1gqUyO3u811t9Pu2l5C0wx55fP2x2dVmyJbULNR+J3+Py12g5FUTrOgSbDY/Ornxo8+49vBrHY7HUX9Sf73u8b6d5F0U+sJeZ3A0Nb+a8HHWNvdcoQGww1vTS1YY6p9n0CvUe98nJtUjMYplto4YKRgc8t8IsKvjdtSwK6a1m5/dNcKHAKlhbmIJIr9kt0lzGlluR5c7F4y+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT3m/rSG37CLXmig3eKfuBWDrm5fHPootwGTlfd0QYs=;
 b=tvFqpi6WMiuPAr2/5YVhduAjYDGZ6nR9remVDI04f6p01qe2wYd9t1jIntlvG+WWBNQLzVPQDa6tREuuoWA2vqcfod4t17TxU6CPiyKRVzXizy3WS47fjXtzX6PM8Fg3XAftea52ZG3P7BhLXwjYOtZGZ7jqamnYRPOwrtAfq0w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 09:17:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 09:17:32 +0000
Subject: Re: [PATCH 00/49] ttm mem manager refactoring.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
Date: Fri, 31 Jul 2020 11:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Fri, 31 Jul 2020 09:17:30 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a241dd9-7514-4ab3-d2ac-08d835328dcd
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2578366D2D6D5D2CEF229FB3834E0@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZQna3636zBRMmpIdavUhnbDhzZWTFjBVyNgGH7s0sgRFxpMS/sv39xdLIAotVNFpLEOY5MB70KFUOUHiU1bVn6EHe3hAPwMgzc51VvNBE3w98iUHtjpyos/bcLZTo6WfyByPjcNwXNerHYXoAmyR0D+GPEcW6RVoB3PZZk511DF7174MsBqG8W5sjHUV1pob1YWarNW6XRBaisknBDbMSt/41VYKpyf7BavmsNGmtEvtEYplJLwCv/f623icLQtpG9q5B6GzQxYhwtIHyQijYzjVpOCoeqL15VWS5zogjrRxSVxIM85YPKsMh9898qNvxFMRfoxqJBNoNiS/dCXp2IUiCYPQ8Niuz8X+60yrV6e8VpnFTdLRtoUGhk7AWKX2Tnpr59dgqH7xOhn/1AmyLdriyK0GieEnTNbC/eOGL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6666004)(4326008)(6486002)(5660300002)(31686004)(966005)(8936002)(316002)(66476007)(2616005)(478600001)(66556008)(31696002)(66946007)(45080400002)(16526019)(186003)(86362001)(2906002)(52116002)(8676002)(83380400001)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bDHaAKbsyReVY9aNgdvwPR7C3y7SbV1wOs3/KqNl6MJ2e+q2/ao14vQwF8E/3t+2BdcmjHiOj2uKpn41GnL9oV0HTRZ6k6sWK+OMiiFKd27Ra/8jkgrAmjNKZ+yHpVdAaugVMP6zId5PrKcWT78cPTJHnUcaXs9aDanu/VJk3CNNWtCjIyit0DzuSsprquhwgWSZKQXz3eOB3wr5D9ECJEQ6XgluPziwf+X0tSZsGQsrsqIrdjIn82CMboDdNVAj9bPnr+JIY6GqWSj1hvBJMKIREN9avl4hQRlUfgcUJqfEcTYro23YaKC+EGn5uPnGGv6PH1nawoInSquVtDKfWIrs/lFHDgWbUZnzmP8kL4/ggJqYn/2HfVgyTej3HCAHhgy09PkFwFAgYxO6kk4DtOV+Iit4W+JAuRPiSjS8lqB7xPHRSz2lbbpciSv5Uuir1KrUvl2GjXng4hBN8NxpObLWMu/3F6k4t66AD+8BICjT1C1Gr4ahD8LuROWYDp4q2/ai/7Kd7ZM4PjqshJJ3ChXuydhPRdblUsoED6WijalUv0QyTJFdx1KpprvJPqVXGzfqRbE7TAJerQsD2fT4l16yndkY2ILetuRit9iw1/2bhbKCYeFELbKfOJ0wBGgC3XvpmgODlzOmBerq68PTbi7mgMStNRZtO2Xh7DJ5dPTp2uGNB8LyGJFwLn8eOc7XH79b90AusmuornzBt8UOew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a241dd9-7514-4ab3-d2ac-08d835328dcd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 09:17:32.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBllLYvBKnA6adkOPPlSEXtag1BzQrDaNYuHmFcfhH8bXvN4rC5PqTdt564W25dg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> I started pulling on a thread, and it led me down a hole.

We might want to make that hole even bigger :)

How about we rename the ttm_mem_reg into ttm_resource and 
ttm_mem_type_manager into ttm_resource_manager.

Neither amdgpu's OA/GWS resources nor the IDs in VMGFX are really memory.

In the long term I also want to move the whole address handling into 
each backend.

Going to send comments on the individual patches as well.

> This series refactors the ttm ttm_mem_type_manager object into
> a driver owned, allocated, subclassaed object.
>
> It starts with two minor fixes for some bad assumptions in two drivers.
>
> Enables a new init path, ports all the drivers to the new init
> path, and cleans up the old init path.
> Enables a new takedown path, ports all the drivers to the new takedown
> path, and cleans up the old takedown path
> Wraps all access to the memory managers in the bo_device in a wrapper
> across all drivers.
> Make debug callback optional
> Enables driver to provide their own mem manager objects
> Subclasses the objects in all drivers and makes them into driver owned object
> Drops the bo_device arrays of pointers, and some unneeded links and
> struct members
> Cleans up one api.
>
> I think I'd probably want to merge all this via drm-misc, so if I can collect
> acks/r-b from driver maintainers that would be good.
>
> This is also based on Chrisitan's work to remove init_mem_type, so it won't
> apply until he's finished getting all of that into drm-misc.

Preparing to push that to drm-misc-next just now.

Regards,
Christian.

>
> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~airlied%2Flinux%2Flog%2F%3Fh%3Dttm-refactor-mem-manager&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Caa32512acf9f4bf455ef08d83506f9d2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637317651361302583&amp;sdata=2sQt4A48ODl0Nq4P21YG3vRNdhkDZcZp0XHkQ930SAI%3D&amp;reserved=0
> is the tree I've built this on top off, so it's probably going to get rebased
> but the code should stay mostly the same.
>
> I've done some boot testing on nouveau, and I hope to test it on vmwgfx and
> amdgpu soon.
>
> Dave.
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
