Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928A70FEB0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6A810E5FC;
	Wed, 24 May 2023 19:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132010E5FC;
 Wed, 24 May 2023 19:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+jt2RSEfqhwxDyOrc+gwcLi0+OcYVyaQ+UPmYeN7aioJzPUsSUdhraTdlFkRnBnjxmKwCV3NbDpNdywLYGoCcIj4N/jnh9nYmMerPTBbA8cxpzuYYNp8eEooS4Wsu2XxVDjfjD/fYlNmsfdbs5O6mVDg6/2VevueNaKbhpertWX554brPGUjZ2IbJCMn0oLiXUcHcwP/U7r66a05G4mln35PVNaB4f1Ul9wxF9h289kwhkL3r9GnUHogKEQP+Z1P7tCxC5/jsJ65xnN+8vbF6cpS3pjI/0wbA2sW460V8Yebu9c2R4xjcny79mMOHFI83uBkXeDVeXh3Hcz+XmzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBHu2+/UCu0R+hD5vM2KcrzIMRBakf5fJBR+TB3HPXg=;
 b=C8LjsS6GQWQ8RuF9ej7asArFn69z2MKXZ06BlXssHBUA+WcdRXeSozXhNqp5RYw7WPlAzN6b350tSti0cMtLCGse6z7Tb3pp9jlhNu1S/kpjTgfaVpNk3A/5XuB4pEemA7fXTN6xr4fdKPHNhZplCIjYGXZFIay9BefraiOcSkQi3mGzxdddw/KnkWT03jiij+oTjF8uQS8FxStGERi/UHp6ZfZtFL2D6249zIJOGSyeZ0nnLIC0miwcAJsQKDTJotw5vFk/KubT6GW1GXSqldBOtNUC+tjapB3Oh9cI7cqoZ9RPNJxZTBFefKwSagnoCHE7pwwASlqhzzridAZaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBHu2+/UCu0R+hD5vM2KcrzIMRBakf5fJBR+TB3HPXg=;
 b=sOCM/MeVCtUgX//78ybBGozFkkF1+H4n8ehFcpd2LmYnm3ebeJIXs8Lb1XXMe7aSZS8gtPUn71gMJ36tx2efqtUO9tTMDgC8zwT38BicdQ5Gu6dM7Dg/z+qJctggIlw3VQyzyhUef3i0tRm5o6PED2Z6XP/uMiw/zn4S7AvfVNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 19:46:00 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 19:46:00 +0000
Message-ID: <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
Date: Wed, 24 May 2023 15:45:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
Content-Language: en-US
To: "Russell, Kent" <Kent.Russell@amd.com>, "Ho, Kenny" <Kenny.Ho@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, "Mahfooz, Hamza"
 <Hamza.Mahfooz@amd.com>
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <DM6PR12MB3996C4248CBC968A7B08341583419@DM6PR12MB3996.namprd12.prod.outlook.com>
 <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::32)
 To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4500:EE_
X-MS-Office365-Filtering-Correlation-Id: e241a2a0-bc06-4910-4574-08db5c8f7fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eisKqwy98aMzpjKGKb2T7eZ7N0zQEeDA0tDwUN7kSJVIBqwViggXks8Ad0itPQMYd+TflpHP5li7Jua22/uNGiaiftfVULjSsiFpATCODue+ScTSZH4eWXq6ADx/wd+At8wo/7O+I/IogPK5Ioqn66sx2mlRyOce1xy79gmcwXBYkgpdAcauM9+sAASIZhNqcbHpg/BAN8eMxhpgOQPrkmK8NjKUCHjigunJsIgJo5XCox5mTvnHiP+YtoUgKQOc6rQqB8ypnCWtpZblmu0aW4LYcZfQF+dFZpnZlgOjngfelrXc2Bi8R6CQ9D/B6oijhjLsIzU+WsiQAm4+aazwvK7+Za4ORuv0jJouzB5pJV5zdRpS7Z3q+8KC9bg6KtrkfIi29xwFofIa0BIU4ucGiR8t7NT7IqEggbZOorGG8/VxfwC1MIUmLd8qK/HQ0TidOB9poQjTeDJyyEXC+WGRCIV2rWI4NP8HjkwTX+KlU0Lvt7VWm8mffbvo62f9DvmJBitJ2j/+WjPCBB6o6rikdt9vm4CTkTvHeagXKvBzHQrGGEuUag0v4Lta/xvXzrrnx+vAR0iSp3SSEVBKq/PegWs82RURNmfxzaBS+Uph234YA8eagUq3DcS8GTdW2+fiEyL0p4zkHScuv748EwcBeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(26005)(6506007)(6512007)(53546011)(2906002)(44832011)(186003)(2616005)(36756003)(83380400001)(38100700002)(316002)(6666004)(66946007)(66476007)(66556008)(4326008)(6636002)(86362001)(36916002)(41300700001)(6486002)(54906003)(478600001)(110136005)(31686004)(31696002)(8936002)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdIYjZ3MWthT3FYUkVKZTR2YTRYalhkbVNFeklObjJhSTNuTHJMSVZRSHVS?=
 =?utf-8?B?cE5nSmNRQ2dWQU1nSXZmNXVPaGphNjBPMXZUMDFycVkyVUJuL0dhdWpmRDZK?=
 =?utf-8?B?N2pSMjhyRWFNSCtTeWoxdDFhNEVPRFR4eG1YZXA4N0dhZW5TZnVoMUJtM0Jy?=
 =?utf-8?B?dTQ5QndIZ1Y1ZzRrcE1qUnh0cXlsU2daQzFacVcrVDEzOXhaemxBbDlPUUt1?=
 =?utf-8?B?ZTZMaXhPdlZzRHFwU011RGRCS3EwYmFjVjF4T3dCZ1g3Tmk1eWMyWUVVK3lI?=
 =?utf-8?B?djZ0K1ZLTVFUb2hqOXFUaGVMSFh0djBnb09EOU9OTG9qbHZ1SmlDcmd4Mjh6?=
 =?utf-8?B?aU1LRHJ4Y01XR1ZPTXYrMTc0Tk4wRURJMkVXQjRFTnFxSjk5WFFwV0xpOU1w?=
 =?utf-8?B?bUM5QUNxZ1EwVll5V0JFTGJUQ3dIbUgrOWNiblRCSmZLSmpIL2RNeEs3aHk1?=
 =?utf-8?B?V2piQ3ZudTVoQUg3ODNlOE9Sc2w1M3FUZit0bVhXQ3ZwUDVWbFVwUmtTTXI1?=
 =?utf-8?B?aCswUWltanNCYStpcTFwa0FtSnk2a1A5bll6ejQrSDRRMmljZzhaeGpQMndn?=
 =?utf-8?B?WjQ1emtWWXZEL0JySWJ6SWNTdGRzUGZYYUpZNjd0Rzl5c2ozdUR5dWtjeGgw?=
 =?utf-8?B?RUxOVEo0K0NWZWlGOG5PNTg1T1MrK0ZmTHFLMnlpTktlejNSbDVCaW80MTZm?=
 =?utf-8?B?RlNpR21XRmxEdHRjckVhcytOQm9wY1BqdjQrYkJkRFM0ZjY2L0pNZzFNWExV?=
 =?utf-8?B?YTdiWFlxZHNzOTZFWHlJamJSUXhoSFdDakhRZTFXaWtTcXlkK1cxcUNVTEIr?=
 =?utf-8?B?OExabEdoVkFjUkNwYXdnU2lJWnlHNUxxcFJBai8zYXkrOUJyaFVEMVBxT3A3?=
 =?utf-8?B?YmlURDdwZlBBS1E3SUZoVkR1Y0dEeG1abUR1aDF2LzlrTjJ5enZ5TFlma3FK?=
 =?utf-8?B?clY2dVZHT2dtZkIxaHFaZFlQTE16K01XMFIzY2QyL2xXWElEWm03eWdjNzdS?=
 =?utf-8?B?b0hxWDMyQ1dqQ3VoVjVZS3pUNk0zR0xDZlVMb2NjTEtaOEtudWJ1dnFOU3k1?=
 =?utf-8?B?NUY2cDIzL2RGN2srcjRWclp5eDZhSmlIL3ZjV3loTnBaQ1RMbkdaV2g2cnZy?=
 =?utf-8?B?eFViQUlmUVc4L2VrdWNybk5oWXl4Tzh4Qm5NdnZqRWs3YjRwT1h4SGhYbDlj?=
 =?utf-8?B?SzNOYk5aVTdHZUhNZ1k3ZzZodi9EUEFBWDRtS0Yyc3FPNVlVa0JxOUlTdVQr?=
 =?utf-8?B?Mi92bjByczR0TlYrclNudUVObWc0MzFkMUdHaFdCaXlYSERYOG5Jazh3b05D?=
 =?utf-8?B?eGJia09SVVlKcjlORERPci9PU01yMlNVVk9oejFQbCt6WjZwekxMRE1qSnM3?=
 =?utf-8?B?MkF1OXFmK3d1aUV2Q2hJY3k0QmxLV3ZHbE5JREVsT1dQalo1V2hVUEdMNkdh?=
 =?utf-8?B?K2xtNDBXR1krQ2NEYS84ektQU2lNYVprSEhvNFlRL2ZOR1F6Y2l0a1pGRWR6?=
 =?utf-8?B?Z28wc2cyN2lYUnc4VnU4OU9RNC9nOG5MOW5mdUJoZ2NuV1ZYZE9PU1JqTHJT?=
 =?utf-8?B?SlF3T2hoUExHYzFaa0JGeEF3YWcxQ3N2c3lnV1ZNUUMvV1JPaExET2ZlblZq?=
 =?utf-8?B?alNJVitNZE1HM01hMDUzMzkrTVFGeWtzcGlMODloL281Q3BncG1OVVBOYmwr?=
 =?utf-8?B?WlFLWkJCN01rL2o3VzVobjNtVTBzaHk0MFJFSjV3SU55ZmgzaDdGU3ZGeDZO?=
 =?utf-8?B?d2xQc1pCZjFHODdmNE9mVEpJL3dsOWV6ZkY0ZTNid0JhWXNwckF2Q3dHSFRJ?=
 =?utf-8?B?UHVMbWJpWnM2ZVk2TUtKdnBycTMzdm5LR2FycFRLSnFsUW1CNVlKV0M4UVJO?=
 =?utf-8?B?UXFTelp0VXNOSHJlSGE4REladGZodDRCTU1TajFQT1QvL084Q0RSeENUVmE3?=
 =?utf-8?B?cmZwbG9YVHM1MjdxUmtGTFBKMERHL0RycFlabHp6RThuRit3N3ZjbXhkRTVU?=
 =?utf-8?B?OVB5YU5NcWo3eGtINER1OUVqZUxHYzc4dVFCbi9sdFVtd2lNdzN0Y2FkYzI1?=
 =?utf-8?B?N245anlhODNjenlXVkdVaXNnYVl3d3hjT3JjcTZ2d2ZIRGpIN0h0ZVdXd1ZU?=
 =?utf-8?Q?MI+hzZieprPLSnd8kgr6H9TIg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e241a2a0-bc06-4910-4574-08db5c8f7fdd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:46:00.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vcic4RCRu2cEtTx7SV0nDIVODwVk1xC/fPcdoUqyyehaca3bY+BTpSArPJpSNu17V8nzJ0mi2ALQ8Djr2qAWsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sure, I think we tried enabling warnings as errors before and had to 
revert it because of weird compiler quirks or the variety of compiler 
versions that need to be supported.

Alex, are you planning to upstream this, or is this only to enforce more 
internal discipline about not ignoring warnings?

Regards,
   Felix


On 2023-05-24 15:41, Russell, Kent wrote:
>
> [AMD Official Use Only - General]
>
>
> (Adding Felix in CC)
>
> I’m a fan of adding it to KFD as well. Felix, can you foresee any 
> issues here?
>
> Kent
>
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of 
> *Ho, Kenny
> *Sent:* Wednesday, May 24, 2023 3:23 PM
> *To:* Alex Deucher <alexdeucher@gmail.com>; Mahfooz, Hamza 
> <Hamza.Mahfooz@amd.com>
> *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Wentland, Harry 
> <Harry.Wentland@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, 
> Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org; 
> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Daniel 
> Vetter <daniel@ffwll.ch>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Koenig, 
> Christian <Christian.Koenig@amd.com>
> *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile 
> checks
>
> [AMD Official Use Only - General]
>
> [AMD Official Use Only - General]
>
> (+ Felix)
>
> Should we do the same for other modules under amd (amdkfd)?  I was 
> going to enable full kernel werror in the kconfig used by my CI but 
> this is probably better.
>
> Kenny
>
> ------------------------------------------------------------------------
>
> *From:*Alex Deucher <alexdeucher@gmail.com>
> *Sent:* Wednesday, May 24, 2023 3:22 PM
> *To:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> *Cc:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
> Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Ho, Kenny <Kenny.Ho@amd.com>; 
> Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, Rodrigo 
> <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org 
> <linux-kernel@vger.kernel.org>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>; 
> Deucher, Alexander <Alexander.Deucher@amd.com>; David Airlie 
> <airlied@gmail.com>; Wentland, Harry <Harry.Wentland@amd.com>; Koenig, 
> Christian <Christian.Koenig@amd.com>
> *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile 
> checks
>
> On Wed, May 24, 2023 at 3:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com> 
> wrote:
> >
> > Currently, there are quite a number of issues that are quite easy for
> > the CI to catch, that slip through the cracks. Among them, there are
> > unused variable and indentation issues. Also, we should consider all
> > warnings to be compile errors, since the community will eventually end
> > up complaining about them. So, enable -Werror, -Wunused and
> > -Wmisleading-indentation for all kernel builds.
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Kenny Ho <kenny.ho@amd.com>
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> > v2: fix grammatical error
> > ---
> >  drivers/gpu/drm/amd/display/Makefile | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/Makefile 
> b/drivers/gpu/drm/amd/display/Makefile
> > index 0d610cb376bb..3c44162ebe21 100644
> > --- a/drivers/gpu/drm/amd/display/Makefile
> > +++ b/drivers/gpu/drm/amd/display/Makefile
> > @@ -26,6 +26,8 @@
> >
> >  AMDDALPATH = $(RELATIVE_AMD_DISPLAY_PATH)
> >
> > +subdir-ccflags-y += -Werror -Wunused -Wmisleading-indentation
> > +
>
> Care to enable this for the rest of amdgpu as well?  Or send out an
> additional patch to do that?  Either way:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Alex
>
> >  subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
> >  subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
> >  subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
> > --
> > 2.40.1
> >
>
