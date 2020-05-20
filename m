Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8B1DBA0D
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 18:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA7B6E875;
	Wed, 20 May 2020 16:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B36E6E875
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 16:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN9+x7MPLt4FEKtszS1maq8HfvoAaODJHuDJa0w893l479AFJuxHm3AMIRoeH825rT5BKA/K04CTuqwE3W694fCE88fyIxhEFf58H8wH46+UaQY5qDIgyrjIaSIE7d45DsGApYzC8GAi5b2Doa3iwzIOqWer+uFn73wV/XCRDgkjEkHyubaKYUJWLOGAX9/hs+ItcrFdvklsslIzEQlW9eG60hSTNC4WWb4xOwrDTq0YeASpR1HtE1nH3rgraAIodVcQq95DCl9lmFHb8mos0ebnpeh+GhhizBthXkfX3s3YNSnTB4QuiF3gteRXuB2lT4Ru4x35LpV9wqykL0Qg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoF0I06XsQST4gnMxKLpCdOKZiOKXigZuT1tRaK3fTk=;
 b=FwdsinSbCrHeSuZGnfbqAsK/viS78buMmHZIdy7FevLqBAP7mr9Xx0Vc1OARI1SLDdiHXwWixTHovfOwaIfAuf/wrHbMytWNDvo421Q4I84mWxar0tbaYWWGDY1IxzYI2G5k6sPjRCcqI/qqEHpGvKoBgLeF6zS6ip+gqHX4MAnkG/Wxntvz2yMk7gQnFo+FtzLj+HZwpe0c/LXSl6J7cfRNmEPIdNS8pTM8QfPyZmm9Z+2bmRQZ8MCD8js7N2GMnM71Hyc2T5YhPoDPHD6tdyASnR+CpyRIFHV6+K5xHB8fl+5goQF3nWsDAKr+h7xyJWlcJtcS9Jd+nFsAWihStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoF0I06XsQST4gnMxKLpCdOKZiOKXigZuT1tRaK3fTk=;
 b=nLfdLptxyMs/moPpApyZknFukg2Oz4ospOrSL8awOT7TiFcIhfgxWF1a59wP/Cu2XDNPAgs3Kgj9KX3o0KKynhHEKCVh6d39P+XSJgW+zgxZ/LGeemSW9WTeJ9O68zgfyI6ZocLBStOm+t8nFUrl5e57/GTG6m2oG01HyyVt/ts=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Wed, 20 May
 2020 16:46:34 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c%7]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 16:46:34 +0000
Subject: Re: [PATCH 2/2] drm/mm: improve rb_hole_addr rbtree search
To: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
 <20200519084436.91718-2-nirmoy.das@amd.com>
 <158992896210.6082.4915032891292068718@build.alporthouse.com>
 <618a5a19-c2b1-2939-bb51-5df7e158f5f8@amd.com>
 <158999250977.8153.18352421924009419887@build.alporthouse.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <e036bcac-6923-4e41-c19d-903b2b542c36@amd.com>
Date: Wed, 20 May 2020 18:46:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <158999250977.8153.18352421924009419887@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: BN7PR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:408:34::25) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2003:c5:8f22:5e00:cb12:a219:16b8:27a8)
 by BN7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:408:34::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 16:46:34 +0000
X-Originating-IP: [2003:c5:8f22:5e00:cb12:a219:16b8:27a8]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38c1e709-8834-4c91-a1b1-08d7fcdd5b4e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4064:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4064E85A7D65C8B6E5EA12448BB60@MN2PR12MB4064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoDN93UdYDyFWQNLiLd3qtZ57eEFWICJWayGgbCtd1kb4f2wIY9dZ72sJwyVF5BuSRXAQXkWYIqN+pM8XMvqizvbTTU7upOLI9KBDhax3FUREZvD3yZSZjvBz/yE7BRY2nH8/lYLbjLxPULJWbcoCCdGOyHKqHPyOlF/imHulTw6bIaetzI63BgHroW9gsSIQYbM4hWuw7DCS8mvqhzezxxg8M0hqVGjqbQ5d7Mk7sR1fvSIc+WBspvuAyNpnWjkncSHhqk+3EN2cvX0mg0Tyub14HS45T3wxJmtI0YSe8Cva9wMGL755GztI9zxrEM0Ly7xp5a6K3DfuAc9Dy68jmPqvOSzWS0jrozU38qiAC7k227w41lMbhGXuFtSDSissxe60qt1TS6brKyi38gLTVyfB2P79EOIFjrbou6dKNIcf6XYzYPnriyPay8RbvJlylnxSIzBZ/M6EhsqAIO9idfgUBNHJDWmgiyOrbyjknv41Yi81j0T2O0VywFCSeq2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(478600001)(4326008)(6916009)(36756003)(31696002)(316002)(6666004)(66556008)(2616005)(66476007)(66946007)(8936002)(31686004)(6512007)(2906002)(8676002)(186003)(16526019)(6506007)(53546011)(52116002)(5660300002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TeubC4I5cEsqH4uLaIGsHlgqvCUB10Ic6N0vEM9Sxg56mZ9l5b0hDBSuUhO2sAazUsdgkejkQmeMZUm4P+S1Dqu8scsoh8pqTcdGdCbSA4ywpaodXOUT8xe1jbg96x0GTHhMfZMjYo2wJkdQLXLyTXzU+6CWcAe1KiwSusPGWcniJkTHuURCfF/z2CSxloNlj7fh6OQMF3FDnotWiKTiN5y1iaYCx4X08f5u4mwpKmtU6IiN5L64FTpTLkrF+ma/hKdSX6McJlc0q4dn4L5CwU44Gw9Zf9cwmcApGeSIZF3te4WWr7+inKFV9NLX1jY4L5Ro8qz31CkeYfGhCNNndbbJf30J6GxZOb7Y23yHZXxLYai/mBqGzcy5rCa1+t45nj7w1QCTHkIiiPfhwLEyrLxLbHnY+stO950uyrbg571s1Sp0bN819wb7xV+A1a+JdVBVAIXrOyFpKnIGTIXgYbRnKicomHyhh8qF9XZX2uy0JAnoQ2lu5/4vFFFurnsH2TzLU6VzDhituAeunVZAcVDsth7LPhtcANJsH3Jegpg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c1e709-8834-4c91-a1b1-08d7fcdd5b4e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 16:46:34.7675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmXXIiBwski09kReGreg9r0Q6NeTQIOb18GV4Vpl9DexmvJQlW7obxAuQe5UAoHTa9mdR3sGJBe1gEPb+0QTqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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


On 5/20/20 6:35 PM, Chris Wilson wrote:
> Quoting Nirmoy (2020-05-20 17:28:04)
>> Hi Chris,
>>
>> On 5/20/20 12:56 AM, Chris Wilson wrote:
>>> Quoting Nirmoy Das (2020-05-19 09:44:36)
>>>> +#define DRM_MM_ALIGN_SHIFT 6
>>>>    #define HOLE_SIZE(NODE) ((NODE)->hole_size)
>>>>    #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
>>>> +#define HOLE_SIZE_ALIGN(NODE) ((NODE->hole_size << DRM_MM_ALIGN_SHIFT) | \
>>>> +                              ffs(HOLE_ADDR(NODE)))
>>> Fwiw, max hole size of 58b, we would need to stop storing byte
>>> extents...
>>
>> Can you please explain 2nd part of this statement.
> Currently we [i915] use drm_mm with byte-addressing, so 58b is a tad too
> close to the amount we actually need to track. If we used page tracking
> instead of bytes, we regain 12b to play around with. It makes no
> difference to the code at the moment (e.g. we still could not fit within
> u32) so there has been no pressure to rewrite the extents handling. But
> given sufficient reason, we could.
> -Chris


Thanks for the detailed explanation.


Nirmoy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
