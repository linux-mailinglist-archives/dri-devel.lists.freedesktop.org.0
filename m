Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663C43CD6F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 17:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECE76E8C1;
	Wed, 27 Oct 2021 15:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A426E8BC;
 Wed, 27 Oct 2021 15:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwr+Iiw61evuK6Hy5v7J2HtL0AmsbMsrZvkhy/u6rTXleosGgFZ3ToHFcKuC6OaljMoKY6FBeM5FAI8DfkXnM7mAH5J98lt1dDFJY1xQqM2653AGYFKbtqGE9/YV7zIozouVI+bDf42B5bhYGDw2b2neWZMEaSwWMeSPq8kknCSR3CAsrrrM5zlM9IEfCcYmflcTlsiI4jziQ5rhPnJM7sEPYSJQm6Y9VfL+yduRZvkqGGyvtsYt4uilwC+wqfbiSVHjQpErs7VdsnIyBl0bFn1a8qe2Q0GefHExvULOhGgie/Wptm9if0B9GCETC9ZKML0bplOwXqiVSCUJArhSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyOMzJ0qIftW/mYUiaeBK5SigtMqiCNrwMVsk3KM4yY=;
 b=Hno4keIoqUQdsW0SvJA0jlOUjH1nkjOhnuLJLJa7HSW+a1hARn4PTOYyIAR3dQlpjUYL5gilAB4KfM1hHGeWUX0CebGftIM8FogpV5tm7jXjqw9b1iySne3NKk+CnwAcA8NRbCdNtja/31GCTgzshzhv+IMmbGqngKQjJ/BZGv1cyRLOkTdi2T4Bmqe6AdeA4VG9PvDmcj5BU73PywIUAHdQwokoBJmGHxyo8PnrnislJfQvxv3u14/pJva440c9ZW2AwUZwOaoG7yDWpr5wD2bdJeZjL94EhdJtqaCvDh+jliNpXvSUXDm/hEeE7AoyE4q7yOvLsaAz2U27jfQWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyOMzJ0qIftW/mYUiaeBK5SigtMqiCNrwMVsk3KM4yY=;
 b=HMaSuoaoNySGtBt1UEe0O12wwR2HQ+L8rGQilOD4fEAblaPPR2SQtLXn1zVbB1Q5YMbiL6yXvFB31iVp+KhKkff0ZbD/12IyM9Z5y5f9XXXbAhMFc3s53zWjPqbow1fourbzoiTfkR6qi8HEfbfHl3sICBscJjIgYUIQOIGUqO4=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5410.namprd12.prod.outlook.com (2603:10b6:5:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 15:22:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 15:22:34 +0000
Message-ID: <8205a660-6990-9007-48c9-453117d16f72@amd.com>
Date: Wed, 27 Oct 2021 11:22:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/amdgpu: fix out of bounds write
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Thelford Williams <tdwilliamsiv@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20211027143945.GA1947580@roeck-us.net>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211027143945.GA1947580@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Wed, 27 Oct 2021 15:22:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d13dcbc6-3427-4fe8-249e-08d9995d9987
X-MS-TrafficTypeDiagnostic: CO6PR12MB5410:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54106AC3675580CA2F9B27008C859@CO6PR12MB5410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjeL51EqVSsrJ/Exnv8I+3IFefz+gHC4alPRLIQPorJlBaCOsBysKYU5JMVSLJb8mcv6rCwiRTXY/zeA6O2rPPOsDrn1xflQWMMymTjaNcX4tt0nuij86RRQLSjSSXGelRhSOzuEtNpllCfWSvvlnL02Lld4Ai/u/GzcAbuXNx3HJeyGJJ4nFWbD4+i+H2mG8jeE+GaJsChjy0bKBjb1WgBC9U8+E2PSgNniwMMaTMXebONZYiJod6rDlNNX+NE1+iY/vIbTYrJYybanxXO1621YwWnFZ6Wj6Lm337OhumM2JOTtBbm1tkZzKGuan5giFOh8d7Z+10oeHVemkhMp1Je7H0D7cglB4yrg6GJce8APrVdvUAqwh3+W4mfo7doDj77kUq/QXawke/KlxzGtOI+WPhJXaD9U0IgE6v1D9kRBRfXDroAhcxCp3xwdbrz82fouXmct9KMhfmNt1TSPcogwnRUhMGTmXE1nY0HkCtnlOwx1j6jJ6CLE7+PiMMUVAVb6H1oZ7ylVWmDnC9qeE2RwfUmYUtEB9YEprQEL7nwHEXaMIOe1uBq6CN246W7v+tRPZRoLHYIMxeBCOO3yF8tjZPYo7C6TLNiTjDqAS9v4Rr43X6/jILwo6Fx+PzpUzf3G0h0v8nzND/H3ZBAlrRsgDNQquGPoMBSMe/Fl5MdobnkN0RL5nGmjOI3xVr4D93znoYW4l9arOePHQDGxSzIScjf3Gp/cnE7lQ3RYiiLM8tH1V40PtO8AeMRMeWgZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(186003)(54906003)(110136005)(316002)(66556008)(31686004)(16576012)(2616005)(26005)(86362001)(956004)(38100700002)(36756003)(6666004)(966005)(2906002)(44832011)(83380400001)(53546011)(8676002)(8936002)(4326008)(31696002)(5660300002)(4001150100001)(508600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OERhZWRwVlNKVmhvL3p1eS85Q0FiVzVKOHBEYVRGTFZNREhuQlZxWFRkT0hD?=
 =?utf-8?B?RFRGc2h0K0xMYTlhbDVCN0RqOXRPeHFTZ3VQQ3dxK2Y1cDFQd29kWlhSNTFi?=
 =?utf-8?B?WFBqSDRBamE0N2h3R0l6aDRCWWJPYURLcmlwZ1I1WFJMTExYYnd4OGh5dVBI?=
 =?utf-8?B?cW4vWG1mRjVqSDVMY21IYUI2Sy9EU09RU2s5RlMrKzdCNFZ6aEkyNUhadkZs?=
 =?utf-8?B?dU5zT0wxUDBqZk1yYWVPa2RwNFRQbkN2SWVvYjhnbW5VYmdMVnY2VFg5S3VL?=
 =?utf-8?B?RFNWYm5xWDdvV3ZFUEo2TVBXa1czQ0J0U25JV1V0TmpveW9FdGNjQmJVeDdD?=
 =?utf-8?B?UjRjYlZlN3BtRW9ZSW1MVytRU0dlNyswQ2hUd1hvL0p3bFEzMFF6ZXBpZFUz?=
 =?utf-8?B?ejVMUVFzY2FRYTFJeVAxSlM5Q1FXTGwramd2dzNySWI1Q2FFc2NoRmdvNkR2?=
 =?utf-8?B?QXFnaW0yZFRFbHYrdUxyVkQ5VVlrUFN3Wm82QnU3aWFmZUdQOHJxZC9sa3Z1?=
 =?utf-8?B?WjF2bVRJQ2s2RjRXRXZnRlBGQ25KK2V6MTVpYWxsWHg4SzN0Y1lOVTFpbVB4?=
 =?utf-8?B?OGdGSlVMUndMU1ZlYkVybWJaT2lkSlpEajBqR3pQd21lRkQ4RURuZjdxWlYx?=
 =?utf-8?B?STA3UG1PMGw3RkRJTnprYmY4Q0UxNlE2cTY1TWlWSEl4UmFXdDl0SWpKVXJ6?=
 =?utf-8?B?QS9KQmRVVno3Uit2MC9vc3FLbldqVG1uTG9IK0FIUVprcEU2MnVjSm9Ca1ZY?=
 =?utf-8?B?Z2FvOG9lN2kvbUJNNGtWUTIrenk1NXpMckJONWNHaU1ndUZjVkQvTVFueDQ5?=
 =?utf-8?B?TUE3OXNmOXVIUm16LzNyci9uVmRDUzlGUmF2YmV4b2FvdzFhaHVVY3M5UFg3?=
 =?utf-8?B?bDVsL0MxTUY2dHlGbmg5VmRVZTlsUkRla2pvVTlaaDZBdlJHdGZsSCtrMVRo?=
 =?utf-8?B?ZzBIUUxVbkVJMHFXeTRmWkNiYmlGZlRLK2h1VTQ4ZHVlTGVUOXgvdmlxdkVL?=
 =?utf-8?B?QWZ5V1hJSlBvMktpdHV6VzdlNHZyMVpXY25SNEJwR0c1ZXhBejVkRGdBTi8r?=
 =?utf-8?B?dlJMRTh3TTBkblZaYnc1d2w5QW82OG5ET0k0SHlxTHozcGVrTjBiakdpMHVT?=
 =?utf-8?B?N1NmbGVDeFBKMTVPVERldStubUtock9DdkFaY05keFFhRDNYNEE0aUlMSlZQ?=
 =?utf-8?B?SW9XMWZta25ZOVVhMHFYd090M3Q5WHNUZXZob1A1UWlubE83ZDl6UXdtak0z?=
 =?utf-8?B?VGtVS1N0ai9uNVhMWE84UktCQm4zdnRiQzlodzJlNmNZMTRRT0RIVGZOemdJ?=
 =?utf-8?B?K3JLaVA3d25Tejd0aWhCeUpuejM0eG1jS0ZyOTNyZ1d6QkR6Ri9uYVQxL0JM?=
 =?utf-8?B?TnNUOVU2bXdoa0w5V2RqbzdUVlJWM2RRbFV2MHE4TmNGRVhhcmY0OHdOR0M4?=
 =?utf-8?B?czFZbjdiaEthVFpGSGl6REJ0bU1KOUxMeW5qNUpWcE95ZG01RjIwOW44TlE2?=
 =?utf-8?B?aWN5bUJkUGFOdFoySnM2WWgzRkJ1RFk0MDc4b3U0c1FvejBpS1o1Tkx4eHZO?=
 =?utf-8?B?N3BrbFVFbUx0ZDEyMktTRGpEa05WSDYyRkdNVUR4S0F1WlU4cXpWdnkxSnJY?=
 =?utf-8?B?akxpOEllaU9iMGtwZVFZYy9UYyszM244K3F3WDIwYXplTFM3TDZSK3RYYkV0?=
 =?utf-8?B?NDVDbzhNeitHclk4WEozSGQ4UGwrTEpLc3ROWUZ2ZzRIN0pYZk5vclFSYWJB?=
 =?utf-8?B?TU1yNTYvNXBWZ21uSEJsMC9uVlM1RmNmb3RtYkdVY2NqN2dHa3c4d0x0eGpP?=
 =?utf-8?B?NTd3cUZFQ3UwbnBCSnNRbFBFR2gwUFhkbm5oRkRmT2RiSzcwaE1mOFFZQ3J4?=
 =?utf-8?B?aTRiUmVmOFJmMkxvT0JYekthV05UaTc3Qy93SXgrNTFXT1JuaW1rbjhXdUdq?=
 =?utf-8?B?VzNjSGVZWkhqNkhhY2Z5M1BmelpqWmUvWU5vTDRpcStGa3QwYTl3ZTJqZDRT?=
 =?utf-8?B?aFpRVHh5RVJNR1BVYjB0STBZWUJMUmZmZ24wZWRjallBZWpjUCsxbFV3Ty9C?=
 =?utf-8?B?YkpDb0RQTUp4a0FKU2xvWGVKZ3RDYzQybjFZRVRxRTZ4RWdkekJDNW8vRStu?=
 =?utf-8?B?UFJDMjBPZGdGc2wwb0J0ZTNISENnTDhEY0NEU1hBQjFYbm9CM1J4U29lU1pw?=
 =?utf-8?Q?7HLeKfXv0tstFeT9Bba1gEA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13dcbc6-3427-4fe8-249e-08d9995d9987
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 15:22:34.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAZmV4pyOFQ3H0CcYHUfCnPHNhwwOtHs+bEkxNJCk/+v4xrba0ZVSJmhB7oVZ7OCweIoH2f3wkmi2vVN35KYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5410
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-27 10:39, Guenter Roeck wrote:
> On Wed, Oct 13, 2021 at 04:04:13PM -0400, Thelford Williams wrote:
>> Size can be any value and is user controlled resulting in overwriting the
>> 40 byte array wr_buf with an arbitrary length of data from buf.
>>
>> Signed-off-by: Thelford Williams <tdwilliamsiv@gmail.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> The fix works, but unless I am missing something it is incomplete.
> parse_write_buffer_into_params() is called several times, and the
> size parameter is always wrong. This patch only fixes one of several
> instances of the problem.
> 

Patrik sent a patch that covers all cases:
https://patchwork.freedesktop.org/patch/461554/?series=96341&rev=2

Harry

> Guenter
> 
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> index 814f67d86a3c..9b3ad56607bb 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> @@ -264,7 +264,7 @@ static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
>>  	if (!wr_buf)
>>  		return -ENOSPC;
>>  
>> -	if (parse_write_buffer_into_params(wr_buf, size,
>> +	if (parse_write_buffer_into_params(wr_buf, wr_buf_size,
>>  					   (long *)param, buf,
>>  					   max_param_num,
>>  					   &param_nums)) {
>> -- 
>> 2.33.0

