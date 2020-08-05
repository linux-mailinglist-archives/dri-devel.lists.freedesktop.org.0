Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A023CA61
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A8489E2B;
	Wed,  5 Aug 2020 11:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769D889E2B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5JlJgLpE+Ka2FLDUM+sZjPIqXFyI/jctFOPP/lrLzm3qVy73VYABvgqZBORTbSYRJI+b38PYAX9XswppF7qwA7/N9aMF3I6Sr+y3wm/Qa0eF3TvV0E5JSz5bd8YpZGi56we0P11rHCvEU5yy7RNM/T+pwLSk94ONcmQ35+gsHb19fP1sDpgiFKLi6LRNTI4xs1zLZuZ77cj3Fh4r27Ob8neAZ/iUbSooKq7Ovhid7dprROD10CBR+SV9XSnyCdaddAMuBEyY+JiNUzDvW4fRzOKEao9ji2ge+1b7rH8Xv5MTw76bjFCzC7ppUeZK5+i05Wfbd3whSY0csI3/ruzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYyl1p6oBnhIYSgv6O4sMZebDiONvqpgUmiPT4hzzuY=;
 b=E84gBNy03rsw0HfuGdfBUQ/IIwvbVsDDk0EUnjI/KQFdKYi2SZpIU4rtLbhIIh2t43O0TIA99zCzRcZknOeyKOf676xwFzyGiCd8UiAD5Ch1GWjP7NfEzzkCcjoNJ4uMDCxf8xtFd+MQk2FIXxxcL4iHGxjBMkalwu8mzMhrG76EdLhgyBHAIH8L5JA0w9KRm1RB3u6nb02sunAg0xgy8Od71Uohwt3BKT86R6fN+3+Zm3EEYnUWYeAUY1NRZJbWmPlX6IGVutk/MDunigcWH1TiELJS/qK3Q0kE3YVzEv7RP64/g3fi2XUm1PprtDPXwe9oqSHN/Qxep0hVwcjdpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYyl1p6oBnhIYSgv6O4sMZebDiONvqpgUmiPT4hzzuY=;
 b=GPqohhbEWxxx7+2sO3kOjPdatd2SVjI5plHdOxPNiD5a2xqSsNHwpQhIl9U/buNg/K32h7SD7TLtmUOt5Ch6ogqEMnJbG9YmWDFpD1xcrutD0OF0HTxjIG4dZkpEg6KD6URaIv3LaUlqqCFVGwdGP3hP5VQOZy4MGuHHiT7pyUg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 5 Aug
 2020 11:55:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 11:55:51 +0000
Subject: Re: [00/59] ttm misc cleanups, mem refactoring, rename objects. (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fdb318d3-9d47-aa94-da9a-6ff303d61156@amd.com>
Date: Wed, 5 Aug 2020 13:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0148.eurprd05.prod.outlook.com
 (2603:10a6:207:3::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0148.eurprd05.prod.outlook.com (2603:10a6:207:3::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Wed, 5 Aug 2020 11:55:49 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d55c3dc1-9c68-40b7-5eb6-08d839367fd9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4389A2F2DB66E69F55495649834B0@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45ijf+Nc0VANm06/RfrcvbwP8o9+WBkmA9B0EtH6zLxUyeOtmt0poWJh1E5g2tS1AykBo0I8Dfm/cBr8cyXppOce1EEXSQL1jtH42EKbvBakCFcKGWwnniRYO0f2n8YjsSY+R+hWOXuy3pX20mHXbML6SnTnuTzGJkx2vCa1tMZaATalvri6TJ94CT6YSyI4s+kPv5uSRwUokmuzUTK09Gyqp2EiURMFlZP3EhvnTrhLoJ5u1jhfuDtmFNvCKyTjtUJsgXl6Eufe7Wrgm+gfDg4Ppy1Ks0MbXZlSvXLTW9MLf97S87G2hwZDFk2byMG+Paku2VABq6w4nnOvkTlphPnvj4mP4t7ebEZ+9RkuAAAglrX05076Vg9SyVpKh7Xa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(478600001)(31696002)(16526019)(52116002)(6486002)(4326008)(186003)(83380400001)(8936002)(2616005)(316002)(6666004)(36756003)(86362001)(5660300002)(8676002)(31686004)(66476007)(66946007)(66556008)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8dJNeJ/oUYdDUXqpTx6NcqV/qd/oEJyG9eSVG7g/8Wn+L6rDsX84zeWyCMe5eF9c+V0wvxlIVX+KhwrRYp0W04LOrX+E3BVNVXutIK4LXDJt8VKdaMV4+f7yxesBdaQqmCvI7FH9Egn++68ba4EMeCCOt1bGq4IuuSPQtQoEz976EdjAv0VLDAU4PLh78ELGyr3uA/YBcPKXCZKbLzVQLhOMP7AVFrLFrPPmW79b/u6wjRquDQ2T/e6mx3yJ1Vuozl0dEkvnOQI4YdMskIzmjosE1rK5vjsL3U7rD87QPzuOnt8L9yH50rmTnyqjFG2oY+0gCY8MWLbg/G2oh/zyFveMnVPnYIOI4OWTgUM6ojzBXe+g/nFeMFZ9kffgQpHtZsyWM25XduE8RyWXNQ99FPNbfvp8gCoZ6i+39L693L3eXMfUgi1HEQRllGF+y4UnFu4PDOICDfHeDtCQMmE9GJOqUpCJnBQNr5yt934SH+xS+qg7pCnrcpmr3NmQxTPXuothIIPv4UhFc7rexcTHDEbQJ6y+jZtNc/UDj2NqHX4i4i9Rbw5fyknWMA16k9J4IZDBM1VITAy9NEiPhHAlook5fXFUukANTBbk1HhQAZXunKy1D9pCUhuH3Hi1ZA8loWTszKnO09CMstwJQkD6hF56uYDvu8Po5TIEAe3ol/dJlUpdQqcm2vfCgE6MvsTDlgu/SLeWgPgUfHCqF+9aCw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55c3dc1-9c68-40b7-5eb6-08d839367fd9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 11:55:51.2282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKJbWx+tl7c+gBvY7r4zfoCYZCnUToyE2/kwcYFSZhgwyA0jjhndrp0p95ptzjHv
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, do you have a branch with the latest version somewhere?

I've tested your ttm-refactor-mem-manager branch from fdo today a bit 
and that pretty quickly results in an -ENOMEM.

Looks like a leak somewhere to me.

Christian.

Am 04.08.20 um 04:55 schrieb Dave Airlie:
> I've decided to repost the whole queue this time, it has a few driver
> patches up front that are just cleanups.
>
> I've reorodered things a little since the first posting, but not much.
>
> misc core/driver cleanups
> mem type manager debug callback cleanup (reordered)
> new mem type manager init path
> new mem type manager cleanup path
> new wrapper to access managers
> driver managed mem type allocations
> cleanup after all of that
> rename ttm_bo_manager to ttm_range_manager (new)
> rename ttm_mem_type_manager to ttm_resource_manager (new)
> rename ttm_mem_reg to ttm_resource (new)
>
> I've marked most things with v2 that have changed, again I'd really
> like to land this in drm-misc sooner rather than later, so it would be
> good to get driver acks from qxl, vmwgfx and nouveau. (all cc'ed).
>
> I've also commented on the list on any outstanding comments from previous
> review that I disagree with or need more discussion.
>
> Dave.
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
