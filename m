Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFB57174A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 12:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF2E942DF;
	Tue, 12 Jul 2022 10:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C0F942DC;
 Tue, 12 Jul 2022 10:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr3GR4+ySSSqTujk+PzIq0Wt8c6e0tuTYonGtjEw7J14IFSsiQsrE4Pe3vfZ8gJInZ725Ejm449eK5soXO303lXIoauxAO0gw0/Bdxxz7JnR0hUMolSa/0ji/kpoBXwrf/KKi3OTbdNR6u2U6WhVYpSBa4BSlnMp3ATvgYBlUnD/slJOz9k/+E9MHUpXh03JAJz46PThVokf9SoDm5FL5psrx8kXbqvta7Od6Dz56PodPicR4XCTO3EP0bA2VZ0zDYSISfgsypNaauOdGQF4K9Gp3Hl7psJzScOScDnvNzepx/3cJOJrOxufXGjavZQ7n3dIeQzHwXyxxpw41dw26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xnvr3oQx9QwjQJ5RKrYzBNe66MAWxdnijhTSYaHav/Y=;
 b=JVzLytcyD5XithPjQXHJFdq0WFJZdOb2IGArellwfTACKv7innoBZYt99a77OKDcb/FJKcVAKTPFW3agDelwjHDGCxO2hcWQXUcJpFtBfBUBXo9PgDUJwAD0QZpV8lnIerDt3v7j8QpxK0Kmg2283Wb9WrngjDMFY/ahIv5A6GYZotCWtotbck6detdvOfcPcnGjynNeZDw4j4fINXHmiA8ev5K/D8WtaNlRXWGguLcAyU+3fdynV/K5ANTDEYksUdbeFbH6H/2IIgJG9/mbqEpWgfiwSbZ8Z/PtDzCVxzxsBTMHZICFP6MHCNNDQkRn1roW56jza+sHFntQJ10rxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xnvr3oQx9QwjQJ5RKrYzBNe66MAWxdnijhTSYaHav/Y=;
 b=Cw4u63iNv1ou/RItPkL3nyq2R/67jUlBxXCQnJ/N8kj8rGQ3QbFzd68MB66DrrYcyH0Gl0rHNWkgKBKP6LPC+v2UdVTwyt+J/pI70tA/oVLWTyvmxRPYw8mjTeUIJ6YH5r2ZXh9RPe1H6zejpoxkhX74e79J3zE7dl57EpUgLTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5759.namprd12.prod.outlook.com (2603:10b6:510:1d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 10:26:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:26:35 +0000
Message-ID: <22a21338-305d-bdf7-0079-df67fb030fc7@amd.com>
Date: Tue, 12 Jul 2022 12:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/syncobj: Fix sync syncobj issue
Content-Language: en-US
To: jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 dri-devel-bounces@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220707102953.769684-1-jesse.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220707102953.769684-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc1d73d-538f-43ca-6764-08da63f0ff79
X-MS-TrafficTypeDiagnostic: PH7PR12MB5759:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZcqXbv1h1ohXLdjEN4/0luZ7kbSiVV319btjIkuK5/2oo+cxH/51MOtx5n+msKZntsjnI0gyhANz95/dJW19DiMdd9pRfQyRX1PtzPB1Vldvri9TnT28ZjEeVWUVvA/d0ybS7jRvw/0K+0HvNnB4322kXZlJvW3Iwvy7jIVwcMKafXwAZUYgTP9iohL+b53YP2VOItQ/4cok+sNem6SYtwd6nCJxylgmz8oPCIf3Z6xL3CQm3L0iMxMHYZiMtJT2jxGDn+4Air0wdQ2sC30ql+h4Ard1n9IgKHu/91LNInJ+zNKrHyfHHW2zRc8DxIbCgbeBxZbrwVDjg70TkxuIeLJ8E2CjdcPl4BxgTzdvEgBfS4wLxhxdOZ+OQsiZr/ogB4SXysdItrU1oKPG1RTffW//9uDt3RJ7lTOV1C6+b4HFZbYLf/gPsV0gV1/qMYEyyqMO9Z3YwwG3PlxieaoqxST+5VfNPiOO/L9ug26387woYPCuozTIkC7/lBRR0j7Qz6n4qBORWzX3NE5WM2GdWFpQpfrZ6qgSUXpwFWZ0KN/MGgGydX0vgrHoq3spVb4oNVVB19JFiQ889LTOvF0/m4w3+o+J6K6Yc50yTXiMGk+7miWlsQun1802parP8Nqpm5GWl3Xg3whGTEeH1d8vyhBf8ePVdpkjs1XTGmj8hv/Yi34Ga8NPLk1O64WWgXLgi2/EhgIFPfs4g8wEvfmOQ9CkbfgLJfcxfLfuO8rVRXTbPRaDtaDcjzUQNdjTdwrsDmSsmvwodD7JD98ldKzxu+OdeSSPz3iyYVQWOAvikf3ulWfQyecXWolatTo80MWWaGCtPZporWP9YwVW4Zz6pACSh7UKJSts9AYo12wVKJ+ShI2EOGwLn0DjWTXtZMe+SPot4n4DWU5iCzhUGUOnFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(66946007)(4744005)(8676002)(4326008)(66556008)(36756003)(6512007)(31686004)(8936002)(2906002)(5660300002)(66476007)(7416002)(26005)(38100700002)(478600001)(31696002)(54906003)(186003)(86362001)(6506007)(41300700001)(6486002)(2616005)(316002)(6666004)(45980500001)(43740500002)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am5UNVUrK0hveGYySGxRQjd5NHp6QzVDVjlUS2FVU2N3WlN4Z3VSV3ZxMDVh?=
 =?utf-8?B?SzQxS0dQKy9OclpzZG5HdUFDZng1QXJUSVQ3cTh3YnlVdmFFL0dudFlNdzdI?=
 =?utf-8?B?VThRMmZBT1ZqamRnTjN6TGdQMEZPVnluTkV0eUg3SFVvakZ5Y3RydEhOOXhB?=
 =?utf-8?B?NTZxU05tUWVISGFDVUhaRk5OWXJLOFBlaE5oa0NCcmpGOVdKS0s5d2F1VVYx?=
 =?utf-8?B?U0xqMlF5M21KQlNESzdpOEVJRHl2KzIvQXN6a3h4MXBUWFJaOWhaQUl3L05Q?=
 =?utf-8?B?Z3M3V0lmUHYrcTQ2S2hoTFgzVHdnbmlhODhLeHlUUWFxazJSalh6aU44NkZX?=
 =?utf-8?B?b3hhUlNkOGpVVjBuQXlmU2pOV3U2MWFJWkVKYnFZR1JIOVcyMkRST0NIVmg3?=
 =?utf-8?B?WCtZVmFVbVE0dC93dEx3ZDMwMStUa1h0UjZHa0szN1B3OEQyNzVJZi96c1Vu?=
 =?utf-8?B?d1paekdmczVyRnBzb3d4cE9uQXNUUlBuS2I4bXdtNGYzRG40SHpYMVRSOWUv?=
 =?utf-8?B?Rk0rU2lHKzZ0VUlxZm1JNDdKaW5VaTlYKzliR1FHNW9LcTA1RXNIUXU4UlBQ?=
 =?utf-8?B?Y2g0M2dvUUw2aDBKTmhQTGJEOWVvbFlGa2EydzBjOTNEeU04d0xycTdiSElS?=
 =?utf-8?B?RHVoRHR6VFB1Y0Qwczc1NE41UDhsMnZxOFRQdzhlbkhRbVBVUU1OT1JsUjJt?=
 =?utf-8?B?RFVrT21kYitNS09qRE9wcHlIRzFaalFuRndvTTFyUWNGaUV2SW9ucTlDWkp3?=
 =?utf-8?B?TFcvc0FnTlNHWUJwdFBpSm55MENlS1dmOCtKM05zS1VyRllwQmhDVVpFSVJ2?=
 =?utf-8?B?aVU1dk1TbVRCb282QU9xMGo3NUVIRnBDb2V2MlJoSXlVRGczNUFKL2NlSEJV?=
 =?utf-8?B?SE53QnZFaDhVUkNOOVpFY2JnWWQvcjFMamc2UmVBMkJBWTdIYVB6MER4R1ZR?=
 =?utf-8?B?SndsSDN4Q2U0ZkdjZjBDRDh2UEgwd2lRWEFJRkRBU1p0eEN4SmU4OTNpUHhy?=
 =?utf-8?B?UkJiQ0JqMHRlaEdSQkhCY2NNZnhRYTk1RXNGVWFUSEJHb1BEUEpLeWplaUhP?=
 =?utf-8?B?d3dYZjJ6WXJVOTlyMFJORWZiOFVHTEhOUFVKUTh2enFwdEppdjFhQzVvREpY?=
 =?utf-8?B?dkl6WnpKOWEwYkRZeXVadHk5WE1TQ2V4WmNORGNtOXVLUE94MDBGOHF3NmlE?=
 =?utf-8?B?SSs5aWtHdnBwL3JCT2JlU0RTSlZrV0w1cDEzN1ZCK0Y1blFYcWpVdXVqZGdG?=
 =?utf-8?B?NnBnMWhVVGFoL0dOWHNRUWtxUFdvWm5MRkxLNUFxRDhlNmtmd0R0UzBYNWRT?=
 =?utf-8?B?SmhieTN3b1MxT200SzlaNkhWdEwrTWtTK0xJUnVvVUh1b1QvaDl5MDZHZ1lP?=
 =?utf-8?B?dnpjb3RLZUs3RUI4c1lJTkZzNlRzMFhKYjZnZ0VPMnlvMm9JdWtQMlc3UDJp?=
 =?utf-8?B?SzY2clloUjA3eWhRVzkxL1FmbGFlcWpPMDBCMVpMczdlak5RTFg3dzJXNkZP?=
 =?utf-8?B?Z3hRRTZ2V2crRmZ5R1VscnU0SVF5eWRjcUd4VWRaMnBrMFc1SlZtMUg2c241?=
 =?utf-8?B?SVI5RTByNkcyQktHdVV5OTRIQlQ0djRkSkdlTWlRNU5uMWc4Ukt5bG5Sakdr?=
 =?utf-8?B?TFhsbm05Z3BFdFhOclZMOVBUNTZHVGpGaDdrKzk0bFBRYjdrUTFKY2Fna2Rj?=
 =?utf-8?B?Q21NTG40ZTZ3dnlUNkVlRGJuczMzNThZbDYrTGxvWHBjb25SZlZtRTlrbENG?=
 =?utf-8?B?NDBjdGduamJPbGlNKzFndnBIbWZjZGhSb2VxZklYUVowdmlsMGFqR2tJT1FD?=
 =?utf-8?B?cWtUMlM1aUltck9BSlE5UWgyMnByMnQ2NGxRd01aMWNqNnE4L2NZWUdpc0Vy?=
 =?utf-8?B?Qy9RZCtSbDBrSnJLeXZ2b0dqV01vbzcyeXEzNWJ2MDhHWlk4b1kzeU5lKzha?=
 =?utf-8?B?d0pJN2hhMERmTWVjUHl3NVhnZUpCcWNmSlltMnpIMU9oaVFESW5vUGUzdURZ?=
 =?utf-8?B?cTcxVjVxdGhQUHB3REV6NFlwUktZYkE2WTAwcHMzQkVMZkt5TlBON1kzaVVQ?=
 =?utf-8?B?anhZL1FEWjdIckNMQlhESlg2emtodTR0NVhhZ25DOFBMRS9FaUxJYXZ4VU96?=
 =?utf-8?Q?1PW/6eJpOkAlJy1+YgmyfeVoa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc1d73d-538f-43ca-6764-08da63f0ff79
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:26:35.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVaMCJUWM8uGFG0S912z3aQWqBnSm3adZuEImqw0R+oVG34w9+jM5blv7F1BnQGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5759
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 lucas.demarchi@intel.com, open list <linux-kernel@vger.kernel.org>,
 lionel.g.landwerlin@intel.com, nirmoy.das@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Vijendar.Mukunda@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping to the Intel guys here. Especially Lucas/Nirmoy/Lionel.

IIRC you stumbled over that problem as well, have you found any solution?

Regards,
Christian.

Am 07.07.22 um 12:29 schrieb jie1zhan:
> enable signaling after flatten dma_fence_chains on transfer
>
> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..0d9d3577325f 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -920,6 +920,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>   	if (ret)
>   		goto err_free_fence;
>   
> +	dma_fence_enable_sw_signaling(fence);
>   	chain = dma_fence_chain_alloc();
>   	if (!chain) {
>   		ret = -ENOMEM;

