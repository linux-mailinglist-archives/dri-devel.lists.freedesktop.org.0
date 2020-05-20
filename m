Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB01DB94A
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 18:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D6789B05;
	Wed, 20 May 2020 16:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9532989B05
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 16:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEdAHd95ySq1CHF9/AcWsCM8ENmrrunjP3Xsi7RBE5ZDOpe5Ws6lyW92JsXq8Iby+uEFF/AfUlVeHwmUJPnnS3x02e5yhTXFt1Ry5dlY+m01HBYBFkURCCcknAALMlLVN21eIKb99TL9uSMhgFqsvMrJzGVrRb0SwKi7wEwaFbPdu8FYhC287yTRs0LyG0UQeZEQz08/4d9ttF8MOu4ifHCih6adGWR4B0pbDC0vWj8/wkA+vwHe/tp6tceNBnAXASeInqy7JOkaCHeNIpRds4L59igI7uzJPdzyAYB9nDnUyVdF5JFFiTRTxLcrZQLrTSU0cM5AsVxZmvzb1Rvt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qyAeOv+9tY6gJE3xv0FAnKWI7TkCSlts1m5pm0gWp4=;
 b=AOe0XMZNA+97MgAjjwWmCjKe68cEzwJYfyYJwTTU/auQcsU+PUgVoMfB/hGkRbLRl3CJuSK1Y9nEoAQvxYCFzi4I3vzJiEOk+2xPfov4J75/sE9DJ4x/eiP3RAgXpMDokzJPx65Ct3YaUDKoU18L+CUpj9yt0OIasf76Uja9pzEILBxpBmY0yLtQV1ZmU6QtkxvdusOI7hIMVBf/lerescuNzzXwr76oiFtH80+2OEx+vhwMkrq/N/oZXrotucE/WorT+Jb+i/gcqNaBOkWyE1LVJm4Oq+DvMOj5i19iCYVtDp8m8C8s+MzLARPbH3Vd5+zOmg1m646s2/1+vBz7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qyAeOv+9tY6gJE3xv0FAnKWI7TkCSlts1m5pm0gWp4=;
 b=KUSQn8sfqqZtsbx09DmHCQSBNLMzf9H6JjWFXdkAATMptTf6vQJMJB06Aui4g6sQe2b00ZBtrqDJ56fzuHJQzhftj3Vjd1WogRrBxV53cDK6b/YFBWHqe0X4skwiVyYr1HOIpUYBj9v3n42S9oCxj1Lh7bRlHoxnfJUn+PsvXKA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3118.namprd12.prod.outlook.com (2603:10b6:208:c6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 16:27:53 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c%7]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 16:27:52 +0000
Subject: Re: [PATCH 2/2] drm/mm: improve rb_hole_addr rbtree search
To: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
 <20200519084436.91718-2-nirmoy.das@amd.com>
 <158992896210.6082.4915032891292068718@build.alporthouse.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <618a5a19-c2b1-2939-bb51-5df7e158f5f8@amd.com>
Date: Wed, 20 May 2020 18:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <158992896210.6082.4915032891292068718@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: BN3PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:400:4::33) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2003:c5:8f22:5e00:cb12:a219:16b8:27a8)
 by BN3PR03CA0115.namprd03.prod.outlook.com (2603:10b6:400:4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend
 Transport; Wed, 20 May 2020 16:27:52 +0000
X-Originating-IP: [2003:c5:8f22:5e00:cb12:a219:16b8:27a8]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aaa0134f-6a57-45e1-98cf-08d7fcdabe99
X-MS-TrafficTypeDiagnostic: MN2PR12MB3118:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3118AE9032E7A43DF947AA208BB60@MN2PR12MB3118.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6BJ0KSQiyh/9XXgDh9JjfChLJyaR8tFOfwR5n+faREQjXsXDDy5bApZ8uPZ9ULtpJACq8asfyD6GppCLvsIVl+JIEK+BJG3vZhXUE7/Qdcp+mDJLtVLflyUKBV5yaIM947pL6VV0eM6U6/qGadmc4fHvo7AT4houJ2Uvb1CHYyMoGBaeoahxQgTgMr/PxFaPTmHF9FTrSrlNZ/djYw8hLzefzl4NOaIShigZrR54OmUQ3asNFQUPqxW7FQVPrId+ZMwUZIUTtztGlmrlO+z/atpi4Wa9RryH8o1HuaXOmW/kPl7jvO9T/iGjDZmMnieaq4kTwS0qaEkpCDaCbFrzdyjE2BOYriNvi9YilLB0b9JnZ6F5aurOZOmawHu2EfP5hx2zz0HHyyDV4CkQoH/S3V9LYJiNCC7vU7Hz5hhGhg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(2616005)(186003)(6506007)(6666004)(5660300002)(31686004)(66476007)(6916009)(66556008)(66946007)(36756003)(478600001)(966005)(53546011)(6486002)(16526019)(2906002)(52116002)(45080400002)(8936002)(8676002)(316002)(4326008)(6512007)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QAOjPSv21fPsJoHmkJUFyHdjnuIWTC8qnB2ejXY4zy5LMBGIWqJN6j0VCMCm6eI93qF8FJm7AU6dbqVATpCeEMT0po1vYk84QOenJrNlhSYv8+TMmCBEOlFR72IXxrIo1TSGl26dFHf6PqAIhMbmakuPFMPlZeKlTxGGiXuB3kL63lf5+RZVeUn/7F2jhcDQMKNnpGIo2mlWbbDiGP4D3un0cWiUnDtpC3DaBplqFbNyDOn+bu/uMYGuoNFl3RKCXaPFglKz0jvpyNiQ6xA+o1MMypLb/QDaaG6rdYmCbCH97TgwcLh2WBQSMhkQDd5QKkN9QTGHR7r+CtAaRk0vg2S54Ar+rxAGjYvsAVo7gu6US9JhbVyFK4aQ6NEU7axHCSBDZUf0VMtBNotp8YOxMusNMylE4o219AvfFJvKFAaBDPg+A8zIM5TgVp0fhdpg0fDhZ3uCeoper8npo0iVcFDZqW7/y8sgVFlQrDqRasa2U2Xj2beN8pCdC3iZ71UpUtpDy0m3S7dzRwWxtu8EZXKvFUhjUQOLdGfmiwnkq+o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa0134f-6a57-45e1-98cf-08d7fcdabe99
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 16:27:52.8371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yEKdOTxQfQWXqMG8C7obJSN/I+6cNVUj3PCuPjrtWfqUieWx3oiAhsj2fhSsTNQNm9brgwlF7eEdYsab1VY+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3118
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

Hi Chris,

On 5/20/20 12:56 AM, Chris Wilson wrote:
> Quoting Nirmoy Das (2020-05-19 09:44:36)
>> +#define DRM_MM_ALIGN_SHIFT 6
>>   #define HOLE_SIZE(NODE) ((NODE)->hole_size)
>>   #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
>> +#define HOLE_SIZE_ALIGN(NODE) ((NODE->hole_size << DRM_MM_ALIGN_SHIFT) | \
>> +                              ffs(HOLE_ADDR(NODE)))
> Fwiw, max hole size of 58b, we would need to stop storing byte
> extents...


Can you please explain 2nd part of this statement.


>>   static struct drm_mm_node *
>> -next_hole_low_addr(struct drm_mm_node *entry, u64 size)
>> +next_hole_low_addr(struct drm_mm_node *entry, u64 size, u64 alignment)
>>   {
>>          struct rb_node *rb_node, *right_rb_node, *parent_rb_node;
>>          struct drm_mm_node *right_node;
>> +       u64 req_align = (size + alignment) << DRM_MM_ALIGN_SHIFT;
>>   
>>          if (!entry)
>>                  return NULL;
>> @@ -513,6 +561,7 @@ next_hole_low_addr(struct drm_mm_node *entry, u64 size)
>>                  right_node = rb_entry(right_rb_node,
>>                                        struct drm_mm_node, rb_hole_addr);
>>                  if ((right_node->subtree_max_hole < size ||
>> +                    right_node->subtree_max_hole_align < req_align ||
> What was the point in storing the packed alignment if we are just
> searching for a hole big enough for (size + alignment)?

Yes, I realized this is not correct :/

Still thinking about a better solution to capture alignment into subtree 
elimination.


Regards,

Nirmoy

> -Chris
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cnirmoy.das%40amd.com%7C1b1ab9c2ca03412daa2108d7fc47d26e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637255257724473951&amp;sdata=gDRvdhwLV1M%2BKLCgpENik52gAB3O0ik1n%2B%2FaZxLgr%2Fk%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
