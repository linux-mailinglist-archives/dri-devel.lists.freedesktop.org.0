Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C920231E5B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 14:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3106E4DE;
	Wed, 29 Jul 2020 12:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631456E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 12:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUsTJLEY6YAxk8ALsul6eWuCg4k6mq6Q6iV4UnsQ2Lqb/lwBJQg71l08lAMREE6BNrLm3wphzKtvgsH9btryrr/D410Aogw3ctR3jV1G2RJ7uZgUobs3aX+6OmUT9QFa3AAo47Al+Z9ug88nHpF1AKNdsA83ghF4k+oFafjPYSZ4UVLZdP8p8XoZx0gDn2G7SfDLfmjwP7J8UceWRScj7nS2VCB13xGQ72TovT9UQ9frVEBJ4Y0/0NMA+nwue/vy9jIq/hkyiiDGq4bIFfIZckDI7uTPsxm2dnoZOyJjm8IePC9PLkntW624US5kvvHO8BLzfU0RgBCqvdyLFSURjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgWVbtPVCG1+BUo7Tdnz0L3jgu3Xr9xI+qwnbfIKdYU=;
 b=iYxY0i1Ty9ffDokPjeV68wm/bQN26fO906Bevr5GwBf8iRsuk6yksHSrNih+dHFZmDbwIMJFdn6XXsKxEzPnMQPjMsauqqNUVNd++p/P+PdTTR2DYWsFGYxvQTLmq+NODtIRvZBLXpjQzgDLYoH+9p2l8bKoYnDoqmGpPqqQLHQ3kb70HLl8nml6bTXxJrM241hU6pDWdlirsNZL2yxOotjcFdRloXuKT7reImVA4JHj16KbjRbYXYAUSVLWGNPfjmenG6yT2LVQDwa7ytsTJ+pROZDrFQY6Camf6fMvmyjgm5GNDAaFuD08I0NRMzEaomZW4UIkEQY0NJCsjoi0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgWVbtPVCG1+BUo7Tdnz0L3jgu3Xr9xI+qwnbfIKdYU=;
 b=JTsHfYYESmYVcCtKaeonjE0nw7iUbk2hn/jrKGN+JqeGZVI1aSGaI0chrVuMX4IZZbFXnNw0YKjAyp75wSs/gXsqqIQStJt4jcptCeN0f9n0YyyiMv/dF7EmINHYn4jfrPUR3dAxNpUP9GHXkJs9v2P1ZtAa73dc/9MAg6OnAKw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 12:17:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 12:17:18 +0000
Subject: Re: [PATCH] drm/ttm/nouveau: don't call tt destroy callback on alloc
 failure.
To: Dave Airlie <airlied@gmail.com>
References: <20200728041736.20689-1-airlied@gmail.com>
 <b18a4abf-6a05-7d2f-4c75-3e48396894ae@amd.com>
 <CAPM=9tzz2a3pAY3MkvVS+FCiOxX6WNs2bmooHO0E47i6P4V0JA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7ff77e1b-fee5-c4b3-a3f8-102d6d602a4f@amd.com>
Date: Wed, 29 Jul 2020 14:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzz2a3pAY3MkvVS+FCiOxX6WNs2bmooHO0E47i6P4V0JA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0066.eurprd07.prod.outlook.com
 (2603:10a6:207:4::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0066.eurprd07.prod.outlook.com (2603:10a6:207:4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Wed, 29 Jul 2020 12:17:17 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4faa70d-fc2c-4523-b0ec-08d833b95627
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40489F8A06CDD49CD72CB73783700@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +eABAkKqOHn2l+gt5W4e51SjZBR7ZYPCglZZaO40zjLHYpWLLRfk6JdNbblXDvUXtUEzLtrQpluDPE/jMQd4rDo7pe8Yx7lPlvLV1DFNDhuVju0F+cOUqvGA5vtoUaOn3lPu70xJiDsnhmyCKyZRDF3dGJaZTIo32LJooGic4fIha+nQ6yxOq+iqsWlBVGHRXjwSfcSy65oPAAbXTlYbFeMDWAdZ8r1Nuem9HhT2wS1XFeR9speeVovtwvaVy1Em/Jh+7aUh/n8ZqkxEpxX88UXNO3ltrbUIJRsgvGQhq8zAbB1AfAAR9HZ21+1vG1KJVIy4GFflua5Y921wF2/NElWmv0lIPHtNGsJHR3cKjvqTcYs63NVhR6/VSvKv5v27
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(83380400001)(186003)(478600001)(6486002)(36756003)(16526019)(31696002)(86362001)(54906003)(8676002)(316002)(52116002)(66476007)(66946007)(6666004)(5660300002)(2906002)(4326008)(2616005)(6916009)(8936002)(66556008)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qtB8wY5zzysE3VM2fvwCzlqdKOOr4V4Oxr37Pc+uK5hKzXRRX4r4YGPCjaUWdOZjg6v/xl6L+yFJbO4Jy9DlyOeO3wfT3a9Ed97HzDIImobxHsAKhzgeKLMOJbnr2PKwfjbk8b+fLiDaaO4vfmopz+OH8ZlWJKRZZY61BdW7RtrPQOYS5SPhDWFndQGxh4znDbMgFwmR3ZcYN1y+dl1emTmHmwnY5TivVCfzqud43OZ1U4R4pylCPR1kzQdCTMr2xXyxH75AE1AZ/7bFrFb55DfE8oLewPPSyRFjI9Kaipy8O8R2L8wIzod3zg2K4vT/rWOzwECti+3kCXGc25ZJTeoJW3BEpNY54qD5ZRJIl6x6BF+tmc/1BK+/bL6Hg1Qp3ChcVj5wpdzBFLgBcJQz6UyjfoozvoU4k07yfQrXW1DJsbv7J/LBLjR1Z3tVp3nJvINL9GeqWOJuxNl5nkeVW0VDi8nhCXJEzaiDmf9ejT7jaqQBrtqudySykIOyDeT4z0UguFVXF3OQeUejgpdZ7IyDBQPZgkKiDXllDiqTwiFr5v69RiAf+Z+lMeb2csez
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4faa70d-fc2c-4523-b0ec-08d833b95627
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 12:17:18.2272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dSzwWQNz+U2+xuyJp1Ct6sCzl7RolGSP2V6jLsjLvUqVYyG72TDJOlAnyhJUPgT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.07.20 um 02:08 schrieb Dave Airlie:
> [SNIP]
> Landed this in drm-next as well.

By the way there is another design bug in TTM which only affects 
Nouveau. See ttm_mem_io_reserve_vm() and ttm_mem_io_free_vm().


What happens is that as soon as you have an userspace VM mapping the BO 
ends up on the LRU and a flag noting that so that we don't free the VM 
reference twice.

Additional to that we have a reference count to avoid calling the 
io_mem_reserve and io_mem_free callbacks unbalanced if there are both 
userspace VM mappings and kernel mappings for CPU copies of BOs or 
kmap() etc...


But this design is complete nonsense.

What we need instead is some handling which prevents adding the io_mem 
to the LRU as soon as there are any kernel mappings, because we can't 
restore those using a fault.

I already tried to move the whole handling into Nouveau itself, so that 
we can properly fix this up there. But Ben reported that my only compile 
tested patches don't work and without hardware I can't finish them up.


Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
