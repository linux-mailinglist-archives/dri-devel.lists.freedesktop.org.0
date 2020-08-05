Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22123CA65
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32D46E54C;
	Wed,  5 Aug 2020 11:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760074.outbound.protection.outlook.com [40.107.76.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91746E54C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrZkxyCjYckXy4yhojyGKQhZuOoij28lLR0rUpJmrEaEtJ6OzTGTK35Kk/hKMnivXIQ/GS09belVWgQIb6Ns+8RS3A9NOrElAWQ2eq4JSS58Z8fgJVbNidmcD19au0+KCZvm+Y5rqlsHDkoNTtCyC2Lw/01TG4+Hfj3iRwVo90Q4KFfxCeBYqqOzTJmaAUz73Dii23DfMEaEoIg46xWHjdS4SUN9FDS89eTOwbUFf7cPebP7A8k1mEGK6tQ1PDRPW9SO0RPJHcPApP0FmB7yN7YS7p7ooFQ2R/da/4JoBfAinx1qWo/4cZyIZ5J9MHY41ugMWnTVFxgYiSGBQSA7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4t1DCcmALA6srNfmGImo/tto9ZaH6DqBx7H75jPX30=;
 b=VCc6LhyPN3Bc1VvEppAc9B+VyaSWsqJAvChSDPZ79FM+pbGdGV5fNhQIsZiD0XsMavmfjh8xXaiTdXm950u9EAnE16MJCs2wSu7J9i0BRwlbiPHMt/rOrkFKiOFGPIDOjUPrcgctkPYcfPSHQcu0ZbYmlHQALsZWbLaTsrSOjo576VZ1vBDTldkue4KLo/iZgh6r3eYF8gf5i8XbUhBQP1HW8vN8XhuzoCFsD3tW5UVc3KpXXFfbIOttKD+pC5Hrytb3vMi9uc7uJ6P+9CJqDNkYgn3dp6L2gZulsk16B7gg3bKF/E/IjGFQoG+Y7LBVy5nIzPfKzGSg7eaL7rVvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4t1DCcmALA6srNfmGImo/tto9ZaH6DqBx7H75jPX30=;
 b=kD6dsNLG3R1dw/C9cMImPgxR0yTVjX5VDMxthSH/PC4cWYKXyBm9FOymCj4FfD9K0Qk3veXmbUfjlSBbLgHt+05V7DrGgEAqK4x593gnsl3J+LXV5mljMJ1GqJfG26kTTfxB3g+urcTIf0651+EPbhRupQBolGT86Ox9xrymwf0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 5 Aug
 2020 11:59:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 11:59:40 +0000
Subject: Re: [00/59] ttm misc cleanups, mem refactoring, rename objects. (v2)
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <fdb318d3-9d47-aa94-da9a-6ff303d61156@amd.com>
Message-ID: <a4e44c8f-2d1e-d836-43c7-e2fe9696692c@amd.com>
Date: Wed, 5 Aug 2020 13:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fdb318d3-9d47-aa94-da9a-6ff303d61156@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0035.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:208:ac::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.13 via Frontend Transport; Wed, 5 Aug 2020 11:59:39 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f73044f3-37fb-469e-66bd-08d83937089a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB438991C234142A91BA6C1DE0834B0@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwx16NrpFG6Kfa31O0oK1z8YUI9/jKzGVG0fP6HeWlnynYksUazpAODJIdOwhK2LVaU288xSJBIcWBQamuEFJ/9num5O5wlkYotcq9BKGZB2CWhAX2XRmcmdUdiveOF4Ati0ZfS0X/FuaXcm7JtEfaq1nmT+nlIlgN7nwLypwsnxU/oGTaAAAKPHvY8NGWnAyZwVReV86EtBdeDCVSLn9kq7NZ8PxyjHf6ZAacpEQDYFOuqtlmFTyuGueNmc2V3p5nrgSbXa8QDWok1UScMqOuvak+ImxQsx9jFCNFEk8aClvtQvFzBQmqC+KKhiAATg5VTPxR1wsQFUn3gsWYsp47pDg0g/FA2y4ivw2Tqc/+BLnfw44Dct90Ji8C/v3qim
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(478600001)(31696002)(16526019)(52116002)(6486002)(4326008)(186003)(83380400001)(8936002)(66574015)(2616005)(316002)(6666004)(36756003)(86362001)(5660300002)(8676002)(31686004)(66476007)(66946007)(66556008)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OXBEvNd1F1uIu5OzCZHFsUVraG0Uc0ltwvAauWxuMVZBoey+BE0mv+qOU/y1iuCgfzWB3OIG3EmSRpu/MNki9IOv4L/4CaiyElcaNlk0cjTFKUJiJiAaCUydhKQb69Eu+INJjqJRTqmqF0NGbggWgTOiC1WWvVktu21oTqJdhFdisPGrVQqhvg8jAN7Om1NrNbY3+KLxOJXb8TY7xS/IGgOiIKksOiTDtPmPoDYHk2osunMLHCjMTskgUhIcTG4p95jS7mniLQ+FVW+gya2yG+L10LClfNzMiEcGZ1kEQeTEDeegkcDAw6iqG6BWaOnr3ZYxVWIsIA6HV45LKymv8lAkJR1W4pb7wWr873F4X71Oq6eWBvSISsG5guvhGcz+kwCEsod5n6nLoeyihf3tWfyLrgik7D3tbq2CTrbmBOHyrOcl37+vQcvOEGHPTUX4KKi7LPU/I3FocAtT20UcsMeUm6KAuPl+5OyE8UEp+oSD6bTdhFbY2isbZoIlmwyjkulncm00j2vSBh5QX32CstndMztce6ptLYx/IpdAP0f/uSHs2emgEhwjqD2DhfsIpEc7+fUMEyj4jp3DmLFsW6Ermq6FKL+QaPeZawo3a2H6t8T/UNmwdR8Vt1kGNsWnspyW2GGRKnLLgQ7zdlmEpx1c1xirXipWVs8d2yk3huf/nUJL+DVWsa3HEAsD3jDUxhoXj3HFM81Aq2QaqmAGwQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73044f3-37fb-469e-66bd-08d83937089a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 11:59:40.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRAi8AN0o+/m30KTlZDzORrNbzNnvYXsju1WChn9OICK9iTApe5QP68N8Y+6QMAo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forget what I wrote the -ENOMEM was a type in my local change :)

Sorry for the noise,
Christian.

Am 05.08.20 um 13:55 schrieb Christian K=F6nig:
> Dave, do you have a branch with the latest version somewhere?
>
> I've tested your ttm-refactor-mem-manager branch from fdo today a bit =

> and that pretty quickly results in an -ENOMEM.
>
> Looks like a leak somewhere to me.
>
> Christian.
>
> Am 04.08.20 um 04:55 schrieb Dave Airlie:
>> I've decided to repost the whole queue this time, it has a few driver
>> patches up front that are just cleanups.
>>
>> I've reorodered things a little since the first posting, but not much.
>>
>> misc core/driver cleanups
>> mem type manager debug callback cleanup (reordered)
>> new mem type manager init path
>> new mem type manager cleanup path
>> new wrapper to access managers
>> driver managed mem type allocations
>> cleanup after all of that
>> rename ttm_bo_manager to ttm_range_manager (new)
>> rename ttm_mem_type_manager to ttm_resource_manager (new)
>> rename ttm_mem_reg to ttm_resource (new)
>>
>> I've marked most things with v2 that have changed, again I'd really
>> like to land this in drm-misc sooner rather than later, so it would be
>> good to get driver acks from qxl, vmwgfx and nouveau. (all cc'ed).
>>
>> I've also commented on the list on any outstanding comments from =

>> previous
>> review that I disagree with or need more discussion.
>>
>> Dave.
>>
>>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
