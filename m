Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9B3670CD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 19:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5C46E507;
	Wed, 21 Apr 2021 17:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32B6E507
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 17:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dveGMi2tnqc/+VRFLiKrai6pDFdmnb/lbf1WReIeFFz1FQ+2N1i06/HQxehFerVmkqsKgovq9RfIE7JMY3sFNNjB7k/8T1BmMVQO9ugA+Rk1VhRz5KkCHPdgIxi+eVxr0LC4HiCYOvEwV2ad4N4CWmKihFdL4p9pNkNIwoC6w32ADJb/p+12qwVjcvlH4+nZAT9nEKGFN+FiX3w8MZf/YWpo1FoJcr9kMJl4EHQd3ll/i+oqNU5UUPN1z7OIPyN7qZyA2w7NdOl7PDKt3zKwd3jTZgCuXSHFYQEGFpvuZcjd58Wc6ZQiwrPc3iTb1p0c9iV4oVlA4uay1HFa5u1UfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSB4PyZbskhKa3jNjApmZbRJtHrNgBAc7d7k5UjD1n0=;
 b=LrRFVX35hQ1erWCGaiqmDXtNGX77uR2T0o3rZVwWRyGD5mbLj8gkDP6cwD8bFqFSJ7m8anX190NTt0VgQ5I0RhGE8YpajmIOgsisSYjoInDfzhQNbfUVPlNIs8iA+ihg5tpqHE4z7D8bOWvb9+eGEiM9KwUun/sCM5X6sp8sa2DfxB8Td9eOnhQTtprWiunwEN5ahqvzzTGZZsgP/BDIiRRn9CyEiIzY9iyjvNZhuE1uZBKoiUHPt78HuisXCexWwuH5XSr8H9uJkWMLAm3gvhSrkr3ei4djO6cjub7hlRRsymj+XK7dzKTWXDigzW8Tt6AGV8od/g7RN7Pxv9/7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSB4PyZbskhKa3jNjApmZbRJtHrNgBAc7d7k5UjD1n0=;
 b=QLXfuLpusW/b9ayoAwS/0PUtCgxh61z+NZMSfhtcPwhqg8p0Njl+IayWnbuf1u19tEeDx5bpuj1gFNF3M8Jed2b+VMm4uvDFwMcUqBMwbAuM9vlzCKz0zDwf6l9cRuugKK43+NLK+MtHL0lyGlhw638T7NN7eQrye14a0y1iQss=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6430.namprd05.prod.outlook.com (2603:10b6:208:da::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.6; Wed, 21 Apr
 2021 17:00:33 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4065.018; Wed, 21 Apr 2021
 17:00:33 +0000
Subject: Re: [git pull] drm/vmwgfx fixes for 5.12-rc8
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <f7add0a2-162e-3bd2-b1be-344a94f2acbf@vmware.com>
 <CAPM=9twZd-Y6dnx7eQW6paw8BoREnMiPAe5FnBM1sZ-3uPk9YQ@mail.gmail.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <2dea2bb1-ff91-601d-5945-f9974d3f050b@vmware.com>
Date: Wed, 21 Apr 2021 13:00:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAPM=9twZd-Y6dnx7eQW6paw8BoREnMiPAe5FnBM1sZ-3uPk9YQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0352.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::27) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0352.namprd13.prod.outlook.com (2603:10b6:208:2c6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend
 Transport; Wed, 21 Apr 2021 17:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f455ff2-e763-4e22-915b-08d904e6fa0d
X-MS-TrafficTypeDiagnostic: MN2PR05MB6430:
X-Microsoft-Antispam-PRVS: <MN2PR05MB6430DB301605B9DEE332CE6ACE479@MN2PR05MB6430.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxc3hRnh2a/Hip3airB8fpmdXc9n4VnmUheUG+PYnjsQvhB54Htu+dqt5TDNc7CubzPH/hbRPBgUT05a4MnhzWNStbgXXgkRnc6RfEHeg/Uf7CsJzqh7j2R3k/CgFPXsFLVp51EUqUox7u7K/ZpqIXbr/LMxRArjmC3Xf/c/0ddN0ZHi9gZfXM76QrGEmwkBp+ta+1svJam7meVr4HA7+45BHrhFp3fbVCXxnkt8blL9McFnWCNC0pmJKTwGLRXxBvfNs4M02BifRSQumdiZATGrXmJLOEIkEtP3LtAenCdkxVDq28VYKbcZpajmzGmkbLePNLQG9ZTFdKWYljsBSR0t6bVfPtg74+ki21Dqm9Z8cUzhUjJioX6MuniqgMQnJ+MeF3+0Sby4FfarYq8Tlglm92oGc8icGc71fY0kVp+PA5DJjF8lt3WVS9EyS/sfsFcNytWp4kOOUfvJNtJ5cpqZaenmTdUq8c3xcN10xuxukebmAIxXH+F08liENDqa+Dzdf7p2u3VP+867N8n4dlopeMoGC+3RP/9Gt+cCMP5+BcPMq7yCRweFUQQZYD33x8KnUDZZvIYJPM9ndXciX/4nD1hC81Xres8p/CXyI8ppfW7SqzbWzTGO4f/yFhutFpOsMN5ryL8DxBGOwPmFlSnltkp+xYdkgYxJIIXxA5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(186003)(86362001)(53546011)(478600001)(110136005)(316002)(38100700002)(26005)(31686004)(36756003)(8676002)(16576012)(2906002)(6486002)(8936002)(5660300002)(66556008)(66946007)(16526019)(83380400001)(2616005)(956004)(31696002)(66476007)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enRMVFZhTW5YT0dEZ1NIa2wxQ1haTTBvQk1zeGJFbGM2MUk4emFhL3Y5T1Ez?=
 =?utf-8?B?VDhWdnpINDdEaHcvT1NZQ2Frd1l3T1pHNkxITmpDYzByRnpkK01kOVJ4V0Fu?=
 =?utf-8?B?bU9BK0RLblk2a1E2OVpOOXo0d2V6SHJBTnUwU0RzdmlSbDVTT2VheXBYbXBR?=
 =?utf-8?B?eVFWU0ZhOUJpM3VuYitPZGs0SE5PQjBmMWJMNU9MMHZxK0ttVnV2UVdlNmpx?=
 =?utf-8?B?N0Y3d2lYUjVsWVdPZVNOOWo4YzJ1bDduenM3WFJtYk5nT1A4VlV4UHV4b1RC?=
 =?utf-8?B?QlJCT0tNQmg1SkIvVmltbytIcVdlTWpOTWVQcy9xZE9VZC9Uc1BiSG0zamJa?=
 =?utf-8?B?NWFwTTQvSXEzMEE1d0kxTmZRV2pjdHh6bnJGRTdtQTBaajRnaDFQdmFTM1Er?=
 =?utf-8?B?ZXZzcEFIV1NoQS9IaVBQMk1CcDZZaDIyaVhEQ0tZdTE2c0VKS3JSWVYxaHAy?=
 =?utf-8?B?SjRRWG5EWHJHaTBPUGRaN0dWOWhMMVlQOVI4YkZSQmF5dkhUMjVwTVRpUGxQ?=
 =?utf-8?B?M2tvdEIwTGNBM0w3VWZSZmxaaUp3bzV2cEtWcFlXRFZ2V1NnYXZIc0t1dTRI?=
 =?utf-8?B?U2FrZm5tRFY4UWNiN0MyODRVV3pidzFmelVrM0NMWDJuekhNSFZ1dFAwWE92?=
 =?utf-8?B?amNkeDF0MS9WajNTL21WRFJtc0RKMzl0VFNwMXU4bldPelNWMnl3a3F4czRr?=
 =?utf-8?B?d0FLdGRoUG9VRzdKVDlNUlJQeWJHelVabmFwclZBZDA5SVZGV3Mva2VRYVJm?=
 =?utf-8?B?R3AwOTc1MUZzbVN4VzQxbnY2ajJXbnRXakdWcUtDcjJuVjBuNjhOQkFEaVMv?=
 =?utf-8?B?Z0RpaUpEYmxUY3ZXVkEyZGtkVWhsNCtRSDcwR0dXOXJyMjRad21LSk55dy9U?=
 =?utf-8?B?cVZTK2tUYUhBdEtDRm10RmRvYUdtL096K2o1MXpUa3FIdEFRcitVWGpsbHNV?=
 =?utf-8?B?bEt6OTg2eFUwcUV0TWV3TTRPcWVCZTY2aktpTGhMazc4RUFMYUU3ek8yeDk0?=
 =?utf-8?B?YjRGVUlhRXJLYjV3cVdWNXlWbWpZWTlSVW5qTlo2RVhzUjlOSDFRNnQzNmc5?=
 =?utf-8?B?dm84bW41VlM1VEFDZ1RqREduc0FQRStGRW5qVEkzK2VUQVdiRlM1ZnUwdkM2?=
 =?utf-8?B?c0JVcVl2OU1aaUwxVytqcCthNldLRzlzR0VId3pIbHI4d1N0WUJWQWJRZ0x2?=
 =?utf-8?B?ZE5haW91bmpYWlJsS1pEcDcvSnZvV1VGYjlJQ0JaMjV2N3I1d2ZPQjJsd2Nj?=
 =?utf-8?B?bXZsbDVmU2M5TWJoelhvUkd3Rm5VcXBpcStjcUM2NG4reExFeWQ3aUpnSUp6?=
 =?utf-8?B?NnRXZVlkU1pubDBka3R1L1VMSldqTzMvUDdRNlcxeGZqUG12VHJIa212dVBw?=
 =?utf-8?B?d0dZVVhldU1JYWFXM3YraVlDSXN3Nm5wKzJsd2FCYXVCZnRJNit6YWNTQjRV?=
 =?utf-8?B?Wk1HeVhFd0xsa1BjaFIrTWJVS0xQdHFaeXhRT29HUHdxVDNzK1dHYVIzV1dm?=
 =?utf-8?B?dUJ1Y2ZJWm93WmNUdG9FSThSR21PUFUwVHRNTndxWXVTWEdXWHl6ZnBiOER1?=
 =?utf-8?B?RzR4RE55bFIwbTVacnpIU0RvVE1RcVFVQjAwempDZ1NkV3UzMTlJbDFrWlI0?=
 =?utf-8?B?ODhDUFdRMlNrdXJOS0d6ZlUwdkx6QXZ6dGVyUW03R0xsYThPcXhoRUV3SENn?=
 =?utf-8?B?U1k1UTA5all3WHlHUWkxY1NqbU9KQmIwR2hXNVlXQkZRaklLcVlQWlN3VWlO?=
 =?utf-8?Q?kKWxW2HmrhRFINbNzxDkUK0d+bNTny1Qm298eb8?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f455ff2-e763-4e22-915b-08d904e6fa0d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 17:00:33.5367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxWlH/CgwVjvIMkeVKCiDai0dzqq0g71+xVljUBCnmAZa3qz5Ja8NHB0DjU/VbJ8BIcg63i9sEOy5VO5wF32yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6430
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/17/21 7:02 PM, Dave Airlie wrote:
> Hi Zack,
> 
> Please make sure to always cc dri-devel and/or Daniel on these so if
> I'm away they don't get lost, but also so that they make it into
> patchwork for processing.
> 
> If you have a chance can you resend it, I'll see if we can process
> this out of band and get it to Linus before release.
Hi, Dave.

Thank you! I just noticed that you've sent it out. Would you still like me to resend it through dri-devel? The patches all went through dri-devel already, I just assumed that from dri-misc docs that drm-misc-fixes wouldn't be merged again until after 5.13 was out which is why I went directly.

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
