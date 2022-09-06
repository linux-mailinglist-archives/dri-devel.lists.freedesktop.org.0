Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82855AEE18
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 16:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDCE10E6BA;
	Tue,  6 Sep 2022 14:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C8310E6BA;
 Tue,  6 Sep 2022 14:52:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYRaAGQZWWe9ji7BIVdZsQgm2PKDXRCMYPy6n8C7gU6Bd1a3171E6g7V7//hPvWrAo98I20Hx7e3Dmv12Z6aEJlUU2hZzuas46sbRg2WvVjYxORrY9Xpi5M+YxxxCcjsLp3IpyY0FfRjSy5lVoObJ0zRXjfzMIqnaQSBshP4MdqvuHHru0xsx3077RkLQr1ZhLrULBvDk6LFZD9c8hVjdMxs+n72hCH9EK6K+hj7Cb2gvSAAejWTqhtIcr84UcMM8XmjTGtL6IzUFmj7PY9YoaiuaNZ9AulO99sZVBbuvMXCzxUUm7LDlQCiusFDpKPIOmq4d1r9v5FlAtR6tfEw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox4WMTXZcG/i/3JXKujUyi/ku/wTE1VdtY8m+GaDi4I=;
 b=fEXyzLsGE2b3uAP5MaxbJShMeLICEt6EvqgUU2lJuUkrOnRvDWf4aDf6DgIfEf5Dah586hLozy0aPbHInOUSH7o3rzsubzaBylrTNtfWn+BLgkfmXiBCmza2rroL/Gcm2dFStJfs3yx6SNLHzQs+PIF0g3v2G0dFhcKi1bmYdjAli+x1yGVZmCOInFThq/rFEqxNWLGUEZcL6Yq0bpnOhJmOxAO1NP4y61YT/rcj72oV9MSnUQ4iUBrikUe5Ln4E/RweZxZV//acllcBv/O3ia/2FZzaO4/D6ebf+aLXhmrdxAl6bRZs8hovqw6BI6XET33kLc+AZUgoW/VycdGMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox4WMTXZcG/i/3JXKujUyi/ku/wTE1VdtY8m+GaDi4I=;
 b=t4Lz7BKJvHzOSfW2TI6kgEuGUDmizS5voHeuSlCNhagSMNHwzYLUxNc0x/nbac/4J7grptl9Z70jVenPlRvXjmg3ZdK/8n+YeVsUBI5E2aTIqbSlA5ZZ90Bskb3DfeoPLRHKe8s8hEygNnv2kplyy/aTVBXsuD6xlOSV1TUhg5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 14:52:32 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5588.015; Tue, 6 Sep 2022
 14:52:30 +0000
Message-ID: <5f29a2e1-4ecb-9f94-1e57-f7d8d3c7afb2@amd.com>
Date: Tue, 6 Sep 2022 10:52:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/amd/display: fix memory leak when using
 debugfs_lookup()
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deuc her <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com
References: <20220902130105.139138-1-gregkh@linuxfoundation.org>
 <YxIAvHOK7uNum9VI@kroah.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <YxIAvHOK7uNum9VI@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:610:59::17) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b61d363-aa59-4d4f-1cf8-08da90176c6f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4446:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36yYhU/Zn9lCLMxB+I6HAOYDSkyWyJ03qhEvAuNc1Wqj8XjqjUCKwcBn+Fg5tXMHnvbx3+isfe4rQIFO84qpsdji8fth/L0pnxmPvX9nVueguyXU3WUNtHmml4Tp7QoFJ3HumOvmPJWOAOSQAXO+B1o2B+embILwJPKo5ObsaS5vMxxsV/4XEIyQwXGwUSrDzJqsYvZQ8tv7egYskEXPEB+0oowaKZLR/xEYulqLeS8vuUc6scE9ZpG49/OAV6OPjMP8I5e9ht/MfgCkOKT4bdkJFRQwwZMiZWpFi+YSLKnBSQO8tj+oH6Vc+gSnxkLon+E35MGu4j7esyb7d4LOZ4ZgeBBxaPiVqNYgCg+CffFpT2xahHTZIo3XzZughAFkT7ov/Cty9lvCBKXemEK4UaKpYaFP4xqRDsruCE1uanjkjJ0gU3VM9Z+U6ThSL8MzfzqZVlOPGWI/rdmU0YG5iyYBd7VfC0PAD7b3NUU5oequuqQyNPjInWV65HSC2AQ4oCayGnGt14klt3iIhx5f9o9ypGhNNov3WPjAKToOdsW44t1W8IpSonEllbgAMyhwhzIBAaGLMGmx+YJJcfM9I86ZDoGRGS6fwliqRG/djzUh8OwjDvx031x6uGy0889F48RkplikjvA+8L9fzm30TgnW6LvgE3JWqy9Ib9Wl/f5sHQUBWCyJ5fztzDKh0MYMFzxk1tMBbKN72T/BzXNs0fKvNWN/e6UtSZKb+70YpOkrs0Nyv5un6CxIvfQtN1j+T72xDb2Y0BGmyyOoeLwnXOA+rHziBKQ7eTjT1NHgmdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(186003)(31686004)(6636002)(54906003)(110136005)(316002)(2616005)(6512007)(2906002)(26005)(6486002)(36756003)(5660300002)(41300700001)(4326008)(8936002)(8676002)(53546011)(31696002)(6506007)(38100700002)(66946007)(66556008)(86362001)(478600001)(7416002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHVmNFNDUnd0UzBQOXRIZkVlVDQxOEJjcjFvS3BiTEJoanUxcXd1VVpWQ2hr?=
 =?utf-8?B?Nm44b1huM3FKeWRnNWxyN2ZkQU1RTmNHQVMxS0lNNXlLdERMN3JXMDZOeWQ2?=
 =?utf-8?B?NTRGajJMcEFrSHBneTFQd3ZDYXhsei9SKy9UZ2FjaVUyaVA3STVnTk5SMzRL?=
 =?utf-8?B?ZFBRWEdDNk94M1NRSURRQkVKY1VPTjVINHR1RGZWWVZLWlM1T2cwODYxaE12?=
 =?utf-8?B?U3NZSXFzRE5Fb05FaG0vcWdHa1ZXR2ZlUXNDZkROdFpIYUdZL2VrSGxuaVJT?=
 =?utf-8?B?N1FzN3JwKy9ybXRvT0RwbjZYYkFHMWlReEtPNkdQNXhPZjVFNzdOM252QnNJ?=
 =?utf-8?B?UjhxMVVYWXlmTFd6SCs4OFcreGpaMTRCblpVY01DQzVqcjBNbkpQMm5LR09T?=
 =?utf-8?B?ZkkxUWI3SjFBaGVqMG9QeEwxN0ZSZDMxVERJRkFOY0V2NStUcDV3eFVwbHBa?=
 =?utf-8?B?Z1lROVYxVjRDeDhLUERQbXRZU2hXWEkwOG0xY1ZOOVBkWkovTFdGem9abmVS?=
 =?utf-8?B?ck10eVdKZU9PTzBkZklYb3BpaGRnWFFZbUQ4TG1mRzRzMHhXWGlrVmx1K2sr?=
 =?utf-8?B?L05JUHN3Z0h3M0tvb21XZVp3TW5FQ01GMDFrU1V5Zy8waXVsYjN1M3ozUVRP?=
 =?utf-8?B?MW9IQWptYys1Mm14OFZtcWU4QjhUN3B4RjcycEpTRzNLM3Ezb1daYkdydzhT?=
 =?utf-8?B?RU5GVTFQV003Sjk0cDI0S0lrZXBVVi9lWEZncTRyY0JSOUl4WXphT1luT01W?=
 =?utf-8?B?K05la1Y0RXhTeFR2bWswSVJLMHJKajh0TFFkd1NlYStGc3d5aGNqOEdrazZu?=
 =?utf-8?B?Qk1Ec1RlMU4rMHQvTmhXUmxjVjh4Z2dJaHkrV0xNd2lGMHlialNFWnlxY3F6?=
 =?utf-8?B?ZHNsUmRxRTFNMmVXVVVOSU9wMFNoK0pYaWFUaDNOYjdtZTJIVXRtdmNqdmVU?=
 =?utf-8?B?dnFWUjJCejVIVlBELzZDRGNBTHBYRVdhL1NKeDZieUFUbGdQdUh4KzE0WVYw?=
 =?utf-8?B?M2NzYnJ1czZ1c1I0UWc5aHJ1eDJSNFZLcDVacEppZGZiL0lMRHpmaXRLaHdi?=
 =?utf-8?B?TTZrL3NaTTUrWHZIa2xSdE1jbStucks0Z3BBMVBQQmpteXArcmpOREdQZDhw?=
 =?utf-8?B?cjYwUG9DMy93TDMwMnJYTmpmbFVPQmxBS1RFKy9XKzNPYkxNYm5IdHVnNk8x?=
 =?utf-8?B?My9Zakx2NVBCK1lucXZUQ3NXU0RyTTBWeEY4YkxlSkhFaVlzQ0Y0dWNMUlhP?=
 =?utf-8?B?N2J6dzBKbE1hL1VGOG8rd3lIWEdZTVFYazFBTzlXRmFMK3hidkxac1pkM0xV?=
 =?utf-8?B?MThHVVhyckJMdW14MGdrYWdUYVBxT1pkVG9zS01nVmRiTmtqQVNnRnpJekUv?=
 =?utf-8?B?K3RMd1ZxTE80b2FUdDVIb0tuaUl6dU5sa0V0dHJseEpjRkxxdUhJd1Y3V0I0?=
 =?utf-8?B?TElxa25aTXJwZnMzMUh6QkxHNVBRZ3JGSUNSK0tOdHoxWHJFd1F3dlFCRm9G?=
 =?utf-8?B?dHhmMWQyN0lBOUpEa0owdjYxQmVPelgxT3dZRlBZU0Z2NVg3MVQzT1dqQWVK?=
 =?utf-8?B?Z09LQjk4M0E3ODhJbnFJOHZRdW9MOUwyaHlreEVDbDAzQkwxMFJVdVBtZHFk?=
 =?utf-8?B?NUZDVGZlclFqUTZ1SEtUYUVzSlBpb0dIbHJkTzdrY2Y5RnpYTzBRWSszSktZ?=
 =?utf-8?B?VURkMndlaGVwdDU4NW9kZC84QVlXVWVHVktDd2NJNk5NbnVyRHNiVlJEWVJx?=
 =?utf-8?B?MEpubkEzMkMxZkdsYTlML2pyRUtFOG1NZEdrOEF6b2U2TGxPWXdSdGl0RHNj?=
 =?utf-8?B?RDR5RUF2RjhjNVhNSkdoVEdaQUs2VytLSWZkaS9TWU9PWlJPSnlSNEc1MmFi?=
 =?utf-8?B?NGp3SnN0bFR2cERjNURGSVFBR09XMmRmd1htSTYzMkpNSklUNVF4c0NkRms1?=
 =?utf-8?B?dEROTU12WGdNbmg3b1loL1YwMG5zV3ZQNlhWQ1d5eHJVNkRqRGpNdUM0eEZ2?=
 =?utf-8?B?cVpIYURnVlYwZ3ZrMGU3UzMrUldNWnBucmNRZ1ZlY2NIdjB4cjBKVlBWYVNt?=
 =?utf-8?B?cXRGbEd0MVg4MlFOeERjb3RaTTdiM2VNU05MVGxWZnRVNFdVNU1oT3FhR3dO?=
 =?utf-8?Q?nGpqIA+AA1DSknDzhHF8lGxON?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b61d363-aa59-4d4f-1cf8-08da90176c6f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:52:30.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVPfqZnNHWAuWe4d+jQ5Dw8e72HpFiwK+Qmgzk5ZXBCyfI9xajprONpBYC/Viy3o61IkPA1pPuxtu26Zch4l/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Thelford Williams <tdwilliamsiv@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-02 09:10, Greg Kroah-Hartman wrote:
> On Fri, Sep 02, 2022 at 03:01:05PM +0200, Greg Kroah-Hartman wrote:
>> When calling debugfs_lookup() the result must have dput() called on it,
>> otherwise the memory will leak over time.  Fix this up by properly
>> calling dput().
>>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Leo Li <sunpeng.li@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Wayne Lin <Wayne.Lin@amd.com>
>> Cc: hersen wu <hersenxs.wu@amd.com>
>> Cc: Wenjing Liu <wenjing.liu@amd.com>
>> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>> Cc: Thelford Williams <tdwilliamsiv@gmail.com>
>> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
>> Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>
>> Cc: Mikita Lipski <mikita.lipski@amd.com>
>> Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Cc: Sean Paul <seanpaul@chromium.org>
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
> 
> Despite a zillion cc: items, I forgot to cc: stable on this.  Can the
> maintainer add that here, or do you all want me to resend it with that
> item added?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Is 'Cc: stable@vger.kernel.org' enough here? I can make this change 
before I merge it into amd-staging-drm-next.

Thanks
Siqueira

