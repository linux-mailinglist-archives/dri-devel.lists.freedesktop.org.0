Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C37380FC7
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048106F3FE;
	Fri, 14 May 2021 18:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D4F6F3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORCu58qUhe7ZzqVV16dBEfiIOVhBnlhZIXOqqkNKA2kaakzOW3/SrOWlJ5QHymACwnZTwtHNNc5w/YBLBzgagG3Rx2qHMTDAKr6ZJ6+6UYLhA7ekG4LDiudgIt+DmuC0P6aHEkDftdPUfYGowUERydvxIQXAe0Ux+J9sSKQI/rSpwQGBhTVoXg3iWsLAVuKgc3ghdxFhBoRYRrLnTQ5xAJ68Vtf5skHeafMEmDV6g6W2poeF/r2pgKJujmRygaZHtc/sJBZCYWIYc6fKoPeSi7DMUWOFKXa0A94r5pmhBEKaOrEALxatqGRsgqOKnrsFp35JfYDbGcViGzXa44LA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK46JPfKvqukRs78JCR0MXhPZ3S68TebG9B4Q+PeQFg=;
 b=WV+sXoJwIm+3wRA4geeO0NYLrF4MFbJDoMozMidaAL/T7EM1yxyIfiVLT+2vagzQ5TW5Q6Up/ytUdch3RnhzwVbSBw7lDLHlvo+YCIMXPiKs8Kf8ZfWqivz5oP0ZYdmy6GQuBEc4rQWXDT0suxGCnyfZJz+psRiQd5ymlaxS6mZwfwTxJE9oIEetXoyjPolNBJr53feZztxcybBLMeF2fXdeps2cTy9/7qsKvJ7gAXPmum1NgogOnKu5aFoIuG0ZZ66nNWILqorTm2dvrKQdDPKjlh+UNBYSXZoYufa8CoMDLu5JfNGYZ0UoGf8L+nQIjMxYgu073i7rNaU3Jqfp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK46JPfKvqukRs78JCR0MXhPZ3S68TebG9B4Q+PeQFg=;
 b=TVwQK/Tvu9/Q/N5gKKJCSJiEZXeqGRjDKBbLOd3ITL3ANKOtCeVxWvakhV6DYKsErdaw5vFVvU3HrTN991dCnJhKs9+gXqQXXi1yIUK1wAS+w+zlVahNQI6OxM1ugXPJRpmhYFst7Z7n2ZtXZa4R4OJmC3ny8Bi/czcRNnkwBSI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=vmware.com; 
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6205.namprd05.prod.outlook.com (2603:10b6:208:d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.12; Fri, 14 May
 2021 18:32:23 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4129.027; Fri, 14 May 2021
 18:32:23 +0000
Subject: Re: [PATCH][V2][next] drm/vmwgfx: Fix memory allocation check and a
 leak of object fifo
To: Colin King <colin.king@canonical.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20210514144930.89813-1-colin.king@canonical.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <859a6800-5c5e-b6cc-50af-8bd4560cf35b@vmware.com>
Date: Fri, 14 May 2021 14:32:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210514144930.89813-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL0PR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:207:3d::48) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL0PR02CA0071.namprd02.prod.outlook.com (2603:10b6:207:3d::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 18:32:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be698950-23c9-459f-987b-08d917069d4b
X-MS-TrafficTypeDiagnostic: MN2PR05MB6205:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB6205E8E97AAFDEA3B47D47BBCE509@MN2PR05MB6205.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5e3TkdQNRW8bK4spAJ31fZDeT/RNFqaeXzErlaT2sALTyqtJuPPC0beqnOn82UAo1a75JwD7FS56U92IwgqyBh9NPrH7Q75HNESl77Nywa5NpoFVD05OxlP+HLLT8wK69hmX8mBWkq4fKQm1Zgg51bRncxk7BIDnWw7luSCxrtu+9beQmew5L2o4uai8qemIA46BhjrXgnLdLnFTWnl3/PA7JIEaDXhKoSl0fjdcv8lp5a2nc9WKtOP5Y4h19CtakNveJ0pKQzLRearWy09WYMqEffRDZtcCD5kg/oT9UWHlbQSa4D+rjpp9y6p8wCSUtSE0iDWxSFoCgIVie2N+UcptKO21FK4AN9bA9LAFN16mAbbjxRl2RAHotLa2NXttjyhSHevegs2VYxriq+nwN/iFsy+RdLGMdXVXK672/opnbhFJ8wxDIeB32Q+IKMiVtNh3CkcSe2HHSjjtIsMYtmcfDmLUlDR0JdFr8FvDJk4IjlGAnvKFYVTl77I06wL56AvBB3pRvfMrBKNqvGJ9xneQVaQldLbgXc0GVqiyhZNIrPaGuBJhwA+udpYWENMxRjpWO8Gu1mw7Rp/7ggwDZqDkjc0HE/VHWmDNCovSeAKhBmwSHiCB/dcTWcp68ESXxHpRLq7wuaWZpRdm9+xxUWiYvfvAl2oLmNiggt1Vc7LRGBZ7uimD9zQWyEPFDyug
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(478600001)(8936002)(2906002)(186003)(16526019)(83380400001)(31686004)(36756003)(86362001)(316002)(2616005)(66946007)(66556008)(66476007)(4326008)(16576012)(4744005)(956004)(26005)(53546011)(8676002)(38100700002)(6486002)(31696002)(5660300002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OW1YQ3VpMkVCUHRzY0p1Nmh0Q1ZnRnNjaml1VTZCSTNac25acE5SWWlSOURH?=
 =?utf-8?B?QitzdXB3clJYRlVTSlYzRXlNZnU1R1Njc3RYbG5Ma2tqU2JZdW11aDRwRTlh?=
 =?utf-8?B?aVBtZkdmR2QrQVd1QXdRYytvZytjdkdvdy9LRWV2d1ZuUEw0ZmE1SGNSNEFE?=
 =?utf-8?B?R2Z1akJQOGdueG10b3R5Ly9rVHVrNFpCOVZMa1ErMnNVWUhXeUdKRjR4MWhW?=
 =?utf-8?B?V05BRFFjU1VkMmNMVjFBdTg2WUFKQzM1V3FaLzdFLzNNYlNhVFNTb0ZJMldZ?=
 =?utf-8?B?c1pwVDJlZ0FtVlRiL3JEc0xkWCt4Qm1COGFwTXREWWlabWJFemoxWFZIZnhr?=
 =?utf-8?B?NmpvU2h3RThLVkgzUHVROEdZOHE2NFVMa2VVaFB6U1lBMmIyQmhSWXEvOHN0?=
 =?utf-8?B?NTd6N2E1N1dkbG8vZnFITVBxYUdrV211dE5BSWpTT3VLcXNQSnJwZWhyTkRB?=
 =?utf-8?B?a2JLRTJIdzFpWE4xTWFxSnRscnppbXFMVmJ2RzRTZEtpUWNhZTc0ZEg5eERN?=
 =?utf-8?B?M1Zoa0Q5bjhHNVpmVlJVOHU1WlMvZnYzTmpPS2JOamlHbGVZRzZPQjBnd3ln?=
 =?utf-8?B?M0lIenVGSk1lNDhtQXZFS1V3WGc2Vk8yR1hLWE0rT1ZJcWZwSmVpYlNObytG?=
 =?utf-8?B?TXQ5cHRPYm1MamM4bDM3aFdlL1ZZQXVQMnNVZ2xQaC9KREJpN0RnSm1pbk9s?=
 =?utf-8?B?TEd0djdDZ1E4eDEyS28xcUE0dm1XeWYrR292K2ZJU0tHM21Lc3BJeTI0aEl4?=
 =?utf-8?B?T0Nyb1dLbUNodExuRGsrVmEwb2JFT1VMRDFqMlpCdGpXbWRJb1ZDdTFvZ1Rv?=
 =?utf-8?B?cnJuT0xnaXpMMDRadUN3bUEwQlZ3aENXU0w3eU9rK3g1RVJhVzk1U1pMYjRK?=
 =?utf-8?B?K0llblJFWTQxT29EVWJsNGJERzhtMXdrbk5ScW03ZkRERWdCczBqbUNxNVor?=
 =?utf-8?B?VzdQM3RScFBwVlZBQlpIQ1ZuY2F1TTJDRlVRM0dtUXpPK0dFZFdPajR1dld5?=
 =?utf-8?B?bGYrYXNOazFBQU5KYUhUSWhSdi9EeG0xUTJtb01STjlocDgzcGhvcGJxVnhX?=
 =?utf-8?B?d1kySlBTYjZWczltZzdpWHdOZi85NHBGakNYNG8zY1NMZ256L29IZVV6K3B5?=
 =?utf-8?B?N3N3S0ZrcDczQi9XMUZmSTQ3Y0xiRm55L1gwcFp5QllZdDhEOHdHdU80eEZY?=
 =?utf-8?B?dm8zbE9FOXQxempKcHNpRVhmNS9QMXJGM213SU9nd3VaMXN2WEYvdFZoSUZX?=
 =?utf-8?B?OWFzTThnV3FRTUxOdWFRV0NrUGdubmtXcElKMmlKU0wzbnZiVDRIMW1XK042?=
 =?utf-8?B?d2VhUlVjQXBRUVRNNWhoL1hlVEl3VEpEVm9aMVBLc3A0TFcvWTRmbU5ndHlT?=
 =?utf-8?B?Y0F2N0Jockc1WVk4ZFdkZldpcHkwbHhZR3IvSG83M0RRd2prOG4wVlhrLzBM?=
 =?utf-8?B?Qk1zWVdyVzArdzhtdHZsaWVNcUJVUmV1QXIwdFR1b2xWK29ZWXArRnpvMDAy?=
 =?utf-8?B?M0NRc1JoUVhSRTR2V0RLYk1VT0MwcHJxMUYxeUE1RSt2Y1BPVDEveXd6T2Vl?=
 =?utf-8?B?UVM5STlFelNvejR5Sy82emdqbUdybUZJSWZTRGRvQ2NGOHdRWVRmQ0lJak9P?=
 =?utf-8?B?ODZBTlR1eFNhaUIwN01RVytYK25xdm41UmZqaVlIT25PZFBLaU40NmZzSi9v?=
 =?utf-8?B?ZmNtYUprOEhGYVR2NEVGNTBtdXppbTAzZFFXUVVLcEo4bWtMU2w5VUV3WmY4?=
 =?utf-8?Q?s1WmEn+2uQisXk8IfidaNM3/FYApEKjafwqnGzG?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be698950-23c9-459f-987b-08d917069d4b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 18:32:23.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYfpThw95QD2l9w/qzVwB6PpgI5YQSn3UoWFJvSu2P5XugAOSJ3x7JvWV+ROZKwEs2owqEVd/oEp+S7PXN612g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6205
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/14/21 10:49 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation of fifo is lacking an allocation failure check, so
> fix this by adding one.
> 
> In the case where fifo->static_buffer fails to be allocated the
> error return path neglects to kfree the fifo object. Fix this by
> adding in the missing kfree.
> 
> Kudos to Dan Carpenter for spotting the missing kzalloc failure
> check.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Add missing allocation failure check
>      Update $SUBJECT to reflect this extra change

Looks good. Thanks. I'll push it through drm-misc-next.

z
