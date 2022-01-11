Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C332848B177
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 16:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3210EAB2;
	Tue, 11 Jan 2022 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255DD10EAB2;
 Tue, 11 Jan 2022 15:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9xNBoqJqAI0TwM1qUYS34Tdukro7q6lh/3mWbVYmGxg4QOyqsYlcG+2opED+601V3953Y6NhhU2eXzL9cRs+yFnHZhHayMTURJUrMN1uat+j6389Cqzzx0JgdI9R9jnUAT7CNBHBJGXnFNcHspK6odJ+H43T3j1n6Tb2fLT3kw6Rlu0Ht52UUjb+d+96ZGoXFV3ManKkQQd/7pCEfDP1bHj8lMjgbk/lXA9xnwhroEHvvQu1VpzjLIbGhgGieXKE7HfJAdNq2e+sBwqzPctvwdvnBDboOsOsz7kuywRS0CRXq551F3Xsm4g0CQT4uhIK+8d09CgKylTYJhLNkNkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26hSBwCxDvYHu29PdrU2WeYSmfi8e6cZmV+OeWzi8F4=;
 b=aVmcdgVvpe+6zG9DObRNAmOuNQKFG6XckAA7C/o0RIQVimZY+wnucytkAS4s6ZRRNquhzwth/knzibyysnIxYlaw46ueGnkxvxs5Lj7w6WxkMx+XXUbd024x4zH9MXSn1yEGtf/Z5kPNTIN6HExqVCmFF8tWoNrIOv912/nKPt7f4zuUkfSqLWztTw7VroshkPfIAdMGk7qAL043NFzefZaG4uAhaPQofeXuFNJsz1KeHEhnTONDFPI+YmQfVxCEqzw6EqxrOP7HGZR7jQ1moOHWLFWmPk8D0RpO3SzLejYav64TpAWtjPQRUQi5leOuEclBTCNTt7cq3RyHKDkdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26hSBwCxDvYHu29PdrU2WeYSmfi8e6cZmV+OeWzi8F4=;
 b=ED51DO/WwaUWy5YeLIdFxZaDHOD6Dt7MDdhQ9/i7Mh9rqR8w4Xxqza50sUFf0U62R/jtx3OllJvy1/m4U5xiAWsGdpmMx0lPuyAdwqbHpKQYKe11miDYWHOUGmymtkKrk5iEpdgx9YPad9rorux0a0X09a1RFjsxqo0J4yTOyZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 15:58:52 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 15:58:52 +0000
Subject: Re: [Patch v4 23/24] drm/amdkfd: CRIU prepare for svm resume
To: Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-24-rajneesh.bhardwaj@amd.com>
 <8ac68ab1-b9e6-0000-6415-2b6666ae1c4c@amd.com>
 <94adb83b-35dd-3478-909e-9f8ea77e5657@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <5b020dcf-e1f9-6c38-1d83-f56024ab9a27@amd.com>
Date: Tue, 11 Jan 2022 10:58:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <94adb83b-35dd-3478-909e-9f8ea77e5657@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:610:b1::11) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d046ac-3269-4740-fc35-08d9d51b4358
X-MS-TrafficTypeDiagnostic: DM4PR12MB5391:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB53918BBEA2962F7B2E4B9061E6519@DM4PR12MB5391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72SoHtAIDL0OnQ1OJ7yXQj6AKLB7aCs2L5NXyrOj3lWdbKlZCenlkDM6GCUqbslj+f4385K8GOF0YgkjLwLap9EqF50UevX4sPpiYdQi+wq/ByXp9Zxz4v9cq5arMW6tXw8Wb3lDy37G0KvVR+ecGfRjzjnm6RRrMo7IUEScJpM60c60zCdOb4M3Ss0ilI8f3FqTb4tocb/JSLfOLxcvxP9ShAlI/5ADKUdnFj4n8T5WWDfu90bGZkTEeQeN9apP831NiwYYeRTTm9zzQqT4Btp9oOpIdTDMHYvSUeCzMHIwwM3Dobl2Iu7WAxLnxW/x7CrmNypEU/UUYCZn28Z7ELnXpy7zQf+5J5Cjl5ywCvCoyiqAA3e73T0eu9N2fYxyGxeK95lzFrxxnT0fW3dDOr+8DyNRzHIufibwuGnIKhgxyEKmy2hmsZXx0kTBTkqDYX3g/V3kWWkYzt2c2pe8oQ4o5JLikfz20m4d/vmtI6uIUccRYM6CJYxV1WOUmFl5OyVq+cB9Z8ZDhlLLmLKA/touZR2Bpg4GuQKm2QQ03asXiDZ0f9GUVW9E8v2oPyrA8YA+NoZP5fP3dHCqwSuoB4Q2cZ9mBsfSLtfgw2aheG0VfW54jbuS3DpbeNaHHSsetg3VTgg88E7PQxluRZac9Fbp1tinQOwlQ5doNjIK04DeFeqxDdx9kKLTWnTZA1OEPRb+YHbsQ+0Pc2PZEslawYOfEsNMYZ/GVFREMeS3Hdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4001150100001)(6512007)(83380400001)(31686004)(36756003)(2906002)(508600001)(5660300002)(26005)(4326008)(53546011)(110136005)(6486002)(316002)(66556008)(38100700002)(8676002)(66476007)(31696002)(186003)(6506007)(2616005)(8936002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWtLaTNSSGg3WjgzMWJOVldrbFdGRWdSZnowWFZqRDVTUStGWjVPMUdqcEpS?=
 =?utf-8?B?Y0FxTUFXZ3U3cDJoUFVhYnhmeEJJY2dqQWd3TTZMVi9Nd2IyQlVzY2ZOU0N6?=
 =?utf-8?B?VXE5REh4NkVmNTNwckcrN3prakV6MHdCY3hWMzBGZjlwSlhvdDdmUk5rU0ZY?=
 =?utf-8?B?UTdlWDVwNTY2VDlTMTkzN1JDWGpvLzg3a1lGZXpYdHZMNWdOYzRRYmMrYjdz?=
 =?utf-8?B?aU5KQmVjRWtvdVRpNnhlb3ROWGo0T3ZYRENKL1VSREJ2Sk41WjJKUW5kK2Vr?=
 =?utf-8?B?RWptUC9JalBUYjVXTUg4SVlTV2I3UWRreHo0TXMwQUZZVlJwV2pxNzJrSGFh?=
 =?utf-8?B?VStjZmh5Z0RNaFIvU2Nlc3lDK3BMeDNOdG5KVHFnZmpmMU1zd3RKWWpoMER2?=
 =?utf-8?B?WWxUYVByYVFkMnFLREpINjE0MzgrclhVUWY2QmU1Ymg1QkdtYWhzTEZDN0pp?=
 =?utf-8?B?OVVNa3F5N3NDQVk2QnVFMk9YbmlSTzFHc2tpbURUQVZwcGxFUDJQVlVNVG93?=
 =?utf-8?B?azVqVFFyS0dtQnpON1dmWEJPNWQxblBKYmI4TWdpb2NTMzJyWjUvaUJUUktQ?=
 =?utf-8?B?TUJieFZPdmIrcUhEdDV6Vk0rYWlSQmVEczB2TUc0S0VRZ0l4c1FoVzRKSURL?=
 =?utf-8?B?czRiTW1qTjdNaGUydDY1b21hcjFDaTB3WlJ4bkdhdndxZEJCVWcxcldyaU5s?=
 =?utf-8?B?bVBqQVorNDlsRUR3YWRpNTZMVmxwVXU0c3Y3K2svZkhob1BGVzZjNnBVWmNh?=
 =?utf-8?B?N2FaR0xGaHJSRW9aOXhKYXA4c2hSSGZicTRtOVIwTjMza1N0dlR0aG9mQWww?=
 =?utf-8?B?SU9ib0Zwd3BnVytweHBySVFMcEFwbVJzdnZCc1J5ZWp6eGczWUZEekRxcHky?=
 =?utf-8?B?Q0FLWlRXRVRUYWNQWHFaTDdRUDkxL0NXc0FWTGp1SXExb04rckR5cmN3cE5q?=
 =?utf-8?B?OWJEazJxMGVYM0VuSm9vQUsxRzY2eUpCa0tCampsZk5GRlVFcGpDK2t5ODMx?=
 =?utf-8?B?bitYdHFNT3J2NklhdFJUaUZmMVY4Q09SNFpuR2NLeFVwL3NuR0Y1NmJlVmsr?=
 =?utf-8?B?ODF2Q3RWYkNud0d4YUFYRFZPeUt2TEhEa0lnR2dkT1JPM2ZBQVN0MlowUEZC?=
 =?utf-8?B?NHVSKzhSREJva1Uza3dCNnBBNklScjUvTVJxQ0VCTTZXS0xseWhqR3lTL0ZE?=
 =?utf-8?B?U2dlSFRXSnpmZXIycHYxanlNUHBpb1J6QzA4WFhsVlM4QW1ZL0YzdVlhUE5q?=
 =?utf-8?B?VFJQQmhuSXJ3MXhHdmFialoxNUpncWFHR2ZUaFhxSHFsb0ZadzR1dWNEQ2p0?=
 =?utf-8?B?M3VJakRZdWd2SFZlVWpOMlNpVFQyVWNSdC9tN1Y0aytaWkhWOXJCY2JjaGdI?=
 =?utf-8?B?RUFYQU8zMk1YSTBWYjExc2ttcXVjdTZuaTN4QU5hQUV1R2RCekVHalkrTGZX?=
 =?utf-8?B?dE1xOGFqMXBNMitNNVhqeEFqZ1dqWmx2dFF0MkFNQitOeWFRVk82MFY2c1lT?=
 =?utf-8?B?M2ttQXgvVy9HSXJ5VWhvMWs0bloxUzIyam5JMDdvZ1pMQUNQMTlmbWZBdHpO?=
 =?utf-8?B?ekhXNldkSkdudFhod2RQWWRUR3U4aEpmd2ViY0Y4SVgzenRFSXdlMTY3NE5p?=
 =?utf-8?B?QUhnenVMMlhRcTBDSkRzRTFLdHB5RXFIM3M1bks2ZHpvRThKMlRoZTJaTDdH?=
 =?utf-8?B?dTFXTUhMb1RVUmZMMGFZM0hPdXZjcXFwaTVKN2s3NkFjbmpyc0k4MkRHYnd4?=
 =?utf-8?B?dHlZTnk2RXFYSXhONXo5aC9mWDZRRWhLdytpWGYrNDY4TlBqYWc1Wi85dWFT?=
 =?utf-8?B?dTFZV01ZdCtSb1k2NjN0Nm9McmlVK2JxZUY0Y3JUSzVEak9XQ20yclVMeDRW?=
 =?utf-8?B?U2ViR1p4b29OYkkrd0hyUzJRc3F5Y1NBR05QMDZ5M1JyUVdPYWl0cUdkRnFp?=
 =?utf-8?B?ZGNseWNOTllucGJKQVRrcmdXUndTeXg2cmptdDFzY0VxTEh2c1VZWkVyYU95?=
 =?utf-8?B?UDlFL0VkTytoNTZPTjREamllR1krYWpYUEVMUTExeXdCRDRBenF4cjJta0Fn?=
 =?utf-8?B?VXk4bURVQ1ZyNWJ5MHBWZ3BJeHFXOFJpdFhxTElnZ3Rib055UmJYS2oxbW52?=
 =?utf-8?Q?70O8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d046ac-3269-4740-fc35-08d9d51b4358
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 15:58:52.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpRek1ozBC6nozcEl+gc9ZVi3KrkFUqqEJnM98PPGAdzODVdqT/4xHZjz9o/CrDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-01-10 6:58 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:94adb83b-35dd-3478-909e-9f8ea77e5657@amd.com">On
      2022-01-05 9:43 a.m., philip yang wrote:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 2021-12-22 7:37 p.m., Rajneesh Bhardwaj wrote:
        <br>
        <blockquote type="cite">During CRIU restore phase, the VMAs for
          the virtual address ranges are
          <br>
          not at their final location yet so in this stage, only cache
          the data
          <br>
          required to successfully resume the svm ranges during an
          imminent CRIU
          <br>
          resume phase.
          <br>
          <br>
          Signed-off-by: Rajneesh
          Bhardwaj<a class="moz-txt-link-rfc2396E" href="mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |&nbsp; 4 +-
          <br>
          &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_priv.h&nbsp;&nbsp;&nbsp; |&nbsp; 5 ++
          <br>
          &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_svm.c&nbsp;&nbsp;&nbsp;&nbsp; | 99
          ++++++++++++++++++++++++
          <br>
          &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_svm.h&nbsp;&nbsp;&nbsp;&nbsp; | 12 +++
          <br>
          &nbsp; 4 files changed, 118 insertions(+), 2 deletions(-)
          <br>
          <br>
          diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          <br>
          index 916b8d000317..f7aa15b18f95 100644
          <br>
          --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          <br>
          +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          <br>
          @@ -2638,8 +2638,8 @@ static int criu_restore_objects(struct
          file *filep,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case KFD_CRIU_OBJECT_TYPE_SVM_RANGE:
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* TODO: Implement SVM range */
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *priv_offset += sizeof(struct
          kfd_criu_svm_range_priv_data);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = kfd_criu_restore_svm(p, (uint8_t __user
          *)args-&gt;priv_data,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv_offset,
          max_priv_data_size);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
          <br>
          diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          <br>
          index 87eb6739a78e..92191c541c29 100644
          <br>
          --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          <br>
          +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          <br>
          @@ -790,6 +790,7 @@ struct svm_range_list {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct work_struct&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deferred_list_work;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deferred_range_list;
          <br>
          +&nbsp;&nbsp;&nbsp; struct list_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; criu_svm_metadata_list;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spinlock_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deferred_list_lock;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evicted_ranges;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drain_pagefaults;
          <br>
          @@ -1148,6 +1149,10 @@ int kfd_criu_restore_event(struct file
          *devkfd,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t __user *user_priv_data,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *priv_data_offset,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t max_priv_data_size);
          <br>
          +int kfd_criu_restore_svm(struct kfd_process *p,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t __user *user_priv_data,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *priv_data_offset,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t max_priv_data_size);
          <br>
          &nbsp; /* CRIU - End */
          <br>
          &nbsp; &nbsp; /* Queue Context Management */
          <br>
          diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
          b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
          <br>
          index 6d59f1bedcf2..e9f6c63c2a26 100644
          <br>
          --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
          <br>
          +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
          <br>
          @@ -45,6 +45,14 @@
          <br>
          &nbsp;&nbsp; */
          <br>
          &nbsp; #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING&nbsp;&nbsp;&nbsp; 2000
          <br>
          &nbsp; +struct criu_svm_metadata {
          <br>
          +&nbsp;&nbsp;&nbsp; struct list_head list;
          <br>
          +&nbsp;&nbsp;&nbsp; __u64 start_addr;
          <br>
          +&nbsp;&nbsp;&nbsp; __u64 size;
          <br>
          +&nbsp;&nbsp;&nbsp; /* Variable length array of attributes */
          <br>
          +&nbsp;&nbsp;&nbsp; struct kfd_ioctl_svm_attribute attrs[0];
          <br>
          +};
          <br>
        </blockquote>
        This data structure is struct kfd_criu_svm_range_priv_data plus
        list_head, maybe you can add list_head to struct
        kfd_criu_svm_range_priv_data and remove this new data structure,
        then you can remove extra kzalloc, kfree for each svm object
        resume and function svm_criu_prepare_for_resume could be
        removed. </blockquote>
      <br>
      Adding list_head to the private structure is a bad idea, because
      that structure is copied to/from user mode. Kernel mode pointers
      should not be exposed to user mode, even in an opaque structure.
      That's just begging for an exploit.
      <br>
      <br>
      But you could define criu_svm_metadata as
      <br>
      <br>
      struct criu_svm_metadata {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;struct list_head list;
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;kfd_criu_svm_range_priv_data data;
      <br>
      };
      <br>
      <br>
      Then copy_from_user directly into criu_svm_md-&gt;data in
      kfd_criu_restore_svm to avoid the double allocation.
      <br>
      <br>
    </blockquote>
    <p>This is better, don't increase struct
      kfd_criu_svm_range_priv_data size which copy_to/from_user, and
      remove extra kzalloc/kfree.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:94adb83b-35dd-3478-909e-9f8ea77e5657@amd.com">Regards,
      <br>
      &nbsp; Felix
      <br>
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">+
          <br>
          &nbsp; static void svm_range_evict_svm_bo_worker(struct work_struct
          *work);
          <br>
          &nbsp; static bool
          <br>
          &nbsp; svm_range_cpu_invalidate_pagetables(struct
          mmu_interval_notifier *mni,
          <br>
          @@ -2753,6 +2761,7 @@ int svm_range_list_init(struct
          kfd_process *p)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_DELAYED_WORK(&amp;svms-&gt;restore_work,
          svm_range_restore_work);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;svms-&gt;deferred_list_work,
          svm_range_deferred_list_work);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;svms-&gt;deferred_range_list);
          <br>
          +&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;svms-&gt;criu_svm_metadata_list);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_init(&amp;svms-&gt;deferred_list_lock);
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; p-&gt;n_pdds; i++)
          <br>
          @@ -3418,6 +3427,96 @@ svm_range_get_attr(struct kfd_process
          *p, struct mm_struct *mm,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
          <br>
          &nbsp; }
          <br>
          &nbsp; +int svm_criu_prepare_for_resume(struct kfd_process *p,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kfd_criu_svm_range_priv_data
          *svm_priv)
          <br>
          +{
          <br>
          +&nbsp;&nbsp;&nbsp; int nattr_common = 4, nattr_accessibility = 1;
          <br>
          +&nbsp;&nbsp;&nbsp; struct criu_svm_metadata *criu_svm_md = NULL;
          <br>
          +&nbsp;&nbsp;&nbsp; uint64_t svm_attrs_size, svm_object_md_size;
          <br>
          +&nbsp;&nbsp;&nbsp; struct svm_range_list *svms = &amp;p-&gt;svms;
          <br>
          +&nbsp;&nbsp;&nbsp; int num_devices = p-&gt;n_pdds;
          <br>
          +&nbsp;&nbsp;&nbsp; int i, ret = 0;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; svm_attrs_size = sizeof(struct kfd_ioctl_svm_attribute) *
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (nattr_common + nattr_accessibility * num_devices);
          <br>
          +&nbsp;&nbsp;&nbsp; svm_object_md_size = sizeof(struct criu_svm_metadata) +
          svm_attrs_size;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; criu_svm_md = kzalloc(svm_object_md_size, GFP_KERNEL);
          <br>
          +&nbsp;&nbsp;&nbsp; if (!criu_svm_md) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;failed to allocate memory to store svm
          metadata\n&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -ENOMEM;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; criu_svm_md-&gt;start_addr = svm_priv-&gt;start_addr;
          <br>
          +&nbsp;&nbsp;&nbsp; criu_svm_md-&gt;size = svm_priv-&gt;size;
          <br>
          +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; svm_attrs_size; i++)
          <br>
        </blockquote>
        <br>
        for (i = 0; i &lt; nattr_common + nattr_accessibility *
        num_devices ; i++)
        <br>
        <br>
        This function and for loop is not needed if you remove struct
        criu_svm_metadata.
        <br>
        <br>
        Regards,
        <br>
        <br>
        Philip
        <br>
        <br>
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp; {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; criu_svm_md-&gt;attrs[i].type =
          svm_priv-&gt;attrs[i].type;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; criu_svm_md-&gt;attrs[i].value =
          svm_priv-&gt;attrs[i].value;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; list_add_tail(&amp;criu_svm_md-&gt;list,
          &amp;svms-&gt;criu_svm_metadata_list);
          <br>
          +
          <br>
          +
          <br>
          +exit:
          <br>
          +&nbsp;&nbsp;&nbsp; return ret;
          <br>
          +}
          <br>
          +
          <br>
          +int kfd_criu_restore_svm(struct kfd_process *p,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t __user *user_priv_ptr,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *priv_data_offset,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t max_priv_data_size)
          <br>
          +{
          <br>
          +&nbsp;&nbsp;&nbsp; uint64_t total_size, accessibility_size,
          common_attr_size;
          <br>
          +&nbsp;&nbsp;&nbsp; struct kfd_criu_svm_range_priv_data *svm_priv = NULL;
          <br>
          +&nbsp;&nbsp;&nbsp; int nattr_common = 4, naatr_accessibility = 1;
          <br>
          +&nbsp;&nbsp;&nbsp; uint32_t num_devices;
          <br>
          +&nbsp;&nbsp;&nbsp; int ret = 0;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; num_devices = p-&gt;n_pdds;
          <br>
          +&nbsp;&nbsp;&nbsp; /* Handle one SVM range object at a time, also the number
          of gpus are
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * assumed to be same on the restore node, checking must
          be done while
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * evaluating the topology earlier */
          <br>
          +&nbsp;&nbsp;&nbsp; common_attr_size = sizeof(struct kfd_ioctl_svm_attribute)
          *
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nattr_common;
          <br>
          +&nbsp;&nbsp;&nbsp; accessibility_size = sizeof(struct
          kfd_ioctl_svm_attribute) *
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; naatr_accessibility * num_devices;
          <br>
          +&nbsp;&nbsp;&nbsp; total_size = sizeof(struct kfd_criu_svm_range_priv_data)
          +
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; common_attr_size + accessibility_size;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; svm_priv = kvzalloc(total_size, GFP_KERNEL);
          <br>
          +&nbsp;&nbsp;&nbsp; if (!svm_priv)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; if (*priv_data_offset + total_size &gt;
          max_priv_data_size) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EINVAL;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; ret = copy_from_user(svm_priv, user_priv_ptr +
          *priv_data_offset,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_size);
          <br>
          +&nbsp;&nbsp;&nbsp; if (ret) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EFAULT;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +&nbsp;&nbsp;&nbsp; *priv_data_offset += total_size;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; ret = svm_criu_prepare_for_resume(p, svm_priv);
          <br>
          +&nbsp;&nbsp;&nbsp; if (ret) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EFAULT;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;svm_criu_prepare_for_resume failed\n&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          +
          <br>
          +exit:
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; kvfree(svm_priv);
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; return ret;
          <br>
          +}
          <br>
          +
          <br>
          &nbsp; int svm_range_get_info(struct kfd_process *p, uint32_t
          *num_svm_ranges,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *svm_priv_data_size)
          <br>
          &nbsp; {
          <br>
          diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
          b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
          <br>
          index b00576db5baa..e0c0853f085c 100644
          <br>
          --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
          <br>
          +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
          <br>
          @@ -191,6 +191,10 @@ int svm_range_get_info(struct kfd_process
          *p, uint32_t *num_svm_ranges,
          <br>
          &nbsp; int kfd_criu_checkpoint_svm(struct kfd_process *p,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t __user *user_priv_data,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *priv_offset);
          <br>
          +int kfd_criu_restore_svm(struct kfd_process *p,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t __user *user_priv_ptr,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *priv_data_offset,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t max_priv_data_size);
          <br>
          &nbsp; struct kfd_process_device *
          <br>
          &nbsp; svm_range_get_pdd_by_adev(struct svm_range *prange, struct
          amdgpu_device *adev);
          <br>
          &nbsp; void svm_range_list_lock_and_flush_work(struct
          svm_range_list *svms, struct mm_struct *mm);
          <br>
          @@ -244,6 +248,14 @@ static inline int
          kfd_criu_checkpoint_svm(struct kfd_process *p,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
          <br>
          &nbsp; }
          <br>
          &nbsp; +static inline int kfd_criu_restore_svm(struct kfd_process
          *p,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t __user *user_priv_ptr,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *priv_data_offset,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t max_priv_data_size)
          <br>
          +{
          <br>
          +&nbsp;&nbsp;&nbsp; return -EINVAL;
          <br>
          +}
          <br>
          +
          <br>
          &nbsp; #define KFD_IS_SVM_API_SUPPORTED(dev) false
          <br>
          &nbsp; &nbsp; #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>
