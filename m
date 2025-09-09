Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96CB4A6DD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2110E670;
	Tue,  9 Sep 2025 09:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A80mEWMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453F10E670;
 Tue,  9 Sep 2025 09:10:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76e4f2e4c40so4174639b3a.2; 
 Tue, 09 Sep 2025 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757409052; x=1758013852; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CrZUr9P7TcE3YFVIZvDzSstHd9MmX3+aTHo5NK6edbE=;
 b=A80mEWMcT/hTVDPMbIkSyvS0hxdFtDnmjpdNT74V35lTip9YUZE/ViuGzyTY0Ecf4l
 kH2f9c+MC9BjAXQv2zPmxNM6/qAcucPVHPzEkOaMThoyebWuQ2qOMWtK52DjtpzDsNJt
 rXgmVNTDVE4BBeL5UCRFMJ/uJxU5KPbsZbEnDLX+5AYT9DRkxU/LqVOs8lvA8x7NsAtz
 vrFvWad+eVNY3EbnHXTTn1lppO3zNfBGkPAXcLk94xhBaJ0QA1GfftZBHGC2E1K5O8N9
 R73yuvIFYlTskyFHIgViiGK2K1YCanr7CBCJTwFYoDE1pIlJFNju/CWr0JvsZM/gjz6Z
 AGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757409052; x=1758013852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrZUr9P7TcE3YFVIZvDzSstHd9MmX3+aTHo5NK6edbE=;
 b=UNOdqEo7xeqNCydQPJlNMtjamgt2PrNlnIMymL9rs+p6JOYSYQsr07JK2yQrjJkq9b
 5SD2ftV2LEBQ5Ih/SLe2zp5swqre14egKnMNGUPPontHlyCzRBIVgJGmsJzCXGUk5r2z
 bUlUgGco6U4bSmN/c4FLxS3TxCUq/57Z2vxRxAYskwr4CDPPvimbnMICCaRAGEHNVZQC
 wZmJ/j3BNtL2K+zOepTfPRnkJ7dFSVJQ5yMJ7hxYJvAM15Hegyy5s+Rw/LIaDCqbm9Wp
 FmkJn3bEz7xF30ytYe/nZnXocIqPQq6XujdQQiQMa8sqXsDOx74Tt6ZfvC8lCjnOiySO
 T+Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp2irJtdd/TBT2b7PEp8VI65Rhb8UlySK3ekOnRpl+Y8sTq/sii3XH7GdUcGVtiA5XotSkphTA@lists.freedesktop.org,
 AJvYcCWup4Oj8Rb59Z6TDS6z/a9BVP7u8U4cuG3fjLTlmtxZEB1latfpfsKD8B5+hHoYFXEBIrbhSzd4jsUF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpCSEkhrdh0Gldw4T9irbDVVg7PSlGZzjEMit6GthkKl9piQmu
 zrJZa7m4UlNtbDk84kvS/eL2AVXrgakvL49BGTCPYxLhALoWP526ppuv
X-Gm-Gg: ASbGncupc9WgRFp/qM6oyQvqajlxUAd75GgBjXQJqoSlVgWFJgaosFVIczp2JIkFwCN
 Rm5Z5A+gaY26FW/CFbyUSDu7E38mKdN4sdUfUY0VfkAnAQbwrSMVJARk7jlAg3wPmh0p3tUbjyh
 ErpbE1j59h3X5NOwarNU7DN7717nsuSdfIwdBw3wj+BGpIdCiy5DpjKGmHCNWcTPaDiU4AYU9Fl
 mfgpGCdx+cVnWYGVitIcyrUh7Xo7qfpdOiZkARK+0H4RxOLNJ5OHCUK7Q9dOOM2EQzsKskXWRGJ
 j2HrcpF3eKRN45LaJ2iaXx26IDSbh6NfcUICwNo/aVfZPsqZanAS+yIZpPRwhkDF5PhtijKG2GE
 WRyhSaHzMWlKzTrhhKVfJ/aojblLHKxBEIdUEz3GYfp3Nmx1f3+9pW0GRGIXx
X-Google-Smtp-Source: AGHT+IG55otu4hEX5eJB5CsZDymIFIL4KDTOYyBrId2Avk8r9GKQj3jKXMv0L2jkldFhnG9/lPdGGA==
X-Received: by 2002:a05:6a00:84c:b0:772:3f03:f3f4 with SMTP id
 d2e1a72fcca58-7742dd52bfcmr14841662b3a.14.1757409052123; 
 Tue, 09 Sep 2025 02:10:52 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774661247cdsm1448905b3a.33.2025.09.09.02.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 02:10:51 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:10:47 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Alex Hung <alex.hung@amd.com>
Cc: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>, zaeem.mohamed@amd.com,
 wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com,
 jserv@ccns.ncku.edu.tw, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/amd/display: Optimize remove_duplicates() from
 O(N^2) to O(N)
Message-ID: <aL/vF2Q075yTzUqP@visitorckw-System-Product-Name>
References: <20250824182359.142050-1-visitorckw@gmail.com>
 <20250824182359.142050-3-visitorckw@gmail.com>
 <0ed3fa16-9e0d-4f8d-ac22-c9f6b541ae8b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ed3fa16-9e0d-4f8d-ac22-c9f6b541ae8b@amd.com>
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

On Mon, Sep 08, 2025 at 11:10:30AM -0600, Alex Hung wrote:
> 
> 
> On 8/24/25 12:23, Kuan-Wei Chiu wrote:
> > Replace the previous O(N^2) implementation of remove_duplicates() in
> > with a O(N) version using a fast/slow pointer approach. The new version
> > keeps only the first occurrence of each element and compacts the array
> > in place, improving efficiency without changing functionality.
> > 
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Verified correctness using the following simple unit test:
> > 
> > double arr1[] = {1,1,2,2,3}; int size1=5;
> > remove_duplicates(arr1,&size1);
> > assert(size1==3 && arr1[0]==1 && arr1[1]==2 && arr1[2]==3);
> > 
> > double arr2[] = {1,2,3}; int size2=3;
> > remove_duplicates(arr2,&size2);
> > assert(size2==3 && arr2[0]==1 && arr2[1]==2 && arr2[2]==3);
> > 
> > double arr3[] = {5,5,5,5}; int size3=4;
> > remove_duplicates(arr3,&size3);
> > assert(size3==1 && arr3[0]==5);
> > 
> > double arr4[] = {}; int size4=0;
> > remove_duplicates(arr4,&size4);
> > assert(size4==0);
> > 
> >   .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c | 18 ++++++++----------
> >   1 file changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> > index 2b13a5e88917..5100e0e7af42 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> > @@ -50,18 +50,16 @@ static void set_reserved_time_on_all_planes_with_stream_index(struct display_con
> >   static void remove_duplicates(double *list_a, int *list_a_size)
> >   {
> > -	int cur_element = 0;
> > -	// For all elements b[i] in list_b[]
> > -	while (cur_element < *list_a_size - 1) {
> > -		if (list_a[cur_element] == list_a[cur_element + 1]) {
> > -			for (int j = cur_element + 1; j < *list_a_size - 1; j++) {
> > -				list_a[j] = list_a[j + 1];
> > -			}
> > -			*list_a_size = *list_a_size - 1;
> > -		} else {
> > -			cur_element++;
> > +	int j = 0;
> > +
> > +	for (int i = 1; i < *list_a_size; i++) {
> > +		if (list_a[j] != list_a[i]) {
> > +			j++;
> > +			list_a[j] = list_a[i];
> >   		}
> >   	}
> > +
> > +	*list_a_size = j + 1;
> 
> A corner case needs fixing:
> 
> When input *list_a_size is zero, it will be updated to 1, unlike the
> original code. Maybe a early return when *list_a_size is zero?
> 
I noticed this issue while running my simple unit test.
I forgot to squash the fixup patch before submitting.
Sorry about that.
I'll send a v2 shortly.

Regards,
Kuan-Wei

> Hi Aurabindo,
> 
> Do you have other comments or other concerns?
> 
> 
> >   }
> >   static bool increase_mpc_combine_factor(unsigned int *mpc_combine_factor, unsigned int limit)
> 
