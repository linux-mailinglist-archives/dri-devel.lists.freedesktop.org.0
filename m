Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765116A346
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB20E6E39B;
	Mon, 24 Feb 2020 09:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62446E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLtc5aLvIO+2AgYx7Tip0Rf1uoDIbnd9EyGN+WGqiL/L3uhuIZMMD2jR+TzNj5xBoOi7siG08Ixc2ibMrDFqEbFEtUng8PGkr/R9wlYKLHSbLD2F1pjFUb5ve7fz8sYgKDvxDrjg9vaC9Q+rX1TjimX2yiU1DoPoCsnBTaLtFA8wq7eH7t6mE9TG7mQUtWgTh5ZjRwHWJUewq+yWgHHrnk4Vtx2W0dC9pWm5T8umZ6TWXstqUivV+bf7StbshKBVhOq+VLVtBbpP/BaWBJHMkVJ6k2REZ/ScnDldWlvs/w48bRW5VpxthnZxszxu3oG2HTlTG5i3+Al39cwwj9cBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVukAn3o6tv5QW2401uT6AIkqPD49XXglZ9D0ODZiIs=;
 b=PaajEUA4FXOM8p0wNb9AJpvvFd6YgB4LtXzWo/dFMz2zXvkgU+xIWGK/IdkV/l99u+sbmVXcAVTqg93dB6DYXAANfyJvCI1IaHBrPfl+QdbMX4EwAzn0vLt8Mt/l0GZ2HFeqaLRtoZ5FRAydVtSdzhc/mNqX7+zsxRjIHzyy2zNgpyYQVullkEpaUXxnNLxqSo3Hl68R8BNXtiViHGqmgo+Z6DuGOLjiYVOk7bNu0jwveo5qGyWFUpekkbQlpNRVwWmLuJY93yX0/kZJd4ipeNPPsWTb6INTjNhwtYj8g0+w+wM7RmB1Ehy+dc1O4yHNftuMdO7/qDAkUitoTUFCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVukAn3o6tv5QW2401uT6AIkqPD49XXglZ9D0ODZiIs=;
 b=C5bnMiyPu7Y0/rqnI9hdCVcjjVAEjjNchg2T96lFo2+wyT0fmSlycPkbBMii4gjErBa3Ch4XqBRos7RhF53V96KqY08iDC/38F6XflYyjp6u9HvUPPrRWbmrydfsW6Wy/GpUUI10PSsbSdo1dlnAHM1BV0k5ZHYcYUYAzlZITLg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB2360.namprd12.prod.outlook.com (2603:10b6:4:bb::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 24 Feb 2020 09:56:44 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:56:44 +0000
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <20200224080418.3cggiohw43afc2hp@sirius.home.kraxel.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <6f9fbc99-ad8b-7bf0-0460-91ac0698d81d@amd.com>
Date: Mon, 24 Feb 2020 10:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200224080418.3cggiohw43afc2hp@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0004.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::17) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.76] (93.229.62.160) by
 AM0PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:208:ab::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Mon, 24 Feb 2020 09:56:43 +0000
X-Originating-IP: [93.229.62.160]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ae70297-e723-4202-50a1-08d7b90fda99
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23606B11A5CDE0C02D3D48798BEC0@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(36756003)(4744005)(6486002)(6916009)(8936002)(2906002)(5660300002)(4326008)(81156014)(8676002)(6666004)(81166006)(956004)(26005)(16526019)(52116002)(66556008)(186003)(478600001)(316002)(53546011)(66476007)(16576012)(2616005)(66946007)(31696002)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2360;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgQar8w4GzrwE+/iKd/EpYZ57yakT9ET2VhwoCVtCyT9/8bSsk6/u5QVjek1SaqiI3+0hFXM8EgdgiqFO4oB97LrCJtPOcrzL+v0YGdGVqs7wq+FUmEjnj09fHU1lHSjvIjvNQlHyhyWpr5b73wSw3ZAC0CwWOUJ2BG573v91JEv8yx8gLPB/5pM3BKtDgkMjaSGe2I9cwX3pfxtO77t/faRYQcXwCR6nb6WbykxzbfQSGPlsfMHUx4/qIaQZm9pQTCjmyFRBNT9ZaFL/nLPqShe9kLzysnAmyAtV5K6KKKBIU/+Ha6JytLphdBPibWjl5nuGukg1Ls9yTK+aU5x8mLczAzq0aQ0kXTxM3eFe6YbjICmYz006c28FReRK3WoRTZ1XzoKHUCzMiwVRxyg620VkyvHIck19fywP8Ej5MDnxNWFNOyLpZeJeEL4Cxd0
X-MS-Exchange-AntiSpam-MessageData: JNFkU1ohROEg8ZQOL0iLgq3q8dHDdn0RgJkdYF7dQUk4KlDBA53V847Zp6sJht0rCIA6ZSA/ZjDLcibm/upDJ0uZaMbkIMpCHjl6+669Rh0gW2oirCpKhYM/EUJYBygYcyPsvw9PhS3I6xotvdiDOg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae70297-e723-4202-50a1-08d7b90fda99
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 09:56:44.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOjJNvNBh/cY0Ulv9BjyCKZozG/Qqxxubv6ySwfUD22PlV7igL5/FNbyAUqKmPCQXVwQ4vYsyOTa/SNYPooFkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/24/20 9:04 AM, Gerd Hoffmann wrote:
>    Hi,
>
>> 2 unfortunately I can't say the same for bochs but it works with this patch
>> series so I think bochs is fine as well.
> bochs needs the offset only to scanout framebuffers, which in turn
> requires framebuffers being pinned to vram.  So all green here.
Thanks for confirming!
>
> cheers,
>    Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
