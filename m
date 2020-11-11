Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84C2AF480
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 16:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257AD89FC9;
	Wed, 11 Nov 2020 15:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7982D89FC9;
 Wed, 11 Nov 2020 15:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdkbglX5czvWY1ARkW4lDZNn2Glx7/mTEZ/WuPIAQBiLkkGfkLbOXEj3uzXO8ExjtVojTh6ZgSO77mG2GXRq78wSelKhRTN/T9AI2Xapn9pMJ8CmQ4jX1AfT1L1mLxLh+KCKX5DwVA6v9Wf8v6sIT2xtAVBikK16/ns+r9AkW6VupqGBz3PXjmCUTxlkkz+JNiwpRI1vE78SYdHAd/ESiO+rYejQJmustegNpSFwGjkY6zExm8rLc+29dQyt63nMR82rvNSLYMAyicnhiA7YEkBWzHTnnaoN11/xoYxXjNWCUe/XQBCgHlGqxKqK7/4yuYrz1l4U3+cvU+5il0BtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd8FLwcO6MU2NVRUsSQoCPy8AqO2lrycKoIyT/0OVYk=;
 b=DmcFTi/oLIH5ewv/072L2VrdW+3A//PAM/TbZCMssFo9M8SRD2PFqH/vHQZ8uvz5W4uXXF6VEhArVWNBBOeXc/P9zg0zDiM6eWeZWQrU96s2f7A6YsNP5sX7sITIARWYcd2yAOYIA+E6HI1ADcFZf221KGMpiLSiX96L+ZGaqrr/YYBiixZD9xxWFjMHCvUz+RmvX+DdI4dHN+aAMe+mjOyN9Xi7QRgQevf3yQ8mf1pV1z2vPe0Vf3RhD8hwF/wvaokauSo6SbtQaNXP2Tv0+GRzbeEqaaZmmzA+WLnwYbaiyjRw6U2wjJp9jLUkQXfsoYyUXICVt4bbVLgjtobuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd8FLwcO6MU2NVRUsSQoCPy8AqO2lrycKoIyT/0OVYk=;
 b=fz70P4MRp84mNiwc6rg35ldn/s9/1J6k86d5T7UuXLV/P/DXmt0EXAxAiDXw5owzUw3lM6Yt08Y27AJLSkLuiRiiH2kWScSGLaHqC89jW0MVVy7VjfQnxsNsBPi+bn4qZuDQhQJP6Mi/qZNVVPNUNfpuB1Tbf/nX37ZE0I/3OTU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1515.namprd12.prod.outlook.com (2603:10b6:4:6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25; Wed, 11 Nov 2020 15:13:16 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Wed, 11 Nov 2020
 15:13:15 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com> <X6rU6lKDCyl6RN+V@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com>
Date: Wed, 11 Nov 2020 10:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X6rU6lKDCyl6RN+V@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7416:506d:efb6:9c79]
X-ClientProxiedBy: YTOPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::46) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7416:506d:efb6:9c79]
 (2607:fea8:3edf:49b0:7416:506d:efb6:9c79) by
 YTOPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Wed, 11 Nov 2020 15:13:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8d96fc4-1c25-46a4-23de-08d886545040
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15151574EC54C23B004149B9EAE80@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0E7Igm0k45+eJQ/CGeVcjmWM3Fk9AQrD/5vAxmSFG0BdrNrHCtxA0hol7rHqa1tWRm2XL1BpAGSw8UMGgKPurPD/rh88JMpM1ZZ7Xtoi88KID6TDjRo72bAvHzhQ5K1Gjy1QyrT+pnUshX2/MHCinEOzyAI2WuadxBRnsDqiAtnu41ml6+/QeT97hFaOWoNtW9dD0Oc2+/xQeZTATiPisIxlPtG7iVoAlJMWpFmMHoO0Sk6HcN8+/TSKldMZ+T2BUcqco8o6T9e8U8x5QU+h2mHSjLK0n3sFzlnw4yZEGfY9BtNZPaXafousKF6MnsQYa8bCIQagc9sxKjUwCWxPFDWgOQyXZnSM6xDmCi3uUm6OT8/WZDZWhB0vwBRcxtZkEo+uM5QggzBTvrNU1suugQ/I8A/S4VM2+0kLaFzOxwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(6486002)(2616005)(36756003)(186003)(16526019)(966005)(52116002)(66556008)(4326008)(66946007)(66476007)(5660300002)(8936002)(478600001)(2906002)(53546011)(8676002)(45080400002)(86362001)(316002)(6916009)(31686004)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVdDbTRBaHlaTnJkeXRuTkR5cmZ2bmxxZDljampKNGFDMGZaN2FJR01TUEEv?=
 =?utf-8?B?VUovSXlnZDBaT2Q5RUNoUDFGb2Jvc0tRYUNpSWlzTGppQXYrWUE2dHhQZEk2?=
 =?utf-8?B?Ky9acUJUOTk1UXd0cE11QzUwZFl1VG1oNm4xbCtlNXJpbEQ0WGYwZ3h0aHp2?=
 =?utf-8?B?Qi9xRnJ5UVR3Zk1jK3BqTk1YbEhMRlpMeGNKZGFydEFkazhYbDMyd1FBKzhK?=
 =?utf-8?B?S1VaN0hCY2FSU1JYZTNycUVOUnFvR3RHN1hUUGJvRVl5R2pmdmN3dWpEbFpn?=
 =?utf-8?B?QnRYb0hWaXI3LzhuZzcrdk40Zm8yTkxCSnF0Wk9qbWJSTE9sNHZ2eVVDNExI?=
 =?utf-8?B?Sk8wYXJOUmErRFRnQkFqUEJlYjA5dTVPM1U1L0VtZm0xZlE3c3d6cDhSeXlY?=
 =?utf-8?B?Nk16SFpQRk5nSFl0SllIc0FQY2ZETjBHbmxyRE1hSDVHNUxidkVnTU1EdkY3?=
 =?utf-8?B?YmxwengrZUNwUlVaQkNuOVVWUCtXUmR6WDFKSE9LWlZ3OFFzNTB3eWhrck1I?=
 =?utf-8?B?enJubWRObGRHMWtUbG5oMXVtQkk5RFc4allkT1FCd1VjN0ZYbkxjQk93RHAz?=
 =?utf-8?B?NWg4YWYveHExRWUvUmp3U2tRaXJqTjlPNEZBQlY2dkM2RzlaTTAzVnhQR05S?=
 =?utf-8?B?SzZpc1FKRzM0VVQ2Y2FVWC9rS3hGbFlnd2h4eTgzSjFOUitwU2lEVmVUTFlT?=
 =?utf-8?B?UTFUUjUrdG0xV2tpemVCSTA3K1l2Ri9uRWtkQ2p5VC9sV0FVcjNoMi82bkRL?=
 =?utf-8?B?MlNMb3BSaFExb0FmL0hiZkNIdkprdkF3c054aFFLQi9idDNLeFRRQk5IQnB1?=
 =?utf-8?B?Mk1ORjlFSlBzNkNDak44a3hjbnRmUVFTaVV6MWQwQVExdVBsS1psSjdsaVVC?=
 =?utf-8?B?OVFad2tkbmdTVkhYTnZtdXUwbVZ1c0JVS3YzU2ZkRzdGcnNwNHJSQ2YvSlNI?=
 =?utf-8?B?ckY1czA1aG85MlpRRWJjWlpQaTB6bFNMdkI1UDFLVVUvelNOWDFsUlhzcTM2?=
 =?utf-8?B?SlZhMFhNbEY4QVYrQkZrVUJNSDJCcWM4QkJNai8rME1PaERBbVBKbmY0ZXlX?=
 =?utf-8?B?S2tENDI4bzBzUUwvVjJYU2Q0Y2x2anpkczlBeVVLb2RKQW83YVFWdGZnVHUw?=
 =?utf-8?B?NmtMWXdBcUdabnFqYzk3dEhSeG5GWXZVYUUyS3lwZEJjNzZhY21nRXg3aG5U?=
 =?utf-8?B?cHFMazRsaUR3RklsVk1NejFoY2JlbTI0aDcvUWx2c1JKSk5HSFE3NkxKK0V3?=
 =?utf-8?B?V0xpYmp5M0FOenZONlpma1VIM2RXTGxlaGRiS3lPaTZKNy9iZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d96fc4-1c25-46a4-23de-08d886545040
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 15:13:15.6164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bssYNH08EUiD/wYR27sLlxpOTJX2FgtpH/GReTvPbVVgQdJsBtmQZy47Ru2cK9moVcUGIx915/+kkblGKplglQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/10/20 12:59 PM, Greg KH wrote:
> On Tue, Nov 10, 2020 at 12:54:21PM -0500, Andrey Grodzovsky wrote:
>> Hi, back to this after a long context switch for some higher priority stuff.
>>
>> So here I was able eventually to drop all this code and this change here https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Damd-staging-drm-next-device-unplug%26id%3D61852c8a59b4dd89d637693552c73175b9f2ccd6&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C7ae9e5798c7648d6dbb908d885a22c58%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637406278875513811%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=aoFIsBxpLC9tBZw3E%2B8IJlNqFSq6uRgEvvciaZ6B1iw%3D&amp;reserved=0
>> was enough for me. Seems like while device_remove_file can handle the use
>> case where the file and the parent directory already gone,
>> sysfs_remove_group goes down in flames in that case
>> due to kobj->sd being unset on device removal.
> A driver shouldn't ever have to remove individual sysfs groups, the
> driver core/bus logic should do it for them automatically.
>
> And whenever a driver calls a sysfs_* call, that's a hint that something
> is not working properly.



Do you mean that while the driver creates the groups and files explicitly from 
it's different
subsystems it should not explicitly remove each one of them because all of them 
should
be removed at once (and recursively) when the device is being removed ?

Andrey


>
> Also, run your patch above through checkpatch.pl before submitting it :)
>
> thanks,
>
> greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
