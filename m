Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9475D001
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4110E6DB;
	Fri, 21 Jul 2023 16:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134EC10E6E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:49:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbuZ91tl88oWcVyxmHzQcMcXrOn8BuUKoKeAcx+HCoy372myHqd5hKWA1aUHGbzM6vp2bHefKQR1tCc6XoDP0HQdVnKSQvfGtT3quEFTA1+O35RtoorAKd8cy6um0d18Ncz68h/tS4XyQ3sKqBNdhyDltXTFNnmy1f6OmfGqdPBRAw0kwRJhraRpPWtySNPcMhkwu9hAWEr/855CMO2hFol/Do2btBiEnAvzQIiE8yls+4bBD43oRkMZafDS62R/+jfHbyNwm3zhHTGdE3QX2X8txQjRJrPvLK1sc8K/vSeJIhr4EWd2DTRc0tcLq5ELazt6UHYsRQsP7+zZPs1gSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W4nz04lBe0fqPAOFQH59hmwGSxL4vTN94Ej4lPBvAE=;
 b=NCrVYrxADrHE8Lz92nd3d/z2wV0KCa8GuWWaLYJwoBsy8nBsP9Mby8Ndv9GlViFQd2Rw28sUFUmQEtfrDdGkfrjcHEH/wzAEEC9rQSUnSTfXcYIuUBxACWGO/rcpOweFc6v4h1QM5b6GUclFtVr4TexFzKj1OYQ/Qbwd99gJUu03gHyqm7Nc5Bp3CoOnODFDgHX6IpHLbKNs6WEYX6p1qh0cRDlUHESBjJMRAmsadUuStMeq5o5UdvpPKPMu03GCIqV+IXxa1xIdBg7qLVJfTZ/atyMWjMR2nR1NzdpUuZY0WZ3jxnJuKBdvArum0DJoCu29tAnSgZIKixHMkDwiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W4nz04lBe0fqPAOFQH59hmwGSxL4vTN94Ej4lPBvAE=;
 b=FtExlYkM5bg4/0+UW9LqLzEB1DEqoz3pYxLTBjzr8z87RtKIQWkF5AJB8yxYnL8iGlRbYfooTz1N9VWVYt0GcanL9ucw9dwLKMdyVgmrppPYi3qf7/nxqWygvZG2/CoN+bIw3Oqj69pa12pj9ulL5PaOSR0Ues+9oIQ7BYv6rzAC5rNW4US+7JUB4WR6kd+cn9pNjSkd8I4MXwJXmlhtgQdPVCM/q9VcaYgT2+w4M001882t+0QjxB2Y+b2JkU/1Ay+33Emxa1kgo6cj4IiISQq9wHy3sqlB2i5UPDuPY4/vopteoILuft9910CyaSbFZ5lzLOAMEhjpL4fLhDtuUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 16:48:59 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:48:59 +0000
Message-ID: <11415320-1c45-4ff7-ecf1-633fd9e8bdf4@nvidia.com>
Date: Fri, 21 Jul 2023 09:48:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
 <am6e2dlPCIXALvjqZO6G5x2UJYRoTBJxShrZpZxzKbJ8cnYd4dsKuOK5Pm9Ai-vE5yJO2sYNq2JQRWvpIAp9bLDa8awF-ZMJsNpZEdJGGRo=@emersion.fr>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <am6e2dlPCIXALvjqZO6G5x2UJYRoTBJxShrZpZxzKbJ8cnYd4dsKuOK5Pm9Ai-vE5yJO2sYNq2JQRWvpIAp9bLDa8awF-ZMJsNpZEdJGGRo=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:510:323::26) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bdc01ec-69fb-4c5f-a05d-08db8a0a6183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ol4nJyElolU3VGYEQAk9cQCAtaGkckvdOBAPQabD0taj8wVVDZ6tyE3jmd0XfkpOr+1pmNdJ7/xeH2+HQE12Mwotl20+PkNU6kTzEFKmkklZyaSIibOit7GO2Nkw9zPSdIN7Nxbx2LTb2brkF/ANJgVOfVM9urc1xgTM1lpuGgCj3CkoDO/+8nndMt9aCTQULUa3jo43BDfnJstWE5UXZQ10fNnUN+Doji2Z8oaW/JuCZCQ4uob8a2Qq3slg0dc2oRqH1siMqDlcsSih/7yYzzOCk/8oD5LMP2sSTENRhozp+rgMv+cYipOeLEzyR6IW8FyN0x0CF/Ba86taRHwRKeRmFvEyTeuYwhI+ZUF4tzqL5v++RQlUBq/pWoR6/SWiSTLbpxUvjyuvqeG107g83JIXAJ6y+Zpts7jfHyzr+B8rwSmpuX9UMNj7vIV4LZt7PV/Cnt6o8xbCHCUs70IXrbT3/LL/vwD09kKv2dV3RCMNsyGZJYBp/yNeut4lCv2jn9QoJSno3chiSOWN9+FcO6QLZ2VyuYDYRmef7gxTOxa5L9hQP/CTxEM694DHLBJ0PbbK0vxGIeHg+hnr/RZdiHbcIh/oOfDul+DrME6dM3Tr3mgMB/GSltIfY3ny9okeml+/T+5OW1hVF+XU68gyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199021)(316002)(6916009)(4326008)(66946007)(66556008)(66476007)(38100700002)(6512007)(6666004)(6486002)(31696002)(86362001)(54906003)(478600001)(2906002)(36756003)(41300700001)(2616005)(107886003)(31686004)(5660300002)(8936002)(8676002)(186003)(6506007)(26005)(83380400001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3djM3IrRk1hRGhpSVpmR0RteXZKRXVLenlMUXkwaDVpUmswQUJ6WGE1TDNy?=
 =?utf-8?B?Y21zaHM4ZVNyeXB4WGhMOFJOd3FId2M5OGZzM01aaEF2cm9UcDk2UkFuZHNP?=
 =?utf-8?B?N1Fid2dZdmZyWlFvelM2ODZTY1g5dytuRTZ0SDJnUGNLbit6bG5vZ0VDZ0Js?=
 =?utf-8?B?YXd0RWZDQlJYaWVuVXE4WWZ6bnhKUkJmbGpQVU41WFZqMjEyUjIrMmlUWDQw?=
 =?utf-8?B?K29YVDBNdFA5OEhTNDZsN3dPZ3lEYk1tYVJ1MmxVaEpGM21RVHBPTSt1Tnpk?=
 =?utf-8?B?d09nMDBhMjRJOUEyUnlHcllTd2llcm4xK0hqemNZelpDSEE0d0o4OExxb2tx?=
 =?utf-8?B?ejBQcEVFRm1VQ3lER25aVkZLQU42enFUZjJVSVBUZlR6UllGL1pPV0NVRDdy?=
 =?utf-8?B?YU9wdkJpQy9WKzNSMDVlOEVUUHdROFZ2dlAwOGxwSnhka0E3ekNDTnVLMmhP?=
 =?utf-8?B?VVNabjBxZzNqVXBxTm5lSU1ZQWQ5YXZZY1dXeXp0WXlLSGVYZnJrL2RTNml5?=
 =?utf-8?B?Tlk0TldLeEtaZFJ4RkVYSDNQWmRSZmtNTmRWU0JhMjlxWkFtWmQ0dTdzR2Qw?=
 =?utf-8?B?bVo4a0MyVHlBNXNTVkVybnI2SDNtOE5VNnpvR3RtWXBxN01QaVZCRGFnV0VN?=
 =?utf-8?B?TDdJK2FpT3dDZG9TdHhZZzhEN1NlMWhLK012clllVmV6WCtJRy94TGltWm9i?=
 =?utf-8?B?Qm5kc3RZWFo5MEN0YjZ1aHVDdFJ6RW5rSHlWMkZqUjNrR3FrZVd1Tm9JSXp3?=
 =?utf-8?B?YzA2RWxXb0tBc0JVc3hYaXI1ZVZEL2ZQN2Rhd244L3dJc3NrRWN2cDBhYy9R?=
 =?utf-8?B?bWpEZ09VTzA0NzdXd2c2eW9LdmdkNWdYdmovWGxFK2JHY3YyMjZxekxHVVE2?=
 =?utf-8?B?TEJSOTdGUXFsUVVYdDcyMS9pMnlPRWFTMnRFUFZuY0h1ZkV5S05VZzYyK2hn?=
 =?utf-8?B?VVVuelJaNU9JbjlkZGRia0xBUmNqQ0F0Qytscmp5aUplY0xZZnZWSmNLN05J?=
 =?utf-8?B?WTBSYjlSRDRMbGZUMWZCbVJuZWRLTkFIVU9EWVJvTlRJSnRCMjRpdysvSTlp?=
 =?utf-8?B?cFNXcjlXTXBUQ3Q5TXhoRnJCcHlFdXdCVlhzOFFwdVZ5dkNjNjBiN2dLa3Uy?=
 =?utf-8?B?Q1pXTlZybEpNaThtbGh1OStDQ0dwaW54UEJhK1RQbjFBQXk4MGw5Yk04VGQv?=
 =?utf-8?B?Q1QrM1VMbXVmcm1GcXFmc0wvLzhVM1c2WXBWRTdaVlpHbEVxb0RDa2UvL0Z2?=
 =?utf-8?B?ZmVoMFNKdyttN1BWNExHZjB0U1puVElYQUdzWHc5aFdWVkU1ZjZ1OTZ4R2V4?=
 =?utf-8?B?WDF0cUYyWGgyajBOaHJ1c2xwOHc2MlR2Mk8rM0F1MVZiYTRRVW82c1VSM0Q2?=
 =?utf-8?B?anV0TFpKNndOODc3azNoUGFxdE4xeElHWTFHNG1TbjFCcXBCYmp6bytkeWxE?=
 =?utf-8?B?TDdvcVRpdVBjd3hnRUdMajg3ZUg2VVI4RUNVNjFkZTVrblRMQ2ZQbUxtVG5a?=
 =?utf-8?B?MUwrYW5uL2JSOHA5ZnU4c04yQms4bEZOV3ZOcnNZc240Ky94cTNBaUxvMWdQ?=
 =?utf-8?B?cUtqWjl3TThVeUZoMHlEV2VqVWNVY3BhV2gzVkU5L2pZR0VlZENqYXNYdkkr?=
 =?utf-8?B?QURjZUJWOVZvdHFTcytQWnYvbWJIbjNsd2NoMkFaQXZkNnhtaFhRVXEzWmk5?=
 =?utf-8?B?eElockNUOU5HZHRjY3hKY3Z5dmwzRkRmZEtwdWxZVldWaXo5WUx4VWVoV3RH?=
 =?utf-8?B?OUpUUU9hR0RTVlV2bzFaR0dMRUZ5Uk9RQnNMMnE5VlpGM1RtY3NKOC9oMWZa?=
 =?utf-8?B?WDFnNHNlcXhVbjhDUHM2c0NJRUowMXFZZi9pK3JpSGdQR0ZCNFI3ZlYwODJj?=
 =?utf-8?B?SUlPNWRwTjJCOVpHNEJKWmxWckloYzJyV0xpalhsQ1dsVXIxWHFsY0szenZO?=
 =?utf-8?B?ams3bHhaYWI4UWY2WDZQa2ZNSnpnczNtcmtmb2hLZFIwU0h4SHZ6cm9lYjh5?=
 =?utf-8?B?d2Uzdk9jM09rUk5UeldYRUZFTWpWZ2FxN2haOW1OYSs2K21NbmhhRGlxbHF6?=
 =?utf-8?B?N2JFcmIySEZsOHBOZlJLS0Fxak52enVmMTVhcVFQUXUzS2ZsSTByTGc4cnVs?=
 =?utf-8?Q?/NFRhhp8+V/1lpPFibv36S4Vy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdc01ec-69fb-4c5f-a05d-08db8a0a6183
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:48:59.5204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar/k/Dn4RHpkP7RpUnG7GhVNfcrDYnXhg726m5HQ+//Pm/IiiD6R985xRluoia/8oQCQXpqPXk+3+1pu1oNyxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's a fair point. With my IGT patch I don't think we would have coverage of the old path any more. I'll try to fix that somehow, and I think your suggestion of including some "invalid" cases is also a good one.

Anyway, apart from that I've posted a v2 of the kernel patch addressing your feedback from earlier. I've also rebased it on top of drm-misc-next.

On 7/20/23 23:59, Simon Ser wrote:
> I had a look at the IGT and I'm not sure about the approach. It seems
> like the patch replaces occurrences of the old FLAGS_IMPORT_SYNC_FILE
> and FLAGS_EXPORT_SYNC_FILE plus TRANSFER with the new IOCTLs. However
> we still want to test the functionality of that old codepath: we need
> to continue to test that the old IOCTLs work as expected.
> 
> Are the old IOCTLs still sufficiently tested elsewhere? If not, we need
> to either duplicate the tests, either add a flag to the test function
> to select between old and new.
> 
> Also, it would be good to have some basic tests for invalid cases, e.g.
> for the invalid zero syncobj handle, for timeline points which haven't
> materialized yet, etc.
> 
> I wonder if we need to detect at runtime whether the IOCTL is available.
> I'm not sure what the IGT requirements are, is it supposed to run on
> any Linux version, or does it require drm-next?
> 
> It would help to post the IGT patches on the mailing list so that we
> can do a proper review there.

