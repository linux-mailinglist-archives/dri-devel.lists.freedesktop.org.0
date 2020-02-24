Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A187E16A300
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26B66E364;
	Mon, 24 Feb 2020 09:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A96E364
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghb3zUkPnq6armzsB8WpJjMbO2WRFjWcMHUbiA7+5V5OUIEkg15bm5WiQApwpAYgxP8FhUdFokm2Y7ZPbrDShUhEEORyB3R4E6mK6BUcPlbfUr/QRP4OYolJqFB3kxiRNSaswYu1To5mgGbPnlfSi/ZAXY2KbwLEwjSQg/A3Qnro01NcSIfpkCS3p+7uYrIBMGCpnf+YeqOeCT5BowaBMAMcxcZSUmCSOftchCA3yzdgZt08GFBKyEb8I3ppKxuqNb9vCfoD0NkrbA6uPn/HhDzc+lJ0LBOGR4xNHCt4FNqazF+YuSGoFKV2ANJ/cvWrk+yxVazfie7GDn2DWHHMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wytv3tR1PtPSqqJ7yA34SSvObK+Ia7TJiVFxX5QZfJA=;
 b=b7vVFSUPDi0fad6lOtLManYXVPouZoUwHeplSxa5rMetTPUFKJXJLel86IRvfWCp7qWWnCSRvNIYoUTQO/9StiQ2uGtQREZmWA8QofUEdq4BOL/6h4hVdlMe9RVv9CS5MYFNjsxrxFVyl0nvIt1/S48Di7yV/p9Ps2Qro1GjHwEL1YH61co2L+DbnbOB0dp6yqt32rP0o6/mSt9v1t01agxGJinNYp/HaYddNzlPaU232Co1tGWfKTPYUPUnlHqn2zibX8tO4fSCQpuPWuaRu2z+DaRBHtIxJwOLVHYS3Yqg3uzVHzqp8U0UN0n6odwyU2tsuk/FscpL/fa7MYH7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wytv3tR1PtPSqqJ7yA34SSvObK+Ia7TJiVFxX5QZfJA=;
 b=ExfV6Vv9+bFxE7RVf/CvxuKHi8queY67e11gZVoP1Uz1iDgIRZLqeMyiACUsTE8TXjxdymhGRqXy6GX9mYmAoqR2ki9Q2cI9as7nS8U/vfrhesY6HoXCCoIkNKaNVqW58sn5rg1eoyvPsqu0keSNR0w9eYd8fA3fgSSvMDzSp1I=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB2360.namprd12.prod.outlook.com (2603:10b6:4:bb::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 24 Feb 2020 09:49:46 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:49:46 +0000
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-7-nirmoy.das@amd.com>
 <20200224080129.uebrxirglfl7ai6t@sirius.home.kraxel.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <8a5e098d-9803-abce-1e5f-14697320516f@amd.com>
Date: Mon, 24 Feb 2020 10:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200224080129.uebrxirglfl7ai6t@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::37) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.76] (93.229.62.160) by
 AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Mon, 24 Feb 2020 09:49:45 +0000
X-Originating-IP: [93.229.62.160]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e2855e0-577a-4603-317e-08d7b90ee166
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:
X-Microsoft-Antispam-PRVS: <DM5PR12MB236062F5416F775580577D508BEC0@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(52116002)(66556008)(186003)(956004)(16526019)(26005)(66946007)(16576012)(2616005)(31696002)(31686004)(316002)(478600001)(53546011)(66476007)(966005)(8936002)(6916009)(2906002)(36756003)(6486002)(4744005)(8676002)(81156014)(6666004)(81166006)(5660300002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2360;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTC4HLic7kYH2fhGDbU8dGnIrXptJeJZf3tluKz9PDULb9l66AyOIFi2uST0DX9dssjtjnIKRtT5bTAwDQEU3Lj9mvVptqFGT8MTmg4EvhZ66rWUFyMNhHgMls+f7gol3zjx5KVqdOwOvhq/m7bQkCx//jTZo/wZNfZKTE9tv/XKVPWrDIGV2DfQ+WExJfe+y1XoHMNMk1JpSGLqo6SfqDLOx9PHOpoA2VhnPIXhFxNhRdOIpQCRDBDPj/2dXSQKToJ5AbTL1nu8tPVGL1GxQERCD/1DO82in1/a1URdOGNqbjSOq0Am7q1/z9jJb+bMlurLKTeT8LAdVarVhtNVJCQmp1XonA7mkF0t5UsVU6N/FpWUMwmDaJse0S9yFs5lbH0OaBb+qN0Ctyy0Mq/GI0cOMbkyEYzffmMnIYV7k+NOPAPnB30oz9dkT35tPQV2Dyuyg4gKlyU/gFTHeiugd5DKaH2lAm/xmtIS08RYSuAnDGA+nuMr1Jif2OhMEuwOOMRdMELHalYUZFt9G6LhICUHADl/bM7M304Y0M/pxx8X6FMTjFhkL1ukSfGlgxhrB3ekjEjBhDWIKx6wq47C5g==
X-MS-Exchange-AntiSpam-MessageData: zIplrz0kJUedOcshOAB6k4O5RIRYN8ypg0M5Vs7G4Eg3NpVmBlATKI7rymA+ragWNAhW2ktRIWg5QLhr9iDpvfyKjFUdoTjTUrfnDjlU/jELL5LJg6z5qEPGgjVlErF1BzKicQC0SCl2OluuBecm6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2855e0-577a-4603-317e-08d7b90ee166
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 09:49:46.0475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgJVQHWsYrulqlfUFO3s+SEbjpubKWrODUvW5Kb35jrBkepEvzmjB+5zgl15sih2JYcHyz3fT1NaVDmeCh1qvA==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

This is old one can you please review v3 
https://lists.freedesktop.org/archives/dri-devel/2020-February/255760.html


Regards,

Nirmoy

On 2/24/20 9:01 AM, Gerd Hoffmann wrote:
> On Mon, Feb 17, 2020 at 04:04:25PM +0100, Nirmoy Das wrote:
>> Calculate GPU offset within vram-helper without depending on
>> bo->offset
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
